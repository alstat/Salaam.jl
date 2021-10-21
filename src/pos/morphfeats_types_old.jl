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

macro partofspeech(name, parent, code, desc, ar_label)
    esc(quote
        struct $name <: $parent
            code::Symbol
            desc::String
            ar_label::String
        end
        
        $name() = $name($code, $desc, $ar_label)
    end)
end

macro partofspeechparam(name, parent, data, code, desc, ar_label)
    esc(quote
        struct $name{param} <: $parent
            data::param
            code::Symbol
            desc::String
            ar_label::String
        end
        
        $name(x) = $name(x, $code, $desc, $ar_label)
        $name() = $name($data, $code, $desc, $ar_label)
    end)
end

macro construct(name, param, data, desc, ar_label)
    esc(quote
        $name{$param}() = $name{$param}($data, $desc, $ar_label)
        # $name() = $name{$param}()
    end)
end

@partofspeech PartOfSpeech AbstractPartOfSpeech nothing "Particle" "حرف نفي"
@partofspeech Particle AbstractParticle nothing "Particle" "حرف نفي"
@partofspeech Preposition AbstractPreposition :BIP "Particle" "حرف نفي"
@partofspeech Mood AbstractVerb :MOODP "Particle" "حرف نفي"
@partofspeech Determiner AbstractParticle nothing "Particle" "حرف نفي"
@partofspeech Proclitic AbstractClitic nothing "Particle" "حرف نفي"
@partofspeech Enclitic AbstractClitic nothing "Particle" "حرف نفي"
@partofspeech Case AbstractCase nothing "Particle" "حرف نفي"
@partofspeech Abbreviation AbstractPartOfSpeech Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Punctuation AbstractPartOfSpeech Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Interjection AbstractPartOfSpeech Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech DigitalNumbers AbstractPartOfSpeech Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Foreign AbstractPartOfSpeech Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Aspect AbstractVerb Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Adverb AbstractAdverb Symbol("ADVP") "Amendment particle" "حرف استدراك"

@partofspeech Undefined AbstractFeature :U "Undefined" ""
@partofspeech NotApplicable AbstractFeature :U "Undefined" ""
@partofspeech NoProclitic AbstractProclitic :NOP "Undefined" ""

@partofspeech Purposive AbstractPartOfSpeech nothing "Negative particle" "حرف نفي"
@partofspeech Vocative AbstractParticle :VOC "Vocative particle" "حرف نداء"
@partofspeech Negative AbstractParticle :NEG "Negative particle" "حرف نفي"
@partofspeech Partical AbstractPartOfSpeech nothing "Negative particle" "حرف نفي"
@partofspeech Emphatic AbstractParticle nothing "Negative particle" "حرف نفي"
@partofspeech Responsive AbstractPreposition nothing "Negative particle" "حرف نفي"
@partofspeech FutureMarker AbstractParticle nothing "Negative particle" "حرف نفي"
@partofspeech Connective AbstractPa rticle nothing "Negative particle" "حرف نفي"

@partofspeech Singular AbstractNumber :S "Singular" "العدد"
@partofspeech Dual AbstractNumber :D "Dual" "العدد"
@partofspeech Plural AbstractNumber :P "Plural" "العدد"

@partofspeech FirstPerson AbstractPerson Symbol("1") "First person" "الاسناد"
@partofspeech SecondPerson AbstractPerson Symbol("2") "Second person" "الاسناد"
@partofspeech ThirdPerson AbstractPerson  Symbol("3") "Third person" "الاسناد"

@partofspeech Masculine AbstractGender Symbol("M") "Masculine" "الجنس"
@partofspeech Feminine AbstractGender Symbol("F") "Feminine" "الجنس"

@partofspeech Time AbstractAdverb Symbol("T") "Time adverb" "ظرف زمان"
@partofspeech Location AbstractAdverb Symbol("LOC") "Location adverb" "ظرف مكان"

@partofspeech Conjunction AbstractConjunction :CONJ "Relative" ""

