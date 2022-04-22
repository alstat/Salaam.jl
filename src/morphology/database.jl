abstract type AbstractCAMeLDB end

mutable struct MorphologyDB <: AbstractCAMeLDB
    fpath::String
    flag::Union{Symbol,Vector{Symbol}}

    defines::Dict
    defaults::Dict
    order::Union{Nothing,Vector{SubString{String}}}
    tokenizations::Set
    compute_feats::Set
    stem_backoffs::Dict
    
    prefix_hash::Dict
    suffix_hash::Dict
    stem_hash::Dict 

    prefix_cat_hash::Dict
    lemma_hash::Dict 

    prefix_stem_compat::Dict
    stem_prefix_compat::Dict
    stem_suffix_compat::Dict 
    prefix_suffix_compat::Dict

    max_prefix_size::Int64
    max_suffix_size::Int64

    _default_key::String
    _with_analysis::Bool
    _with_reinflection::Bool
    _with_generation::Bool
end

function MorphologyDB(db_name, flag)
    fpath = joinpath(@__DIR__, "db/morphology_db", db_name)

    return MorphologyDB(
        fpath, flag, Dict(), Dict(), nothing, 
        Set(), Set(), Dict(), Dict(), Dict(), 
        Dict(), Dict(), Dict(), Dict(), Dict(),
        Dict(), Dict(), 0, 0, "pos", false, false, false
    )
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

function parse_analysis_line_toks(toks::Vector{SubString{String}})
    res = Dict()

    for tok in toks
        if length(tok) == 0
            continue
        end

        subtoks = split(tok, ":")
        if length(subtoks) < 2
            throw(DatabaseParseError(string("invalid key vaue pair '", tok, "'")))
        end

        res[subtoks[1]] = join(subtoks[2:end], ":")
    end

    return res
end

function striplex(lex)
    return split(lex, r"_|-")
end

function parse_defines(db::MorphologyDB, lines::Vector{String})
    j = 1
    for line in lines
        if line == "###DEFINES###"
            continue
        end

        if line == "###DEFAULTS###"
            break
        end

        toks = split(line, " ")

        # check if line has the minimum viable format
        if length(toks) < 3 || toks[1] != "DEFINE"
            throw(DatabaseParseError(string("invalid DEFINES line '", line, "'")))
        end

        new_define = toks[2]
        val_set = Set{String}()

        for tok in toks[3:end]
            subtoks = split(tok, ":")

            # if it's a malformed entry, ignore it
            if length(subtoks) != 2 && subtoks[1] != toks[2]
                throw(DatabaseParseError(string("invalid key value pair '", tok, "' in DEFINES")))
            end

            # if it's an open class, we use nothing instead of a set
            if length(toks) == 3 && subtoks[2] == "*open*"
                val_set = nothing
                break
            end

            push!(val_set, subtoks[1])
        end

        db.defines[new_define] = val_set isa Nothing ? nothing : collect(val_set)
        j += 1
    end

    return db, j
end

