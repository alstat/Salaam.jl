abstract type AbstractFeature end
abstract type AbstractPartOfSpeech <: AbstractFeature end
abstract type AbstractClitic <: AbstractPartOfSpeech end
abstract type AbstractProclitic <: AbstractClitic end
abstract type AbstractEnclitic <: AbstractClitic end
abstract type AbstractNominal <: AbstractPartOfSpeech end
abstract type AbstractState <: AbstractNominal end
abstract type AbstractCase <: AbstractNominal end
abstract type AbstractPreposition <: AbstractProclitic end
abstract type AbstractArticle <: AbstractProclitic end
abstract type AbstractParticle <: AbstractPartOfSpeech end
abstract type AbstractDisLetters <: AbstractPartOfSpeech end
abstract type AbstractConjunction <: AbstractPartOfSpeech end
abstract type AbstractPerson <: AbstractPartOfSpeech end
abstract type AbstractGender <: AbstractPartOfSpeech end
abstract type AbstractNumber <: AbstractPartOfSpeech end
abstract type AbstractNoun <: AbstractPartOfSpeech end
abstract type AbstractDerivedNominal <: AbstractPartOfSpeech end
abstract type AbstractAdjective <: AbstractDerivedNominal end
abstract type AbstractPronoun <: AbstractPartOfSpeech end
abstract type AbstractAdverb <: AbstractPartOfSpeech end
abstract type AbstractVerb <: AbstractPartOfSpeech end
abstract type AbstractAspect <: AbstractVerb end
abstract type AbstractMood <: AbstractVerb end
abstract type AbstractVoice <: AbstractVerb end
abstract type AbstractForm <: AbstractVerb end
abstract type AbstractPrefix <: AbstractPartOfSpeech end
abstract type AbstractSuffix <: AbstractPartOfSpeech end
abstract type AbstractDerivedNoun <: AbstractPartOfSpeech end
abstract type AbstractRationality <: AbstractPartOfSpeech end

macro partofspeech(name, parent, data, desc, ar_label)
    esc(quote
        struct $name <: $parent
            data::Symbol
            desc::String
            ar_label::String
        end
        
        $name() = $name($data, $desc, $ar_label)
    end)
end

macro partofspeechparam(name, parent, param, data, desc, ar_label)
    esc(quote
        struct $name{$param} <: $parent
            data::Union{Symbol,Nothing}
            desc::String
            ar_label::String
        end
        
        $name{$param}() = $name($data, $desc, $ar_label)
    end)
end

macro construct(name, param, data, desc, ar_label)
    esc(quote
        $name{$param}() = $name($data, $desc, $ar_label)
        $name() = name{$param}()
    end)
end

@partofspeech PartOfSpeech AbstractPartOfSpeech nothing "Particle" "حرف نفي"
@partofspeech Particle AbstractParticle nothing "Particle" "حرف نفي"
@partofspeech Preposition AbstractPreposition nothing "Particle" "حرف نفي"
@partofspeech Determiner AbstractArticle nothing "Particle" "حرف نفي"
@partofspeech Proclitic AbstractClitic nothing "Particle" "حرف نفي"
@partofspeech Enclitic AbstractClitic nothing "Particle" "حرف نفي"

@partofspeech Jussive AbstractPartOfSpeech nothing "Negative particle" "حرف نفي"
@partofspeech Partical AbstractPartOfSpeech nothing "Negative particle" "حرف نفي"
@partofspeech Negative AbstractParticle nothing "Negative particle" "حرف نفي"
@partofspeech Vocative AbstractParticle nothing "Negative particle" "حرف نفي"
@partofspeech Emphatic AbstractPreposition nothing "Negative particle" "حرف نفي"
@partofspeech Responsive AbstractPreposition nothing "Negative particle" "حرف نفي"
@partofspeech FutureMarker AbstractPreposition nothing "Negative particle" "حرف نفي"

@partofspeech Singular AbstractNumber :S "Singular" "العدد"
@partofspeech Dual AbstractNumber :D "Dual" "العدد"
@partofspeech Plural AbstractNumber :P "Plural" "العدد"

