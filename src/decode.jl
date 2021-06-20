function decode(c::Union{Char,String}, encoder::AbstractEncoder)
    return string(encoder.decode[Symbol(c)])
end

"""
    arabic(s::String[, encoder::AbstractEncoder])

Encode the `String` object into Arabic characters. Custom `encoder`
generated from `@transliterator` can be provided, but default is `Buckwalter`.

# Examples
```julia-repl
julia> data = QuranData()
julia> crps, tnzl = load(data)
julia> crpsdata = table(crps)
julia> tnzldata = table(tnzl)
julia> arabic(verses(crpsdata[114])[1])
"قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ"
```
"""
function arabic(s::String)
    trans = Transliterator()
    return arabic(s, trans)
end

function arabic(s::String, encoder::AbstractEncoder)
    words = ""
    for c in s
        if c === ' '
            words *= " "
        else
            words *= decode(c, encoder)
        end
    end
    return words
end