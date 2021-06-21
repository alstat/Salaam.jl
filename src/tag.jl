function camel_tagger()
    tagger = pyimport("camel_tools.tagger.default") 
    return tagger.DefaultTagger
end

struct Tagger
    disambig::PyObject
    type::String
end

function Tagger()
    return Tagger(camel_disambig(), "pos")
end

function (t::Tagger)(s::Union{String,Array{String}})
    return camel_tagger()(t.disambig, t.type).tag(s)
end