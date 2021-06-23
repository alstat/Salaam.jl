module Salaam
using PyCall: pyimport, PyObject

abstract type AbstractModel end

include("constants.jl")
include("transliterator/transliterate.jl")
include("decode.jl")
include("normalize.jl")
include("dediac.jl")
include("encode.jl")
include("disambig/disambig.jl")
include("data/database.jl")
include("morphology/analyze.jl")
include("morphology/generate.jl")
include("morphology/reinflect.jl")
include("tagger/tag.jl")
include("tokenizers/tokenize.jl")
include("dialectid/identify_dialect.jl")
include("data/data.jl")

export BW_ENCODING, AR_DIACS_REGEX, SP_REGEX_CHARS, PUNCTUATIONS_REGEX

export arabic, dediac, encode, normalize, tokenize, disambig, predict, install_camel
export Analyzer, Disambiguator, Generator, Reinflector, Tagger, MorphologicalTokenizer, DialectIdentifier
export AbstractEncoder
export @transliterator, genproperties

end # module
