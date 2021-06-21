"""
    tokenize(s::String)

tokenizes the string input s by space, and also tokenizes the punctuations.
"""
function tokenize(s::String, punctuation::Bool=true) 
    if punctuation
        new_s = replace(s, PUNCTUATIONS_REGEX => "")
        punct = eachmatch(PUNCTUATIONS_REGEX, s)
        return string.(vcat(split(new_s), [i.match for i in collect(punct)]))
    else
        return string.(split(s))
    end
end

function camel_morphological_tokenizer()
    morph_tokenizer = pyimport("camel_tools.tokenizers.morphological")
    return morph_tokenizer.MorphologicalTokenizer
end

struct MorphologicalTokenizer
    disambig::PyObject
    scheme::Symbol
    split::Bool
    diac::Bool
end

function MorphologicalTokenizer()
    return MorphologicalTokenizer(camel_disambig(:calima_msa_r13))
end

function MorphologicalTokenizer(disambig::PyObject; scheme::Symbol=:d3tok, split::Bool=false, diac::Bool=false)
    return MorphologicalTokenizer(disambig, scheme, split, diac)
end

function (a::MorphologicalTokenizer)(s::Union{String,Array{String}})
    return camel_morphological_tokenizer()(
        a.disambig, scheme=a.scheme,
        split=a.split, diac=a.diac).tokenize(s)
end