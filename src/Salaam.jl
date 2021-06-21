module Salaam
using PyCall: pyimport, PyObject

include("constants.jl")
include("transliterate.jl")
include("decode.jl")
include("normalize.jl")
include("dediac.jl")
include("encode.jl")
include("tokenize.jl")
include("disambig.jl")
include("database.jl")
include("analyzer.jl")
include("generator.jl")
include("reinflector.jl")
include("tagger.jl")

export BW_ENCODING, AR_DIACS_REGEX, SP_REGEX_CHARS, PUNCTUATIONS_REGEX

export arabic, dediac, encode, normalize, tokenize, disambig
export Analyzer, Generator, Reinflector, Tagger, 
export AbstractEncoder
export @transliterator, genproperties

end # module