function parse_defaults(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###DEFAULTS###"
            continue
        end

        if line == "###ORDER###"
            break
        end

        toks = split(line, " ")
        if length(toks) < 2 || toks[1] != "DEFAULT"
            throw(DatabaseParseError(string("invalid DEFAULTS line '", line, "'")))
        end

        parsed_default = parse_default_line_toks(toks[2:end])

        if db._default_key ∉ keys(parsed_default)
            throw(DatabaseParseError(string("DEFAULTS line '", line, "' missing '", db._default_key, "' value")))
        end

        dkey = parsed_default[db._default_key]
        db.defaults[dkey] = parsed_default
        j += 1
    end
    return db, j
end

function parse_order(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###ORDER###"
            continue
        end

        if line == "###TOKENIZATIONS###"
            db.compute_feats = Set(db.order)
            break
        end

        toks = split(line, " ")

        if !isa(db.order, Nothing) && length(toks) < 2 && toks[1] != "ORDER"
            throw(DatabaseParseError(string("invalid ORDER line '", line, "'")))
        end

        if toks[2] ∉ keys(db.defines)
            throw(DatabaseParseError(string("invalid feature '", toks[2], "'")))
        end
        db.order = toks[2:end]
        j += 1
    end
    return db, j
end

function parse_tokenizations(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###TOKENIZATIONS###"
            continue
        end

        if line == "###STEMBACKOFF###"
            db.tokenizations = Set(db.tokenizations)
            break
        end

        toks = split(line, " ")

        if !isa(db.order, Nothing) && length(toks) < 2 && toks[1] != "TOKENIZATIONS"
            throw(DatabaseParseError(string("invalid TOKENIZATION line '", line, "'")))
        end

        if toks[2] ∉ keys(db.defines)
            throw(DatabaseParseError(string("invalid feature '", toks[2], "'")))
        end

        push!(db.tokenizations, toks[2:end])
        j += 1
    end
    return db, j
end

function parse_stembackoffs(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###STEMBACKOFF###"
            continue
        end

        if line == "###PREFIXES###"
            break
        end
        
        toks = split(line, " ")

        if length(toks) < 3 || toks[1] != "STEMBACKOFF"
            throw(DatabaseParseError(string("invalid STEMBACKOFFS line '", line, "'")))
        end

        db.stem_backoffs[toks[2]] = toks[3:end]
        j += 1
    end
    return db, j
end

function parse_prefixes(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###PREFIXES###"
            continue
        end

        parts = split(line, "\t")

        if length(parts) != 3
            if strip(line) == "###SUFFIXES###"
                break
            end
            throw(DatabaseParseError(string("invalid PREFIXES line '", line, "'")))
        end

        prefix = strip(parts[1])
        category = parts[2]
        analysis = parse_analysis_line_toks(split(strip(parts[3]), " "))

        if db._with_analysis
            if prefix ∉ keys(db.prefix_hash)
                db.prefix_hash[prefix] = []
            end
            push!(db.prefix_hash[prefix], (category, analysis))
        end

        if db._with_generation
            # fixme: make sure analyses for category are unique?
            if category ∉ keys(db.prefix_cat_hash)
                db.prefix_cat_hash[category] = []
            end
            push!(db.prefix_cat_hash[category], analysis)
        end
        j += 1
    end
    return db, j
end

function parse_suffixes(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        parts = split(line, "\t")
        
        if strip(line) == "###SUFFIXES###"
            continue
        end
        
        if length(parts) != 3
            if strip(line) == "###STEMS###"
                break
            end
            throw(DatabaseParseError(string("invalid SUFFIXES line '", line, "'")))
        end

        suffix = strip(parts[1])
        category = parts[2]
        analysis = parse_analysis_line_toks(split(strip(parts[3]), " "))

        if db._with_analysis
            if suffix ∉ keys(db.suffix_hash)
                db.suffix_hash[suffix] = []
            end
            push!(db.suffix_hash[suffix], (category, analysis))
        end

        if db._with_generation
            if category ∉ keys(db.suffix_cat_hash)
                db.suffix_cat_hash[category] = []
            end
            push!(db.suffix_cat_hash[category], analysis)
        end
        j += 1
    end
    return db, j
end

function parse_stems(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if strip(line) == "###STEMS###"
            continue
        end

        if line == "###TABLE AB###"
            break
        end

        parts = split(line, "\t")

        if length(parts) != 3
            throw(DatabaseParseError(string("invalid STEMS line '", line, "'")))
        end

        stem = parts[1]
        category = parts[2]
        analysis = parse_analysis_line_toks(split(strip(parts[3]), " "))
        analysis["lex"] = striplex(analysis["lex"])

        if db._with_analysis
            if stem ∉ keys(db.stem_hash)
                db.stem_hash[stem] = []
            end
            db.stem_hash[stem].append((category, analysis))
        end

        if db._with_generation
            # fixme: make sure analyses for category are unique?
            lemma_key = analysis["lex"]
            analysis["stemcat"] = category
            if lemma_key ∉ keys(db.lemma_hash)
                db.lemma_hash[lemma_key] = []
            end
            push!(db.lemma_hash[lemma_key], analysis)
        end
        j += 1
    end
    return db, j
end

function parse_prefix_stem(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###TABLE AB###"
            continue
        end

        if line == "###TABLE BC###"
            break
        end

        toks = split(line)

        if length(toks) != 2
            throw(DatabaseParseError(string("invalid TABLE AB line '", line, "'")))
        end

        prefix_cat = toks[1]
        stem_cat = toks[2]

        if db._with_analysis
            if prefix_cat ∉ keys(db.prefix_stem_compat)
                db.prefix_stem_compat[prefix_cat] = Set()
            end
            push!(db.prefix_stem_compat[prefix_cat], stem_cat)
        end

        if db._with_generation
            if stem_cat ∉ keys(db.stem_prefix_compat)
                db.stem_prefix_compat[stem_cat] = Set()
            end
            push!(db.stem_prefix_compat[stem_cat], prefix_cat)
        end
        j+= 1
    end 
    return db, j
end

function parse_stem_suffix(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###TABLE BC###"
            continue
        end

        if line == "###TABLE AC###"
            break
        end

        toks = split(line)

        if length(toks) != 2
            throw(DatabaseParseError(string("invalid TABLE BC line '", line, "'")))
        end

        stem_cat = toks[1]
        suffix_cat = toks[2]

        if stem_cat ∉ keys(db.stem_suffix_compat)
            db.stem_suffix_compat[stem_cat] = Set()
        end
        push!(db.stem_suffix_compat[stem_cat], suffix_cat)
        j += 1
    end
    return db, j
end

function parse_prefix_suffix(db::MorphologyDB, lines::Vector{String}, j::Int64)
    j += 1
    for line in lines[j:end]
        if line == "###TABLE AC###"
            continue
        end

        toks = split(line)

        if length(toks) != 2
            throw(DatabaseParseError(string("invalid TABLE AC line '", line, "'")))
        end

        prefix_cat = toks[1]
        suffix_cat = toks[2]

        if prefix_cat ∉ keys(db.prefix_suffix_compat)
            db.prefix_suffix_compat[prefix_cat] = Set()
        end
        push!(db.prefix_suffix_compat[prefix_cat], suffix_cat)
        j += 1
    end
    return db, j
end

function parse_dbfile(db::MorphologyDB)
    lines = readlines(db.fpath)

    # process DEFINES
    db, j = parse_defines(db, lines)

    # process DEFAULTS
    db, j = parse_defaults(db, lines, j)

    # process ORDER
    db, j = parse_order(db, lines, j)

    # process TOKENIZATIONS
    db, j = parse_tokenizations(db, lines, j)

    # process STEMBACKOFFS
    db, j = parse_stembackoffs(db, lines, j)

    # process PREFIXES
    db, j = parse_prefixes(db, lines, j)

    # process SUFFIXES
    db, j = parse_suffixes(db, lines, j)
    
    # process STEMS
    db, j = parse_stems(db, lines, j)
    
    # process prefix_stem compatibility table
    db, j = parse_prefix_stem(db, lines, j)

    # process stem_suffix compatibility table
    db, j = parse_stem_suffix(db, lines, j)

    # process prefix_suffix compatibilty table
    db, _ = parse_stem_suffix(db, lines, j)

    if db._with_analysis
        for prefix in keys(db.prefix_hash)
            db.max_prefix_size = max(db.max_prefix_size, length(prefix))
        end

        for suffix in keys(db.suffix_hash)
            db.max_suffix_size = max(db.max_suffix_size, length(suffix))
        end
    end

    return db
end