@partofspeech FirstPerson AbstractPerson Symbol("1") "First person" "الاسناد"
@partofspeech SecondPerson AbstractPerson Symbol("2") "Second person" "الاسناد"
@partofspeech ThirdPerson AbstractPerson  Symbol("3") "Third person" "الاسناد"

@partofspeech Masculine AbstractGender Symbol("M") "Masculine" "الجنس"
@partofspeech Feminine AbstractGender Symbol("F") "Feminine" "الجنس"

@partofspeechparam Pronoun AbstractPronoun PartOfSpeech nothing "Particle" "حرف نفي"
# @partofspeechparam Vocative AbstractPartOfSpeech Preposition nothing "Negative particle" "حرف نفي"
@partofspeechparam Progressive AbstractVerb Particle nothing "Negative particle" "حرف نفي"
@partofspeechparam Relative AbstractPartOfSpeech PartOfSpeech nothing "Relative" ""
@partofspeechparam Demonstrative AbstractPartOfSpeech PartOfSpeech nothing "Demonstrative" ""
@partofspeechparam Subjunctive AbstractPartOfSpeech PartOfSpeech nothing "Relative" ""
@partofspeechparam Interrogative AbstractPartOfSpeech PartOfSpeech nothing "Relative" ""
@partofspeechparam Conjunction AbstractPartOfSpeech PartOfSpeech nothing "Relative" ""
@partofspeechparam Subordinating AbstractConjunction Conjunction nothing "Negative particle" "حرف نفي"
@partofspeechparam DirectObject AbstractEnclitic Enclitic :DO "Singular" "العدد"
@partofspeechparam IndirectObject AbstractPartOfSpeech PartOfSpeech :IDO "Singular" "العدد"
@partofspeechparam Possessive AbstractEnclitic Enclitic :POSS "Singular" "العدد"

# -----------------------------------------
# Article Proclitic
# -----------------------------------------
@partofspeechparam AlmA AbstractArticle Union{Determiner,Negative} :PARTALMA "Determiner Al + negative particle ma" "حرف نصب"
@partofspeechparam Aa AbstractArticle Demonstrative{Particle} :DEMAA "Demonstrative particle" "حرف نصب"

@partofspeech LA Negative :NEGLA "Negative particle lA" "حرف نصب"

@partofspeechparam MA AbstractClitic Union{Negative,Proclitic} :NEGMA "Negative particle mA" "حرف نصب"
@construct MA Union{Relative{Pronoun},Proclitic} :RELMA "Relative particle mA" "حرف نصب"
@construct MA Union{Particle,Proclitic} :MAPART "Particle mA" "حرف نفي"

@partofspeechparam Ma AbstractClitic Union{Negative,Proclitic} :NEGMA2 "Negative particle ma" "حرف نصب"

# -----------------------------------------
# Pronouns
# -----------------------------------------
@construct Demonstrative AbstractPronoun :DEM "Demonstrative pronoun" "اسم اشارة"
@construct Relative AbstractPronoun :REL "Relative pronoun" "اسم موصول"

# -----------------------------------------
# Adverbs
# -----------------------------------------
@construct Relative AbstractAdverb :RELADV "Relative adverb" ""

# -----------------------------------------
# Prepositions
# -----------------------------------------
@partofspeech Ea AbstractPreposition :PREEA "Preposition Ea" "حرف نصب"
@partofspeech EalaY AbstractPreposition :PREEALAY "Preposition EalaY" "حرف نصب"
@partofspeech Fiy AbstractPreposition :PREFIY "Preposition fiy" "حرف نصب"
@partofspeech HA AbstractPreposition :PREHA "Demonstrative preposition hA" "حرف نصب"
@partofspeech Ha FutureMarker :FMHA "Future marker preposition Ha" "حرف نصب"
@partofspeech Ka AbstractPreposition :PREKA "Preposition ka" "حرف نصب"
@partofspeech Libi AbstractPreposition :PRELIBI "Preposition ka" "حرف نصب"
@partofspeech Min AbstractPreposition :PREMIN "Preposition ka" "حرف نصب"
@partofspeech Sa FutureMarker :FMSA "Future marker preposition sa" "حرف نصب"
@partofspeech Ta AbstractPreposition :PRETA "Preposition ta" "حرف نصب"
@partofspeech WA Vocative :VOCWA "Vocative preposition wa" "حرف نصب"
@partofspeech YA Vocative :VOCYA "Vocative preposition ya" "حرف نصب"

