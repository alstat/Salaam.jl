abstract type AbstractLetter end
abstract type AbstractDiacritic end
abstract type AbstractConsonant <: AbstractLetter end
abstract type AbstractSolar <: AbstractConsonant end
abstract type AbstractLunar <: AbstractConsonant end
abstract type AbstractVowel <: AbstractDiacritic end
abstract type AbstractTanween <: AbstractDiacritic end
abstract type AbstractQuranPauseMark end

struct Tatweel end

struct Fatha <: AbstractVowel end
struct Fathatan <: AbstractTanween end
struct Damma <: AbstractVowel end
struct Dammatan <: AbstractTanween end
struct Kasra <: AbstractVowel end
struct Kasratan <: AbstractTanween end

struct Shadda <: AbstractDiacritic end
struct Sukun <: AbstractDiacritic end
struct Maddah <: AbstractDiacritic end 

macro consonant(name, parent, with_preceding, with_following, numeral, vocal, long_vowel)
    esc(quote
        struct $name <: $parent
            with_preceding::Symbol
            with_following::Symbol
            numeral::Union{Int64,Nothing}
            vocal::Symbol
            long_vowel::Bool
        end
        
        $name() = $name($data, $parent, $with_preceding, $with_following, $numeral, $vocal, $long_vowel)
    end)
end

@consonant Alif AbstractLunar true false 1 :soft true
@consonant Ba AbstractLunar true true 2 :labial false
@consonant Ta AbstractSolar true true 400 :palate false
@consonant Tha AbstractSolar true true 500 :gingival false
@consonant Jeem AbstractLunar true true 3 :orifice false
@consonant HHa AbstractLunar true true 8 :guttural false
@consonant Kha AbstractLunar true true 600 :guttural false
@consonant Dal AbstractSolar true false 4 :palate false
@consonant Thal AbstractSolar true false 700 :gingival false
@consonant Ra AbstractSolar true false 200 :liquid false
@consonant Zain AbstractSolar true false 7 :sibilant false
@consonant Seen AbstractSolar true true 60 :sibilant false
@consonant Sheen AbstractSolar true true 300 :orifice false
@consonant Sad AbstractSolar true true 90 :sibilant false
@consonant DDad AbstractSolar true true 800 :orifice false
@consonant TTa AbstractSolar true true 9 :palate false
@consonant DTha AbstractSolar true true 900 :gingival false
@consonant Ain AbstractLunar true true 70 :guttural false
@consonant Ghain AbstractLunar true true 1000 :guttural false
@consonant Fa AbstractLunar true true 80 :labial false
@consonant Qaf AbstractLunar true true 100 :uvula false
@consonant Kaf AbstractLunar true true 20 :uvula false
@consonant Lam AbstractSolar true true 30 :liquid false
@consonant Meem AbstractLunar true true 40 :labial false
@consonant Nun AbstractSolar true true 50 :liquid false
@consonant Waw AbstractLunar true false 6 :labial true
@consonant Ha AbstractLunar true true 5 :guttural false
@consonant Hamza AbstractLunar false false 1 :soft false
@consonant Ya AbstractLunar true true 10 :soft true