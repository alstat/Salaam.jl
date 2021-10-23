abstract type AbstractCAMeLDB end

mutable struct MorphologyDB <: AbstractCAMeLDB
    fpath::String
    flag::Union{Symbol,Vector{Symbol}}
    defines::Dict
    default_key::String
    defaults::Dict
    order::Union{Nothing,Vector{SubString{String}}}
    compute_feats::Set
end

MorphologyDB(fpath, flag) = MorphologyDB(
    fpath, flag, Dict(), "pos", Dict(), nothing, 
    Set()
)

struct Analyzer
    db::MorphologyDB
end

struct DatabaseParseError <: Exception
    msg::String
end
function Base.show(io::IO, e::DatabaseParseError)
    println(io, "DataParseError: ", e.msg)
end

function Base.parse(::Type{MorphologyDB}, fpath::String, flag::Union{Symbol,Vector{Symbol}})
    db = MorphologyDB(fpath, flag)
    parse_dbfile(db)
end

function parse_default_line_toks(toks::Vector{SubString{String}})
    res = Dict()
    for tok in toks
        subtoks = split(tok, ":")
        if length(subtoks) < 2
            throw(DatabaseParseError(string("invalid key value pair '", tok, "' in DEFAULTS")))
        end

        feat = subtoks[1]
        val = join(subtoks[2:end], ":")

        if val == "*"
            res[feat] = nothing
        else
            res[feat] = val
        end
    end
    return res
end

function parse_dbfile(db::MorphologyDB)
    lines = readlines(db.fpath)
    # process DEFINES
    for line in lines
        if line === "###DEFINES###"
            continue
        end

        if line === "###DEFAULT###"
            break
        end

        toks = split(line, " ")

        # check if line has the minimum viable format
        if length(toks) < 3 || toks[1] !== "DEFINE"
            throw(DatabaseParseError(string("invalid DEFINES line '", line, "'")))
        end

        new_define = toks[2]
        val_set = Set{String}()

        for tok in toks[3:end]
            subtoks = split(tok, ":")

            # if it's a malformed entry, ignore it
            if length(subtoks) !== 2 && subtoks[1] !== toks[2]
                throw(DatabaseParseError(string("invalid key value pair '", tok, "' in DEFINES")))
            end

            # if it's an open class, we use nothing instead of a set
            if length(toks) === 3 && subtoks[2] === "*open*"
                val_set = nothing
                break
            end

            push!(val_set, subtoks[1])
        end

        db.defines[new_define] = val_set isa Nothing ? nothing : collect(val_set)
    end

    # process DEFAULTS
    for line in lines
        if line === "###ORDER###"
            break
        end

        toks = split(line, " ")
        if length(toks) < 2 || toks[1] !== "DEFAULT"
            throw(DatabaseParseError(string("invalid DEFAULTS line '", line, "'")))
        end

        parsed_default = parse_default_line_toks(toks)

        if db.default_key ∉ keys(parsed_default)
            throw(DatabaseParseError(string("DEFAULTS line '", line, "' missing '", db.default_key, "' value")))
        end

        dkey = parsed_default[db.default_key]
        db.defaults[dkey] = parsed_default
    end

    # process ORDER
    for line in lines
        if line === "###TOKENIZATIONS###"
            db.compute_feats = Set(db.order)
            break
        end

        toks = split(line, " ")

        if db.order isa Nothing && length(toks) < 2 && toks[1] !== "ORDER"
            throw(DatabaseParseError(string("invalid ORDER line '", line, "'")))
        end

        if toks[2] ∉ keys(db.defines)
            throw(DatabaseParseError(string("invalid feature '", toks[2], "'")))
        end
        db.order = toks[2:end]
    end

    # process TOKENIZATIONS
    for line in lines
        if line === "###STEMBACKOFF###"
            db.tokenizations = Set(db.tokenizations)
            break
        end

        toks = split(line, " ")

        if !isa(db.order, Nothing) && length(toks) < 2 && toks[1] !== "TOKENIZATIONS"
            throw(DatabaseParseError(string("invalid TOKENIZATION line '", line, "'")))
        end

        if toks[2] ∉ keys(db.defines)
            throw(DatabaseParseError(string("invalid feature '", toks[2], "'")))
        end

        db.tokenizations
    end
end