@partofspeechparam Ish AbstractPreposition Interrogative :PREISH "Preposition ish" "حرف نصب"
@partofspeechparam Bi AbstractPartOfSpeech Preposition :PREBI "Preposition bi" "حرف نصب"

@partofspeechparam La AbstractPartOfSpeech Preposition :PRELA "Preposition la" "حرف نصب"
@construct La Responsive :RESLA "Responsive conditional la" "حرف نصب"
@construct La Emphatic :EMPHLA "Emphatic particle la" "حرف نصب"

@partofspeechparam LaHa AbstractPreposition Union{Emphatic,FutureMarker} :PRELA "Emphatic la + future marker Ha" "حرف نصب"
@construct LaHa Union{Responsive,FutureMarker} :PRELAHA "Response conditional la + future marker Ha" "حرف نصب"

@partofspeechparam Li AbstractPreposition Jussive :JUSLI "Jussive li" ""
@construct Li Preposition :PRELI "Preposition li" ""
@construct Li Subjunctive{Preposition} :SUBLI "Preposition li" ""

@partofspeechparam Wa AbstractPartOfSpeech Preposition :PREWA "Preposition wa" ""
@construct Wa Particle :PARTWA "Particle wa" ""

# -----------------------------------------
# Particles
# -----------------------------------------
@construct Bi Particle :PARTBI "Particle bi" "حرف نصب"

# -----------------------------------------
# Verbs
# -----------------------------------------
@construct Bi Progressive{Particle} :PROGVBI "Progressive verb particle bi" "حرف نصب"
@construct Demonstrative AbstractParticle Symbol("DEMPART") "Conditional particle" "حرف شرط"

# -----------------------------------------
# Conjunctions
# -----------------------------------------
@partofspeechparam Fa AbstractConjunction Conjunction :CONJFA "Jussive li" ""
@construct Fa Connective :CONNFA "Progressive verb particle bi" "حرف نصب"
@construct Fa Responsive :RESFA "Progressive verb particle bi" "حرف نصب"
@construct Fa Subjunctive{Conjunction} :SUBCONJFA "Progressive verb particle bi" "حرف نصب"
@construct Wa Conjunction :CONJWA "Particle wa" ""
@construct Wa Subordinating :SUBCONJWA "Particle wa" ""
# Wa Particle is already defined in Section Prepositions

# -----------------------------------------
# Question proclitic
# -----------------------------------------
@partofspeechparam A AbstractProclitic Interrogative{Partical} :INTPARA "" ""

# -----------------------------------------
# Pronominal enclitic
# -----------------------------------------
@construct DirectObject Union{FirstPerson,Singular} :DOFS "" ""
@construct Possessive Union{FirstPerson,Singular} :POSFS "" ""
@construct Pronoun Union{FirstPerson,Singular} :PRONFS "" ""
@construct DirectObject Union{FirstPerson,Plural} :DOFP "" ""
@construct Possessive Union{FirstPerson,Plural} :POSFP "" ""
@construct Pronoun Union{FirstPerson,Plural} :PRONFP "" ""

@construct DirectObject Union{SecondPerson,Dual} :DOFS "" ""
@construct Possessive Union{SecondPerson,Dual} :POSFS "" ""
@construct Pronoun Union{SecondPerson,Dual} :PRONFS "" ""
@construct DirectObject Union{SecondPerson,Plural} :DOFP "" ""
@construct Possessive Union{SecondPerson,Plural} :POSFP "" ""
@construct Pronoun Union{SecondPerson,Plural} :PRONFP "" ""

