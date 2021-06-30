"""
    encode(s::Union{Char,String}, encoder::AbstractEncoder)

Transliterate the input `String` object using a custom `encoder`. Custom `encoder` is
generated using the `@transliterator`.
"""
function encode(s::Union{Char,String}, encoder::AbstractEncoder)
    words = ""
    for c in s
        if c === ' '
            words *= " "
        else
            if c === '\U0622'
                words *= string(encoder.encode[Symbol('\U0627')], encoder.encode[Symbol('\U0653')])
            else
                words *= string(encoder.encode[Symbol(c)])
            end
        end
    end
    return words
end

"""
    encode(s::String)

Transliterate the input `String` object using `Buckwalter`.

# Examples
```julia-repl
julia> data = QuranData()
julia> crps, tnzl = load(data)
julia> crpsdata = table(crps)
julia> tnzldata = table(tnzl)
julia> basmala = arabic(verses(crpsdata[1][1])[1])
julia> encode(basmala)
"bisomi {ll~ahi {lr~aHoma`ni {lr~aHiymi"
```
"""
function encode(s::String)
    trans = Transliterator()
    return encode(s, trans)
end