@partofspeechparam Pronoun AbstractPronoun PartOfSpeech nothing "Particle" "حرف نفي"
@partofspeech Progressive AbstractParticle nothing "Negative particle" "حرف نفي"
@partofspeechparam Relative AbstractPartOfSpeech PartOfSpeech nothing "Relative" ""
@partofspeechparam Demonstrative AbstractPartOfSpeech PartOfSpeech nothing "Demonstrative" ""
@partofspeechparam Subjunctive AbstractPartOfSpeech PartOfSpeech :SUBJP "Relative" ""
@partofspeechparam Interrogative AbstractPartOfSpeech PartOfSpeech nothing "Relative" ""
@partofspeechparam Subordinating AbstractConjunction Conjunction nothing "Negative particle" "حرف نفي"
@partofspeechparam DirectObject AbstractEnclitic Enclitic :DO "Singular" "العدد"
@partofspeechparam IndirectObject AbstractPartOfSpeech PartOfSpeech :IDO "Singular" "العدد"
@partofspeechparam Possessive AbstractEnclitic Enclitic :POSS "Singular" "العدد"
@partofspeechparam Jussive AbstractPartOfSpeech PartOfSpeech :JUSP "Negative particle" "حرف نفي"
@partofspeechparam Accusative AbstractPartOfSpeech PartOfSpeech :ACCP "Accusative" "حرف نصب"

# -----------------------------------------
# Verbs
# -----------------------------------------
@partofspeechparam Aspect AbstractVerb Imperative() :IMPER "Amendment particle" "حرف استدراك"

# -----------------------------------------
# Adjective
# -----------------------------------------
@partofspeech Adjective AbstractDerivedNominal Symbol("ADJ") "Adjective" "صفة"
@partofspeech ImperativeVerbalNoun AbstractDerivedNominal Symbol("IMPN") "Imperative verbal noun" "اسم فعل أمر"
@partofspeech Comparative AbstractAdjective Symbol("COMPR") "Imperative verbal noun" "اسم فعل أمر"
@partofspeech Numerical AbstractAdjective Symbol("NUMR") "Imperative verbal noun" "اسم فعل أمر"

# -----------------------------------------
# Noun
# -----------------------------------------
@partofspeech Noun AbstractNoun :N "Noun" "اسم"
@partofspeech ProperNoun AbstractNoun :PN "Proper noun" "اسم علم"
@partofspeech Numeral AbstractNoun :NN "Proper noun" "اسم علم"
@partofspeech Quantity AbstractNoun :QN "Proper noun" "اسم علم"

# -----------------------------------------
# Voice
# -----------------------------------------
@partofspeech Active AbstractVoice :ACT "Active voice (default)" "مبني للمعلوم"
@partofspeech Passive AbstractVoice :PASS "Passive voice" "مبني للمجهول"

# -----------------------------------------
# State
# -----------------------------------------
@partofspeech Definite AbstractState :DEF "Definite state" "معرفة"
@partofspeech Indefinite AbstractState :INDEF "Indefinite state" "نكرة"
@partofspeech Construct AbstractState :CONS "Definite state" "معرفة"

# -----------------------------------------
# Rationality
# -----------------------------------------
@partofspeech No AbstractRationality :IRAT "Definite state" "معرفة"
@partofspeech Yes AbstractRationality :RAT "Indefinite state" "نكرة"

# -----------------------------------------
# Case
# -----------------------------------------
@partofspeech Nominative AbstractCase :NOM "Nominative case" "مرفوع"
@partofspeech Genetive AbstractCase :GEN "Genetive case" "مجرور"
@construct Accusative Case :ACC "Genetive case" "مجرور"

# -----------------------------------------
# Aspect
# -----------------------------------------
@partofspeech Command AbstractAspect :COMM "Perfect verb" "فعل ماض"
@partofspeech Perfect AbstractAspect :PERF "Perfect verb" "فعل ماض"
@partofspeech Imperfect AbstractAspect :IMPF "Imperfect verb" "فعل مضارع"
# @partofspeechparam Imperative AbstractPartOfSpeech Aspect :IMPV "Imperative verb" "فعل أمر"

@partofspeech Imperative AbstractPartOfSpeech :IMPF "Imperfect verb" "فعل مضارع"

# -----------------------------------------
# Mood
# -----------------------------------------
@partofspeech Indicative AbstractMood :IND "Indicative mood (default)" "مرفوع"
@construct Subjunctive Mood :SUBJ "Subjunctive mood" "منصوب"
@construct Jussive Mood :JUS "Jussive mood" "مجزوم"

# -----------------------------------------
# Verb Forms
# -----------------------------------------
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