@construct DirectObject Union{SecondPerson,Singular,Feminine} :DOFS "" ""
@construct Possessive Union{SecondPerson,Singular,Feminine} :POSFS "" ""
@construct Pronoun Union{SecondPerson,Singular,Feminine} :PRONFS "" ""
@construct DirectObject Union{SecondPerson,Plural,Feminine} :DOFP "" ""
@construct Possessive Union{SecondPerson,Plural,Feminine} :POSFP "" ""
@construct Pronoun Union{SecondPerson,Plural,Feminine} :PRONFP "" ""

@construct DirectObject Union{SecondPerson,Singular,Masculine} :DOFS "" ""
@construct Possessive Union{SecondPerson,Singular,Masculine} :POSFS "" ""
@construct Pronoun Union{SecondPerson,Singular,Masculine} :PRONFS "" ""
@construct DirectObject Union{SecondPerson,Plural,Masculine} :DOFP "" ""
@construct Possessive Union{SecondPerson,Plural,Masculine} :POSFP "" ""
@construct Pronoun Union{SecondPerson,Plural,Masculine} :PRONFP "" ""

@construct DirectObject Union{ThirdPerson,Dual} :DOFS "" ""
@construct Possessive Union{ThirdPerson,Dual} :POSFS "" ""
@construct Pronoun Union{ThirdPerson,Dual} :PRONFS "" ""
@construct DirectObject Union{ThirdPerson,Plural} :DOFP "" ""
@construct Possessive Union{ThirdPerson,Plural} :POSFP "" ""
@construct Pronoun Union{ThirdPerson,Plural} :PRONFP "" ""

@construct DirectObject Union{ThirdPerson,Singular,Feminine} :DOFS "" ""
@construct Possessive Union{ThirdPerson,Singular,Feminine} :POSFS "" ""
@construct Pronoun Union{ThirdPerson,Singular,Feminine} :PRONFS "" ""
@construct DirectObject Union{ThirdPerson,Plural,Feminine} :DOFP "" ""
@construct Possessive Union{ThirdPerson,Plural,Feminine} :POSFP "" ""
@construct Pronoun Union{ThirdPerson,Plural,Feminine} :PRONFP "" ""

@construct DirectObject Union{ThirdPerson,Singular,Masculine} :DOFS "" ""
@construct Possessive Union{ThirdPerson,Singular,Masculine} :POSFS "" ""
@construct Pronoun Union{ThirdPerson,Singular,Masculine} :PRONFS "" ""
@construct DirectObject Union{ThirdPerson,Plural,Masculine} :DOFP "" ""
@construct Possessive Union{ThirdPerson,Plural,Masculine} :POSFP "" ""
@construct Pronoun Union{ThirdPerson,Plural,Masculine} :PRONFP "" ""

@partofspeech Ah Vocative :VOCAH "" ""
# LA is already defined in Article proclitic

@construct MA Union{Interrogative{Pronoun},Enclitic} :INTPROMA "" ""
@construct Ma Union{Interrogative{Pronoun},Enclitic} :INTPROMA2 "" ""

@construct MA Union{Relative{Pronoun},Enclitic} :RELPROMA "" ""
@construct Ma Union{Relative{Pronoun},Enclitic} :RELPROMA2 "" ""
@construct MA Union{Subordinating{Pronoun},Enclitic} :RELPROMA "" ""
@construct Ma Union{Subordinating{Pronoun},Enclitic} :RELPROMA2 "" ""

@partofspeechparam Man AbstractEnclitic Interrogative{Pronoun} :INTPROMAN "" ""
@construct Man Relative{Pronoun} :RELPROMAN "" ""

# struct Aa{param} <: AbstractClitic
#     data::Symbol
#     desc::String
#     ar_label::String
# end

# Aa{Preposition}(:Aa_prep, "sdfsdf", "sfsf")

# struct AlmA <: AbstractClitic end
# struct lA <: AbstractClitic end
# struct mA <: AbstractClitic end
# struct ma <: AbstractClitic end

# struct Bi <: AbstractClitic end
# struct Ea <: AbstractClitic end
# struct EalaY <: AbstractClitic end
# struct Fiy <: AbstractClitic end
# struct Ka <: AbstractClitic end
# struct Ta <: AbstractClitic end
# struct Wa <: AbstractClitic end
# struct La <: AbstractClitic end
# struct Libi <: AbstractClitic end
# struct Li <: AbstractClitic end
# struct Min <: AbstractClitic end
# struct Lam <: AbstractClitic end
# struct Nun <: AbstractClitic end
# struct Fa <: AbstractClitic end

