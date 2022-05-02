using Salaam
data = CAMeLData(:morphology)
download(data)

db = MorphologyDB(:egy, :a)
egy_db = load(db)
dump(egy_db)
# delete!(CAMeLData(:all))

db = parse(MorphologyDB, :egy, :a);
db
o = readlines("db/morphology/egy/morphology.db")
d = MorphologyDB(:egy, :a)
parse_defines(d, o)

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

function test(iter=100_000)
    j = 1
    while j < iter
        replace("The quick foxes run quickly.", "fox" => "bus")
        j += 1
    end
end

julia> using BenchmarkTools

@time test(10_000_000)

import timeit
def test(iter=100_000):
    for i in range(iter):
        "The quick foxes run quickly.".replace(u"fox", u"bus")

timeit.timeit('test(10_000_000)', setup="from __main__ import test", number=1)
1.586207215
#delete!(CAMeLData(:all))
rm(Salaam.CAMEL_DISAMBIGUATION * "/", recursive=true)
readdir(Salaam.CAMEL_MORPHOLOGY)

function Base.delete!(data::Symbol)
    if data == :all_db
        rm(Salaam.CAMEL_DATA, recursive=true)
        @info "Successfully deleted db folder"
    elseif data == :morphology
        delete_all_files!(Salaam.CAMEL_MORPHOLOGY)
        @info "Successfully deleted files under the morphology folder."
    elseif data == :disambiguation
        delete_all_files!(Salaam.CAMEL_DISAMBIGUATION)
        @info "Successfully deleted files under the disambiguation folder."
    elseif data == :ner
        delete_all_files!(Salaam.CAMEL_NER)
        @info "Successfully deleted files under the ner folder."
    elseif data == :sentiment
        delete_all_files(Salaam.CAMEL_SENTIMENT)
        @info "Successfully deleted files under the sentiment folder."
    elseif data == :dialectid
        delete_all_files(Salaam.CAMEL_DIALECTID)
        @info "Successfully deleted files under the dialectid folder."
    else
        throw("Unknown value data=:" * string(data) * ", choices are :all_db, :morphology, :disambiguation, :ner, :sentiment, :diaclectid.")
    end
end

function delete_all_files!(path::String)
    all_files = readdir(path)
    for i in all_files
        rm(joinpath(path, i), recursive=true)
    end
end
data = CAMeLData(:disambiguation)
Salaam.CAMEL_MORPHOLOGY