# -----------------------------------------
# Article Proclitic
# -----------------------------------------
@partofspeech Al_ AbstractArticle :AL "Twelfth verb form" "فعل"
@partofspeechparam AlmA_ AbstractArticle Union{Determiner,Negative} :PARTALMA "Determiner Al + negative particle ma" "حرف نصب"
@partofspeechparam Aa_ AbstractArticle Demonstrative{Particle} :DEMAA "Demonstrative particle" "حرف نصب"

@partofspeechparam LA_ AbstractParticle Negative :NEGLA "Negative particle lA" "حرف نصب"

@partofspeechparam MA_ AbstractProclitic Negative :NEGMA "Negative particle mA" "حرف نصب"
@construct MA_ Relative{Pronoun} :RELMA "Relative particle mA" "حرف نصب"
@construct MA_ Particle :MAPART "Particle mA" "حرف نفي"

@partofspeechparam Ma_ AbstractProclitic Union{Negative} :NEGMA2 "Negative particle ma" "حرف نصب"

# -----------------------------------------
# Pronouns
# -----------------------------------------
@construct Demonstrative Pronoun :DEM "Demonstrative pronoun" "اسم اشارة"
@construct Relative Pronoun :REL "Relative pronoun" "اسم موصول"
@construct Interrogative Pronoun :INTADV "Imperative verbal noun" "اسم فعل أمر"
@partofspeech Personal AbstractPronoun Symbol("PRON") "Personal pronoun" "ضمير"
@partofspeech Exclamation AbstractPronoun Symbol("PRON") "Personal pronoun" "ضمير"

# -----------------------------------------
# Adverbs
# -----------------------------------------
@partofspeech Adverb AbstractAdverb :NUMR "Imperative verbal noun" "اسم فعل أمر"
@construct Interrogative Adverb :INTADV "Imperative verbal noun" "اسم فعل أمر"
@construct Relative Adverb :RELADV "Imperative verbal noun" "اسم فعل أمر"

# -----------------------------------------
# Prepositions
# -----------------------------------------
@partofspeech Ea_ AbstractPreposition :PREEA "Preposition Ea" "حرف نصب"
@partofspeech EalaY_ AbstractPreposition :PREEALAY "Preposition EalaY" "حرف نصب"
@partofspeech Fiy_ AbstractPreposition :PREFIY "Preposition fiy" "حرف نصب"
@partofspeech HA_ AbstractPreposition :PREHA "Demonstrative preposition hA" "حرف نصب"
@partofspeech Ha_ AbstractPreposition :FMHA "Future marker preposition Ha" "حرف نصب"
@partofspeech Ka_ AbstractPreposition :PREKA "Preposition ka" "حرف نصب"
@partofspeech Libi_ AbstractPreposition :PRELIBI "Preposition ka" "حرف نصب"
@partofspeech Min_ AbstractPreposition :PREMIN "Preposition ka" "حرف نصب"
@partofspeech Sa_ AbstractPreposition :FMSA "Future marker preposition sa" "حرف نصب"
@partofspeech Ta_ AbstractPreposition :PRETA "Preposition ta" "حرف نصب"
@partofspeechparam WA_ AbstractPreposition Vocative :VOCWA "Vocative preposition wa" "حرف نصب"
@partofspeechparam YA_ AbstractPreposition Vocative :VOCYA "Vocative preposition ya" "حرف نصب"

@partofspeechparam Ish_ AbstractPreposition Interrogative :PREISH "Preposition ish" "حرف نصب"
@partofspeechparam Bi_ AbstractPartOfSpeech Preposition :PREBI "Preposition bi" "حرف نصب"

@partofspeechparam La_ AbstractPartOfSpeech Preposition :PRELA "Preposition la" "حرف نصب"
@construct La_ Responsive :RESLA "Responsive conditional la" "حرف نصب"
@construct La_ Emphatic :EMPHLA "Emphatic particle la" "حرف نصب"
@construct La_ Purposive :EMPHLA "Emphatic particle la" "حرف نصب"
@construct La_ Imperative{Preposition} :EMPHLA "Emphatic particle la" "حرف نصب"

@partofspeechparam LaHa_ AbstractPreposition Union{Emphatic,FutureMarker} :PRELA "Emphatic la + future marker Ha" "حرف نصب"
@construct LaHa_ Union{Responsive,FutureMarker} :PRELAHA "Response conditional la + future marker Ha" "حرف نصب"