@partofspeech Undefined AbstractFeature Symbol("u") "Undefined" ""

@partofspeech Noun AbstractNoun Symbol("N") "Noun" "اسم"
@partofspeech ProperNoun AbstractNoun Symbol("PN") "Proper noun" "اسم علم"
@partofspeech Numeral AbstractNoun Symbol("NBRN") "Number noun" ""
@partofspeech Quantity AbstractNoun Symbol("QTYN") "Quantity noun" ""

@partofspeech Adjective AbstractDerivedNominal Symbol("ADJ") "Adjective" "صفة"
@partofspeech Comparative AbstractAdjective Symbol("COMPADJ") "Comparative adjective" ""
@partofspeech Numerical AbstractAdjective Symbol("NUMADJ") "Numerical adjective" ""
@partofspeech ImperativeVerbalNoun AbstractDerivedNominal Symbol("IMPN") "Imperative verbal noun" "اسم فعل أمر"

@partofspeech Personal AbstractPronoun Symbol("PRON") "Personal pronoun" "ضمير"
@partofspeech Interrogative AbstractPronoun Symbol("INTR") "Interrogative pronoun" ""
@partofspeech Exclamation AbstractPronoun Symbol("EXCLM") "Exclamation pronoun" ""

@partofspeech Time AbstractAdverb Symbol("T") "Time adverb" "ظرف زمان"
@partofspeech Location AbstractAdverb Symbol("LOC") "Location adverb" "ظرف مكان"
@partofspeech InterrogativeAdv AbstractAdverb Symbol("INTRADV") "Interrogative adverb" ""

@partofspeech Al AbstractArticle Symbol("AL") "Preposition" "حرف جر"
@partofspeech NegativeAlmA AbstractArticle Symbol("NEGALMA") "Preposition" "حرف جر"
@partofspeech NegativelA AbstractArticle Symbol("NEGLA") "Preposition" "حرف جر"
@partofspeech NegativemA AbstractArticle Symbol("NEGMA") "Preposition" "حرف جر"
@partofspeech Negativema AbstractArticle Symbol("NEGMA2") "Preposition" "حرف جر"

@partofspeech Preposition AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingBi AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingEa AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingEalaY AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingFiy AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingKa AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingTa AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingWa AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingLa AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingLibi AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingLi AbstractPreposition Symbol("P") "Preposition" "حرف جر"
@partofspeech PreposingMin AbstractPreposition Symbol("P") "Preposition" "حرف جر"

@partofspeech EmphaticLam AbstractPrefix Symbol("EMPH") "Emphatic lam prefix" "لام التوكيد"
@partofspeech ImperativeLam AbstractPrefix Symbol("IMPV") "Imperative lam prefix" "لام الامر"
@partofspeech PurposiveLam AbstractPrefix Symbol("PRP") "Purpose lam prefix" "لام التعليل"
@partofspeech EmphaticNun AbstractPrefix Symbol("+n:EMPH") "Emphatic lam prefix" "لام التوكيد"

@partofspeech Coordinating AbstractConjunction Symbol("CONJ") "Coordinating conjunction" "حرف عطف"
@partofspeech Subordinating AbstractConjunction Symbol("SUB") "Subordinating particle" "حرف مصدري"
@partofspeech ConjunctiveWa AbstractConjunction Symbol("CONJWA") "Coordinating conjunction" "حرف عطف"
@partofspeech SubordinatingWa AbstractConjunction Symbol("SUBWA") "Coordinating conjunction" "حرف عطف"
@partofspeech ConjunctiveFa AbstractConjunction Symbol("CONJFA") "Coordinating conjunction" "حرف عطف"
@partofspeech SubordinatingFa AbstractConjunction Symbol("SUBFA") "Coordinating conjunction" "حرف عطف"
@partofspeech ConnectiveFa AbstractConjunction Symbol("CONFA") "Coordinating conjunction" "حرف عطف"
@partofspeech ResponsiveFa AbstractConjunction Symbol("RESFA") "Coordinating conjunction" "حرف عطف"

