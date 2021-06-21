import MLJ: predict

function camel_disambig(model_name::Union{Symbol,Nothing}=nothing)
    disambig = pyimport("camel_tools.disambig.mle")  
    if model_name === :calima_msa_r13
        model_name =  "calima-msa-r13"
    end    
    return disambig.MLEDisambiguator.pretrained(model_name=model_name)
end 

struct Disambiguator <: AbstractModel
    model::PyObject
end

function Disambiguator()
    return Disambiguator(nothing)
end

function Disambiguator(model_name::Union{Symbol,Nothing})
    return Disambiguator(camel_disambig(model_name))
end

function predict(model::Disambiguator, word::Union{Vector{String},Vector{SubString{String}}})
    return model.model.disambiguate(word)
end

# function disambig(s)
#     return camel_disambig().disambiguate(s)
# end