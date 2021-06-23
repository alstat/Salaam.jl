function camel_reinflector()
    generator = pyimport("camel_tools.morphology.reinflector")
    return generator.Reinflector
end

struct Reinflector
    db::PyObject
end

function Reinflector()
    return Reinflector(:morphology)
end

function Reinflector(db::Symbol)
    if db === :morphology
        return Reinflector(camel_morphology(:r))
    end
end

function (a::Reinflector)(s::String, features::Dict{String,String})
    return camel_reinflector()(a.db).reinflect(s, features)
end