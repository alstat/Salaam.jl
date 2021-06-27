abstract type AbstractSolar end
abstract type AbstractLunar end

macro consonant(name, parent, with_preceding, with_following, with_both, numeral, vocal, long_vowel)
    esc(quote
        struct $name <: $parent
            with_preceding::Symbol
            with_following::Symbol
            with_both::Symbol
            numeral::Int64
            vocal::Symbol
            long_vowel::Bool
        end
        
        $name() = $name($data, $parent, $with_preceding, $with_following, $with_both, $numeral, $vocal, $long_vowel)
    end)
end

@consonant Alif AbstractLunar true false false 1 :soft