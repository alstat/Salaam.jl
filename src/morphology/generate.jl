function camel_generator()
    generator = pyimport("camel_tools.morphology.generator")
    return generator.Generator
end

struct Generator
    db::PyObject
end

function Generator()
    return Generator(:morphology)
end

function Generator(db::Symbol)
    if db === :morphology
        return Generator(camel_morphology(:g))
    end
end

function (g::Generator)(lemma::String, features::Dict{String,String})
    return Analysis(camel_generator()(g.db).generate(lemma, features))
end