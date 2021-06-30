module Salaam
using PyCall: pyimport, PyObject

abstract type AbstractModel end

include("orthography/orthography.jl")
include("pos/morphfeats_types.jl")
include("constants.jl")
include("transliterator/transliterate.jl")
include("utils/decode.jl")
include("utils/normalize.jl")
include("utils/dediac.jl")
include("utils/encode.jl")
include("utils/parse.jl")
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

export isfeat, vocal, numeral, parse, arabic, dediac, encode, normalize, tokenize, disambig, predict, install_camel
export Analyzer, Disambiguator, Generator, Reinflector, Tagger, MorphologicalTokenizer, DialectIdentifier
export AbstractEncoder, SimpleEncoding
export @transliterator, genproperties

# Orthography
export AbstractCharacter, AbstractCharacter, AbstractConsonant, AbstractSolar, AbstractLunar,
       AbstractVowel, AbstractTanween, AbstractQuranPauseMark

export Tatweel, Orthography, Fatha, Fathatan, Damma, Dammatan, Kasra, Kasratan, Shadda, Sukun, Maddah, HamzaAbove, 
       HamzaBelow, HamzatWasl, AlifKhanjareeya, SmallHighSeen, SmallHighRoundedZero, SmallHighUprightRectangularZero,
       SmallHighMeemIsolatedForm, SmallLowSeen, SmallWaw, SmallYa, SmallHighNoon, EmptyCenterLowStop,
       EmptyCenterHighStop, RoundedHighStopWithFilledCenter, SmallLowMeem

# Consonants
export Alif, AlifMaksurah, Ba, Ta, TaMarbuta, Tha, Jeem, HHa, Kha, Dal, Thal, Ra, Zain, Seen, Sheen, Sad,
       DDad, TTa, DTha, Ain, Ghain, Fa, Qaf, Kaf, Lam, Meem, Noon, Waw, Ha, Hamza, Ya,
       AlifMaddah, AlifHamzaAbove, AlifHamzaBelow, AlifHamzatWasl, WawHamzaAbove, YaHamzaAbove

# Part of speech
export AbstractFeature, AbstractPartOfSpeech,
       AbstractNominal, AbstractState, AbstractCase,
       AbstractPreposition, AbstractParticle, AbstractDisLetters,
       AbstractConjunction, AbstractPerson, AbstractGender,
       AbstractNumber, AbstractNoun, AbstractDerivedNominal,
       AbstractPronoun, AbstractAdverb, AbstractVerb, 
       AbstractAspect, AbstractMood, AbstractVoice, 
       AbstractVerbForm, AbstractPrefix, AbstractSuffix
export Noun, ProperNoun, Adjective, ImperativeVerbalNoun,
       Personal, Demonstrative, Relative, Time, Location,
       Preposition, EmphaticLam, ImperativeLam, PurposeLam,
       EmphaticNun, Coordinating, Subordinating, Accusative,
       Amendment, Answer, Aversion, Cause, Certainty,
       Circumstantial, Comitative, Conditional, Equalization,
       Exhortation, Explanation, Exceptive, Future,
       Inceptive, Interpretation, Interogative, Negative,
       Preventive, Prohibition, Resumption, Restriction, 
       Retraction, Result, Supplemental, Surprise, Vocative,
       DisconnectedLetters, FirstPerson, SecondPerson,
       ThirdPerson, Masculine, Feminine, Singular, Dual,
       Plural, Verb, Perfect, Imperfect, Imperative, 
       Indicative, Subjunctive, Jussive, Active, Passive,
       VerbFormI, VerbFormII, VerbFormIII, VerbFormIV,
       VerbFormV, VerbFormVI, VerbFormVII, VerbFormVIII,
       VerbFormIX, VerbFormX, VerbFormXI, VerbFormXII,
       ActiveParticle, PassiveParticle, VerbalNoun, Definite,
       Indefinite, Nominative, Genetive
end # module
