function camel_dialectid()
    dialectid = pyimport("camel_tools.dialectid")
    return dialectid.DialectIdentifier.pretrained()
end

struct DialectIdentifier <: AbstractModel
    model::PyObject
end

function DialectIdentifier()
    return DialectIdentifier(camel_dialectid())
end

function predict(model::DialectIdentifier, sentence::Vector{String}, output::Symbol=:label)
    return model.model.predict(sentence, output)    
end