@partofspeechparam Li_ AbstractPreposition Jussive :JUSLI "Jussive li" ""
@construct Li_ Preposition :PRELI "Preposition li" ""
@construct Li_ Subjunctive{Preposition} :SUBLI "Preposition li" ""

@partofspeechparam Wa_ AbstractPartOfSpeech Preposition :PREWA "Preposition wa" ""
@construct Wa_ Particle :PARTWA "Particle wa" ""

# -----------------------------------------
# Particles
# -----------------------------------------
@construct Bi_ Particle :PARTBI "Particle bi" "حرف نصب"
@construct Interrogative Particle :INTADV "Imperative verbal noun" "اسم فعل أمر"
@construct Demonstrative Particle :DEM "Demonstrative pronoun" "اسم اشارة"
@construct Accusative Particle :ACC "Accusative particle" "حرف نصب"
@construct Demonstrative Particle :DEM "Demonstrative pronoun" "اسم اشارة"
@partofspeech Amendment AbstractParticle Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Answer AbstractParticle Symbol("ANS") "Answer particle" "حرف جواب"
@partofspeech Aversion AbstractParticle Symbol("AVR") "Aversion particle" "حرف ردع"
@partofspeech Cause AbstractParticle Symbol("CAUS") "Particle of cause" "حرف سببية"
@partofspeech Certainty AbstractParticle Symbol("CERT") "Particle of certainty" "حرف تحقيق"
@partofspeech Circumstantial AbstractParticle Symbol("CIRC") "Circumstantial particle" "حرف حال"
@partofspeech Comitative AbstractParticle Symbol("COM") "Comitative particle" "واو المعية"
@partofspeech Conditional AbstractParticle Symbol("COND") "Conditional particle" "حرف شرط"
@partofspeech Equalization AbstractParticle Symbol("EQ") "Equalization particle" "حرف تسوية"
@partofspeech Exhortation AbstractParticle Symbol("EXH") "Exhortation particle" "حرف تحضيض"
@partofspeech Explanation AbstractParticle Symbol("EXL") "Explanation particle" "حرف تفصيل"
@partofspeech Exceptive AbstractParticle Symbol("EXP") "Exceptive particle" "أداة استثناء"
@partofspeech Future AbstractParticle Symbol("FUT") "Future particle" "حرف استقبال"
@partofspeech Focus AbstractParticle Symbol("AMD") "Amendment particle" "حرف استدراك"
@partofspeech Inceptive AbstractParticle Symbol("INC") "Inceptive particle" "حرف ابتداء"
@partofspeech Interpretation AbstractParticle Symbol("INT") "Inceptive particle" "حرف تفسير"
@partofspeech Interrogative AbstractParticle Symbol("INTG") "Interogative particle" "حرف استفهام"
@partofspeech Preventive AbstractParticle Symbol("PREV") "Preventive particle" "حرف كاف"
@partofspeech Prohibition AbstractParticle Symbol("PRO") "Prohibition particle" "حرف نهي"
@partofspeech Resumption AbstractParticle Symbol("REM") "Resumption particle" "حرف استئنافية"
@partofspeech Restriction AbstractParticle Symbol("RES") "Restriction particle" "أداة حصر"
@partofspeech Retraction AbstractParticle Symbol("RET") "Retraction particle" "حرف اضراب"
@partofspeech Result AbstractParticle Symbol("RSLT") "Result particle" "حرف واقع في جواب الشرط"
@partofspeech Supplemental AbstractParticle Symbol("SUP") "Suplemental particle" "حرف زائد"
@partofspeech Surprise AbstractParticle Symbol("SUR") "Surprise particle" "حرف فجاءة"
@partofspeech Verbal AbstractParticle Symbol("AMD") "Amendment particle" "حرف استدراك"

@partofspeech ActiveParticle AbstractDerivedNoun Symbol("ACT PCPL") "Active particle" "اسم فاعل" 
@partofspeech PassiveParticle AbstractDerivedNoun Symbol("PASS PCPL") "Passive particle" "اسم مفعول"  
@partofspeech VerbalNoun AbstractDerivedNoun Symbol("VN") "Verbal noun" "مصدر"