@partofspeech Accusative AbstractParticle Symbol("ACC") "Accusative particle" "حرف نصب"
@partofspeech Amendment AbstractParticle Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Answer AbstractParticle Symbol("ANS") "Answer particle" "حرف جواب"
@partofspeech Aversion AbstractParticle Symbol("AVR") "Aversion particle" "حرف ردع"
@partofspeech Cause AbstractParticle Symbol("CAUS") "Particle of cause" "حرف سببية"
@partofspeech Certainty AbstractParticle Symbol("CERT") "Particle of certainty" "حرف تحقيق"
@partofspeech Circumstantial AbstractParticle Symbol("CIRC") "Circumstantial particle" "حرف حال"
@partofspeech Comitative AbstractParticle Symbol("COM") "Comitative particle" "واو المعية"
@partofspeech Conditional AbstractParticle Symbol("COND") "Conditional particle" "حرف شرط"
@partofspeech Determiner AbstractParticle Symbol("DEMPART") "Determiner particle" "حرف شرط"
@partofspeech Equalization AbstractParticle Symbol("EQ") "Equalization particle" "حرف تسوية"
@partofspeech Exhortation AbstractParticle Symbol("EXH") "Exhortation particle" "حرف تحضيض"
@partofspeech Explanation AbstractParticle Symbol("EXL") "Explanation particle" "حرف تفصيل"
@partofspeech Exceptive AbstractParticle Symbol("EXP") "Exceptive particle" "أداة استثناء"
@partofspeech Future AbstractParticle Symbol("FUT") "Future particle" "حرف استقبال"
@partofspeech Focus AbstractParticle Symbol("FOC") "Focus particle" "حرف استقبال"
@partofspeech Inceptive AbstractParticle Symbol("INC") "Inceptive particle" "حرف ابتداء"
@partofspeech Interpretation AbstractParticle Symbol("INT") "Inceptive particle" "حرف تفسير"
@partofspeech Interogative AbstractParticle Symbol("INTG") "Interogative particle" "حرف استفهام"
@partofspeech Preventive AbstractParticle Symbol("PREV") "Preventive particle" "حرف كاف"
@partofspeech Prohibition AbstractParticle Symbol("PRO") "Prohibition particle" "حرف نهي"
@partofspeech Resumption AbstractParticle Symbol("REM") "Resumption particle" "حرف استئنافية"
@partofspeech Restriction AbstractParticle Symbol("RES") "Restriction particle" "أداة حصر"
@partofspeech Retraction AbstractParticle Symbol("RET") "Retraction particle" "حرف اضراب"
@partofspeech Result AbstractParticle Symbol("RSLT") "Result particle" "حرف واقع في جواب الشرط"
@partofspeech Supplemental AbstractParticle Symbol("SUP") "Suplemental particle" "حرف زائد"
@partofspeech Surprise AbstractParticle Symbol("SUR") "Surprise particle" "حرف فجاءة"
@partofspeech Verbal AbstractParticle Symbol("VERPART") "Verbal particle" "حرف نداء"
@partofspeech Vocative AbstractParticle Symbol("VOC") "Vocative particle" "حرف نداء"

@partofspeech Abbreviation AbstractPartOfSpeech Symbol("ABB") "Abreviation" ""
@partofspeech Punctuation AbstractPartOfSpeech Symbol("PUNC") "Abreviation" ""
@partofspeech Interjection AbstractPartOfSpeech Symbol("INTJEC") "Interjection" ""
@partofspeech Digit AbstractPartOfSpeech Symbol("DGIT") "Digital numbers" ""
@partofspeech Foreign AbstractPartOfSpeech Symbol("FRGN") "Foreign letters" ""

@partofspeech DisconnectedLetters AbstractDisLetters Symbol("INL") "Quranic initials" "حروف مقطعة"

@partofspeech FirstPerson AbstractPerson Symbol("1") "First person" "الاسناد"
@partofspeech SecondPerson AbstractPerson Symbol("2") "Second person" "الاسناد"
@partofspeech ThirdPerson AbstractPerson Symbol("3") "Third person" "الاسناد"

