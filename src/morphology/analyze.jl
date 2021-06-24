function camel_analyzer()
    analyzer = pyimport("camel_tools.morphology.analyzer")
    return analyzer.Analyzer
end

struct Analyzer
    db::PyObject
end

function Analyzer()
    return Analyzer(:morphology)
end

function Analyzer(db::Symbol)
    if db === :morphology
        return Analyzer(camel_morphology())
    end
end

function (a::Analyzer)(s::String)
    return camel_analyzer()(a.db).analyze(s)
end