# -----------------------------------------
# Verbs
# -----------------------------------------
@construct Bi_ Progressive :PROGVBI "Progressive verb particle bi" "حرف نصب"
@construct Demonstrative AbstractParticle Symbol("DEMPART") "Conditional particle" "حرف شرط"
@partofspeech Pseudo AbstractVerb Symbol("VN") "Verbal noun" "مصدر"

# -----------------------------------------
# Conjunctions
# -----------------------------------------
@partofspeech Coordinating AbstractConjunction Symbol("VN") "Verbal noun" "مصدر"

@partofspeechparam Fa_ AbstractConjunction Conjunction :CONJFA "Jussive li" ""
@construct Fa_ Connective :CONNFA "Progressive verb particle bi" "حرف نصب"
@construct Fa_ Responsive :RESFA "Progressive verb particle bi" "حرف نصب"
@construct Fa_ Subjunctive{Conjunction} :SUBCONJFA "Progressive verb particle bi" "حرف نصب"
@construct Wa_ Conjunction :CONJWA "Particle wa" ""
@construct Wa_ Subordinating :SUBCONJWA "Particle wa" ""
# Wa Particle is already defined in Section Prepositions

# -----------------------------------------
# Question proclitic
# -----------------------------------------
@partofspeechparam A_ AbstractProclitic Interrogative{Partical} :INTPARA "" ""

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

@partofspeechparam _Ah AbstractParticle Vocative :VOCAH "" ""
# LA is already defined in Article proclitic

@partofspeechparam _MA AbstractEnclitic Union{Interrogative{Pronoun}} :INTPROMA "" ""
@partofspeechparam _Ma AbstractProclitic Union{Interrogative{Pronoun}} :INTPROMA2 "" ""

@construct _MA Union{Relative{Pronoun}} :RELPROMA "" ""
@construct _Ma Union{Relative{Pronoun}} :RELPROMA2 "" ""
@construct _MA Union{Subordinating{Pronoun}} :RELPROMA "" ""
@construct _Ma Union{Subordinating{Pronoun}} :RELPROMA2 "" ""

@partofspeechparam _Man AbstractEnclitic Interrogative{Pronoun} :INTPROMAN "" ""
@construct _Man Relative{Pronoun} :RELPROMAN "" ""


enough to maintain radio contact, but you are free to evade radar coverage.'
    'Roger, heading west,' Montaigne replied.
    In back, Ryan was sitting by his gun. There were eight wounded men in the helicopter, but two medics were working on them and Ryan was unable to offer any help better than that. Clark rejoined him.
    'Okay, what are we going to do with Cortez and Escobedo?'
    'Cortez we want, the other one, hell, I don't know. How do we explain kidnapping him?'
    'What do you think we're going to do, put him on trial?' Clark asked over the din of the engines and the wind.
    'Anything else is cold-blooded murder. He's a prisoner now, and killing prisoners is murder, remember?'
    You're getting legal on me, Clark thought, but he knew that Ryan was right. Killing prisoners was contrary to the code.
    'So, we take him back?'
    'That blows the operation,' Ryan said. He knew he was talking too loudly for the subject. He was supposed to be quiet and thoughtful now, but the environment and the event of the evening defeated that. 'Christ, I don't know what to do.'
    'Where are we going - I mean, where's this chopper going?'
    'I don't know.' Ryan keyed his intercom to ask. He was surprised by the answer, and communicated it to Clark.
    'Look, let me handle it. I got an idea. I'll take him out of here when we land. Larson and I will tidy that part of it. I think I know what'll work.'
    'But---'
    'You don't really want to know, do you?'
    'You can't murder him!' Jack insisted.
    'I won't,' Clark said. Ryan didn't know how to read that answer. But it did offer a way out, and he took it.
*
787


