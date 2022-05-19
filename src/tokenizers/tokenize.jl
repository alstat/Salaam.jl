"""
    tokenize(s::String)

tokenizes the string input s by space, and also tokenizes the punctuations.
"""
function tokenize(s::String, punctuation::Bool=true) 
    if punctuation
        new_s = replace(s, PUNCTUATIONS_REGEX => "")
        punct = eachmatch(PUNCTUATIONS_REGEX, s)
        return string.(vcat(split(new_s), [i.match for i in collect(punct)]))
    else
        return string.(split(s))
    end
end