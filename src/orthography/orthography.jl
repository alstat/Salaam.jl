abstract type AbstractLongVowels end

macro letter(name, parent, data, desc, ar_label)
    esc(quote
        struct $name <: $parent
            data::Symbol
            desc::String
            ar_label::String
        end
        
        $name() = $name($data, $desc, $ar_label)
    end)
end