Larson got there first. The airfield was poorly lit, only a few glow lights showing under the low ceiling, but he managed to get his aircraft down, and with his anti-collision lights blinking, he guided the way to the fuel-service area. He'd barely stopped when the helicopter landed fifty yards away.
    Larson was amazed. In the dim blue lights he could see several holes in the aircraft. A man in a flight suit ran out towards him. Larson met him and led him to the fuel hose. It was a long one, about an inch in diameter, used to fuel private aircraft. The power to the pumps was off, but Larson knew where the switch was, and he shot the door lock. He'd never done that before, but just like in the movies, five rounds removed the brass mechanism from the wooden frame of the door. A minute later, Sergeant Bean had the nozzle into one of the outrigger tanks. That was when Clark and Escobedo appeared. A soldier held a rifle to the latter's head while the CIA officers conferred.
    'We're going back,' Clark told the pilot.
    'What?' Larson turned to see two soldiers taking Juardo out of the Beech and towards the helicopter.
    'We're taking our friend here back home to Medellin. Couple of things we have to do first, though . . .'
    'Oh, great.' Larson walked back to his aircraft and climbed up on the wing to open his fuel caps. He had to wait fifteen minutes. The helicopter usually drank fuel trough a far larger hose. When the crewman took the hose back, the chopper's rotor started turning again. Soon after that, it lifted off into the night. There was lightning ahead to the north, and Larson was just as happy that he wasn't flying there. He let Clark handle the fueling while he went inside to make a telephone call. The funny part was that he'd even make money off the deal. Except that there was nothing funny about anything had happened during the preceding month.

'Okay,' PJ said into the intercom. 'That's the last pit stop, and we're heading for home.'
    'Engine temps aren't all that great,' Willis said. The
788


T-64-GE-7 engines were designed to burn aviation kerosene, not the more volatile and dangerous high-octane gas used by private planes. The manufacturer's warranty said that you could use that fuel for thirty hours before the burner cans were crisped down to ashes, but the warranty didn't say anything about bad valve springs and P3 loss.
    'Looks like we're going to cool 'em down just find,' the colonel said, nodding at the weather ahead.
    'Thinking positive again, are we, Colonel?' Willis said as coolly as he could manage. It wasn't just a thunderstorm there, it was a hurricane that stood between them and Panama. On the whole, it was something scarier than being shot at. You couldn't shoot back at a storm.
    'CLAW, this is CAESAR, over,' Johns called on his radio.
    'I read you, CAESAR.'
    'How's the weather ahead look?'
    'Bad, sir. Recommend that you head west, find a spot to climb over and try to approach from the Pacific side.'
    Willis scanned the navigational display. 'Uh-uh.'
    'CLAW, we just gained about five-kay pounds in weight. We, uh, looks like we need another way.'
    'Sir, the storm is moving west at fifteen knots, and your course to Panama takes you into the lower-right quadrant.'
    Head-winds all the way, PJ told himself.
    'Give me a number.'
    'Estimated peak winds on your course home are seven-zero knots.'
    'Great!' Willis observed. 'That makes us marginal for Panama, sir. Very damned marginal.'
    Johns nodded. The winds were bad enough. The rain that came with them would greatly reduce engine efficiency. His flight range might be less than half of what it should be . . . no way he could tank in the storm . . . the smart move would be to find a place to land and stay there, but he couldn't do that either . . . Johns keyed his radio yet again.
    'CLAW, this is CAESAR. We are heading for Alternate One.'
789


    'Are you out of your skull?' Francie Montaigne replied.
    'I don't like it, sir,' Willis said.
    'Fine, you can testify to that effect someday. It's only a hundred miles off the coast, and if it doesn't work, we'll use the winds to slingshot us around. CLAW, I need a position check on Alternate One.'

'You crazy fucker,' Montaigne breathed. To her communications people: 'Call up Alternate One. I need a position check, and I need it now.'

Murray was not having any fun at all. Though Adele wasn't really a major hurricane, Wegener had told him, it was more than he had ever expected to see. The seas had been forty feet, and though once Panache had looked like a white steel cliff alongside the dock, she now rode like a child's toy in a bathtub. The FBI agent had a scopalomine patch stuck to his head below and and behind his ear to combat motion-sickness, but it wasn't fighting hard enough a the moment. But Wegener was just sitting in his bridge chair, smoking his pipe like the Old man of the Sea while Murray held on to the grab-bar over his head, feeling like the man on the flying trapeze.
    They were not in their programmed position. Wegener had explained to his visitor that there was only one place they could be. It moved, but that's where they had to be, and Murray was distantly thankful that the seas weren't quite as bad as they had been. he worked his way over to the door and looked out at the towering cylinder of cloud.
    'Panache, this is CLAW, over,' the speaker said. Wegener rose to take the mike.
    'CLAW, this is Panache. Your signal is weak but readable, over.'
    Wegener gave it to the pilot, who sounded like a girl, he thought. Christ, they were everywhere now.
    'CAESAR is inbound yours.'
    'Roger. Please advise CAESAR that conditions are below
790