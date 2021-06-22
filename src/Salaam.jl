module Salaam
using PyCall: pyimport, PyObject

abstract type AbstractModel end

include("constants.jl")
include("transliterate.jl")
include("decode.jl")
include("normalize.jl")
include("dediac.jl")
include("encode.jl")
include("disambig.jl")
include("database.jl")
include("analyze.jl")
include("generate.jl")
include("reinflect.jl")
include("tag.jl")
include("tokenize.jl")
include("identify_dialect.jl")
include("data.jl")

export BW_ENCODING, AR_DIACS_REGEX, SP_REGEX_CHARS, PUNCTUATIONS_REGEX

export arabic, dediac, encode, normalize, tokenize, disambig, predict, google_drive_downloader
export Analyzer, Disambiguator, Generator, Reinflector, Tagger, MorphologicalTokenizer, DialectIdentifier
export AbstractEncoder
export @transliterator, genproperties

end # module
