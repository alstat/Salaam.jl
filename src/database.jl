function camel_db()
    return pyimport("camel_tools.morphology.database")
end

function camel_morphology(flags::String="a")
    return camel_db().MorphologyDB.builtin_db(flags=flags)
end