module Salaam

include("constants.jl")
include("transliterate.jl")
include("decode.jl")
include("normalize.jl")
include("dediac.jl")
include("encode.jl")
include("tokenize.jl")

export BW_ENCODING, AR_DIACS_REGEX, SP_REGEX_CHARS, PUNCTUATIONS_REGEX
export arabic, dediac, encode, normalize, tokenize

export AbstractEncoder
export @transliterator, genproperties
end # module
