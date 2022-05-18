mutable struct Analyzer
    db::AbstractCAMeLDB
    backoff::Union{String,Nothing}
    norm_map::Union{String,Nothing}
    strict_digit::Bool
    cache_size::Int64
    backoff_condition::Union{String,Nothing}
    backoff_action::Union{String,Nothing}
end
struct AnalyzerError <: Exception
    msg::String
end

function Analyzer(db; backoff=nothing, norm_map=nothing, strict_digit=false, cache_size=0)
    analyzer = Analyzer(db, backoff, norm_map, strict_digit, cache_size, nothing, nothing)
    if !(db isa MorphologyDB)
        throw(AnalyzerError("DB is not an instance of MorphologyDB"))
    end

    if db.flag != :a
        throw(AnalyzerError("DB does not support analysis"))
    end

    # if norm_map isa Nothing
    #     norm_map = DEFAULT_NORMALIZE_MAP
    # end

    if backoff .∈ Ref(BACKOFF_TYPES)
        if backoff isa Nothing
            analyzer.backoff_condition = nothing
            analyzer.backoff_action = nothing
        else
            backoff_toks = split(backoff, "-")
            analyzer.backoff_condition = backoff_toks[1]
            analyzer.backoff_action = backoff_toks[2]
        end
    else
        throw(AnalyzerError("Invalid backoff mode '" * string(backoff) * "'"))
    end

    if cache_size isa Int64
        if cache_size > 0
            cache = nothing # to fix
        end
    else 
        throw(AnalyzerError("Invalid cache size " * string(cache_size) * "'"))
    end
    return analyzer
end

function normalize(analyzer::Analyzer, word::String)
    if analyzer.norm_map isa Nothing
        return word
    else
        return analyzer.norm_map.map
    end
end

function combined_analyses(analyzer::Analyzer, word_dediac::String, prefix_analyses::String, stem_analyses::String, suffix_analyses::String)
    combined = []
    for p in Iterators.product(prefix_analyses, stem_analyses)
        prefix_cat = p[1][1]
        prefix_feats = p[1][2]
        stem_cat = p[2][1]
        steam_feats = p[2][2]

        if stem_cat in analyzer.db.prefix_stem_compat[prefix_cat]
            for (suffix_cat, suffix_feats) in suffix_analyses
                if (!(stem_cat .∈ Ref(Set(analyzer.db.stem_suffix_compat)))) || 
                    (!(prefix_cat .∈ Ref(Set(analyzer.db.prefix_suffix_compat)))) ||
                    (!(suffix_cat .∈ Ref(Set(analyzer.db.stem_suffix_compat[stem_cat])))) ||
                    (!(suffix_cat .∈ Ref(Set(analyzer.db.prefix_suffix_compat[prefix_cat]))))
                    continue
                end

                merged = merge_features(analyzer.db, prefix_feats, stem_feats, suffix_feats)
            end
        end
    end
end
# function (a::Analyzer)(s::String)
    
# end
# function camel_analyzer()
#     analyzer = pyimport("camel_tools.morphology.analyzer")
#     return analyzer.Analyzer
# end

struct Analysis
    data::Union{Vector{Dict{Any,Any}},Dict{Any,Any}}
end

# struct Analyzer
#     db::PyObject
# end

# function Analyzer()
#     return Analyzer(:morphology)
# end

# function Analyzer(db::Symbol)
#     if db === :morphology
#         return Analyzer(camel_morphology())
#     end
# end

# function (a::Analyzer)(s::String)
#     return Analysis(camel_analyzer()(a.db).analyze(s))
# end