@partofspeech Masculine AbstractGender Symbol("M") "Masculine" "الجنس"
@partofspeech Feminine AbstractGender Symbol("F") "Feminine" "الجنس"

@partofspeech Singular AbstractNumber Symbol("S") "Singular" "العدد"
@partofspeech Dual AbstractNumber Symbol("D") "Dual" "العدد"
@partofspeech Plural AbstractNumber Symbol("P") "Plural" "العدد"

@partofspeech Verb AbstractPartOfSpeech Symbol("V") "Verb" "فعل"
@partofspeech PseudoVerb AbstractPartOfSpeech Symbol("PSV") "Verb" "فعل"
@partofspeech Command AbstractAspect Symbol("COMM") "Perfect verb" "فعل ماض"
@partofspeech Perfect AbstractAspect Symbol("PERF") "Perfect verb" "فعل ماض"
@partofspeech Imperfect AbstractAspect Symbol("IMPF") "Imperfect verb" "فعل مضارع"
@partofspeech Imperative AbstractAspect Symbol("IMPV") "Imperative verb" "فعل أمر"
@partofspeech Indicative AbstractMood Symbol("IND") "Indicative mood (default)" "مرفوع"
@partofspeech Subjunctive AbstractMood Symbol("SUBJ") "Subjunctive mood" "منصوب"
@partofspeech Jussive AbstractMood Symbol("JUS") "Jussive mood" "مجزوم"
@partofspeech Active AbstractVoice Symbol("ACT") "Active voice (default)" "مبني للمعلوم"
@partofspeech Passive AbstractVoice Symbol("PASS") "Passive voice" "مبني للمجهول"

@partofspeech VerbFormI AbstractForm Symbol("I") "First verb form (default)" "فعل"
@partofspeech VerbFormII AbstractForm Symbol("II") "Second verb form" "فعل"
@partofspeech VerbFormIII AbstractForm Symbol("III") "Third verb form" "فعل"
@partofspeech VerbFormIV AbstractForm Symbol("IV") "Fourth verb form" "فعل"
@partofspeech VerbFormV AbstractForm Symbol("V") "Fifth verb form" "فعل"
@partofspeech VerbFormVI AbstractForm Symbol("VI") "Sixth verb form" "فعل"
@partofspeech VerbFormVII AbstractForm Symbol("VII") "Seventh verb form" "فعل"
@partofspeech VerbFormVIII AbstractForm Symbol("VIII") "Eighth verb form" "فعل"
@partofspeech VerbFormIX AbstractForm Symbol("IX") "Ninth verb form" "فعل"
@partofspeech VerbFormX AbstractForm Symbol("X") "Tenth verb form" "فعل"
@partofspeech VerbFormXI AbstractForm Symbol("XI") "Eleventh verb form" "فعل"
@partofspeech VerbFormXII AbstractForm Symbol("XII") "Twelfth verb form" "فعل"

@partofspeech ActiveParticle AbstractDerivedNoun Symbol("ACT PCPL") "Active particle" "اسم فاعل" 
@partofspeech PassiveParticle AbstractDerivedNoun Symbol("PASS PCPL") "Passive particle" "اسم مفعول"  
@partofspeech VerbalNoun AbstractDerivedNoun Symbol("VN") "Verbal noun" "مصدر"

@partofspeech Definite AbstractState Symbol("DEF") "Definite state" "معرفة"
@partofspeech Indefinite AbstractState Symbol("INDEF") "Indefinite state" "نكرة"
@partofspeech Construct AbstractState Symbol("CNST") "Construct/Poss/Idafa" ""
@partofspeech Nominative AbstractCase Symbol("NOM") "Nominative case" "مرفوع"
@partofspeech Genetive AbstractCase Symbol("GEN") "Genetive case" "مجرور"
@partofspeech Perfective AbstractCase Symbol("PERFC") "Genetive case" "مجرور"

@partofspeech Irrational AbstractRationality Symbol("IRR") "Irrational" ""
@partofspeech Rational AbstractRationality Symbol("RAT") "Irrational" ""