import Base: parse

function parse(::Type{Orthography}, s::String)
    parsed = []
    for c in s
        push!(parsed, ORTHOGRAPHY_TYPES[Symbol(c)])
    end
    return Orthography(parsed)
end