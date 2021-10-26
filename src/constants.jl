# const DERIVED_NOUNS = Dict(
#     Symbol("ACT PCPL") => ActiveParticle(),
#     Symbol("PASS PCPL") => PassiveParticle(),
#     :VN => VerbalNoun()
# )

const GOOGLE_DRIVE = "https://docs.google.com/uc?export=download"
const CATALOGUE = "https://raw.githubusercontent.com/CAMeL-Lab/camel_tools/master/camel_tools/data/catalogue.json"
const CAMEL_DATA = joinpath(@__DIR__, "..", "data")
const CAMEL_CATALOGUE = joinpath(@__DIR__, "catalogue.json")

# -----------------------------------------
# Aspects
# -----------------------------------------
const VERB_ASPECTS = Dict(
    :PERF => Aspect(Perfect(:PERF)),
    :IMPF => Aspect(Imperfect(:IMPF)),
    :IMPV => Aspect(Imperative(:IMPV))
)
const CAMEL_VERB_ASPECTS = Dict(
    :asp!c => Aspect(Command()),
    :asp!p => Aspect(Perfect()),
    :asp!i => Aspect(Imperfect()),
    :asp!n => Aspect(NotApplicable())
)
const CAMEL_VERB_ASPECTS_2 = Dict(
    :Command => "asp!c", 
    :Perfect => "asp!p",
    :Imperfect => "asp!i",
    :NotApplicable => "asp!n"
)

# # -----------------------------------------
# # Nominal Cases
# # -----------------------------------------
# const NOMINAL_CASES = Dict(
#     :NOM => Nominative(),
#     :ACCC => Accusative{Case}(:ACC, "Accusative case", "منصوب"),
#     :GEN => Genetive()
# )
# const CAMEL_NOMINAL_CASES = Dict(
#     :cas!n => Nominative(:n, "Nominative case", "مرفوع"),
#     :cas!a => Accusative{Case}(:a, "Accusative case", "منصوب"),
#     :cas!g => Genetive(:g, "Genetive case", "مجرور"),
#     :cas!u => Undefined(:u, "Undefined", ""),
#     :cas!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_NOMINAL_CASES_2 = Dict(
#     :Nominative => "cas!n",
#     :Accusative_Case => "cas!a",
#     :Genetive => "cas!g",
#     :Undefined => "cas!u",
#     :NotApplicable => "cas!na"
# )

# # -----------------------------------------
# # Genders
# # -----------------------------------------
# const GENDERS = Dict(
#     :M => Masculine(),
#     :F => Feminine()
# )
# const CAMEL_GENDERS = Dict(
#     :gen!m => Masculine(:m, "Masculine", "الجنس"),
#     :gen!f => Feminine(:f, "Feminine", "الجنس"),
#     :gen!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_GENDERS_2 = Dict(
#     :Masculine => "gen!m",
#     :Feminine => "gen!f",
#     :NotApplicable => "gen!na"
# )
# const CAMEL_FORM_GENDERS = Dict(
#     :form_gen!m => Masculine(:m, "Masculine", "الجنس"),
#     :form_gen!f => Feminine(:f, "Feminine", "الجنس"),
#     :form_gen!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_FORM_GENDERS_2 = Dict(
#     :Masculine => "gen!m",
#     :Feminine => "gen!f",
#     :NotApplicable => "gen!na"
# )

# # -----------------------------------------
# # Numbers
# # -----------------------------------------
# const NUMBERS = Dict(
#     :S => Singular(),
#     :D => Dual(),
#     :PL => Plural()
# )
# const CAMEL_NUMBERS = Dict(
#     :num!s => Singular(:s, "Singular", "العدد"),
#     :num!d => Dual(:d, "Dual", "العدد"),
#     :num!p => Plural(:p, "Plural", "العدد"),
#     :num!u => Undefined(:u, "Undefined", "")
#     :num!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_NUMBERS_2 = Dict(
#     :Singular => "num!s",
#     :Dual => "num!d",
#     :Plural => "num!p",
#     :Undefined => "num!u",
#     :NotApplicable => "num!na"
# )
# const CAMEL_FORM_NUMBERS = Dict(
#     :form_num!s => Singular(:s, "Singular", "العدد"),
#     :form_num!d => Dual(:d, "Dual", "العدد"),
#     :form_num!p => Plural(:p, "Plural", "العدد"),
#     :form_num!u => Undefined(:u, "Undefined", "")
#     :form_num!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_FORM_NUMBERS_2 = Dict(
#     :Singular => "form_num!s",
#     :Dual => "form_num!d",
#     :Plural => "form_num!p",
#     :Undefined => "form_num!u",
#     :NotApplicable => "form_num!na"
# )

# # -----------------------------------------
# # Verb Moods
# # -----------------------------------------
# const VERB_MOODS = Dict(
#     :IND => Indicative(),
#     :SUBJ => Subjunctive{Mood}(),
#     :JUS => Jussive{Mood}()
# )
# const CAMEL_VERB_MOODS = Dict(
#     :mod!i => Indicative(:i, "Indicative mood (default)", "مرفوع"),
#     :mod!s => Subjunctive{Mood}(:s, "Subjunctive mood", "منصوب"),
#     :mod!j => Jussive{Mood}(:j, "Jussive mood", "مجزوم"),
#     :mod!u => Undefined(:u, "Undefined", ""),
#     :mod!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_VERB_MOODS_2 = Dict(
#     :Indicative => "mod!i", 
#     :Subjunctive_Mood => "mod!s",
#     :Jussive_Mood => "mod!j",
#     :Undefined => "mod!u",
#     :NotApplicable => "mod!na"
# )

# # -----------------------------------------
# # Verb Moods
# # -----------------------------------------
# const PERSONS = Dict(
#     Symbol("1") => FirstPerson(),
#     Symbol("2") => SecondPerson(),
#     Symbol("3") => ThirdPerson()
# )
# const CAMEL_PERSONS = Dict(
#     :per!1 => FirstPerson(),
#     :per!2 => SecondPerson(),
#     :per!3 => ThirdPerson(),
#     :per!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_PERSONS_2 = Dict(
#     :FirstPerson => "per!1",
#     :SecondPerson => "per!2",
#     :ThirdPerson => "per!3",
#     :NotApplicable => "per!na"
# )

# # -----------------------------------------
# # Rationality
# # -----------------------------------------
# const CAMEL_RATIONALITY = Dict(
#     :rat!n => No(),
#     :rat!y => Yes(),
#     :rat!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_RATIONALITY_2 = Dict(
#     :No => "rat!n",
#     :Yes => "rat!y",
#     :NotApplicable => "rat!na"
# )

# # -----------------------------------------
# # Nominal States
# # -----------------------------------------
# const NOMINAL_STATES = Dict(
#     :DEF => Definite(),
#     :INDEF => Indefinite()
# )
# const CAMEL_NOMINAL_STATES = Dict(
#     :stt!d => Definite(:d, "Definite state", "معرفة"),
#     :stt!i => Indefinite(:i, "Indefinite state", "نكرة"),
#     :stt!c => Construct(:c, "Construct/Poss/Idafa", ""),
#     :stt!u => Undefined(:u, "Undefined", ""),
#     :stt!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_NOMINAL_STATES_2 = Dict(
#     :Definite => "stt!d",
#     :Indefinite => "stt!i",
#     :Construct => "stt!c",
#     :Undefined => "stt!u",
#     :NotApplicable => "stt!na"
# )

# # -----------------------------------------
# # Verb Voices
# # -----------------------------------------
# const VERB_VOICES = Dict(
#     :ACT => Active(),
#     :PASS => Passive()
# )
# const CAMEL_VERB_VOICES = Dict(
#     :vox!a => Active(:a, "Active voice (default)", "مبني للمعلوم"),
#     :vox!p => Passive(:p, "Passive voice", "مبني للمجهول"),
#     :vox!u => Undefined(:u, "Undefined", ""),
#     :vox!na => NotApplicable(:na, "Not applicable", "")
# )
# const CAMEL_VERB_VOICES_2 = Dict(
#     :Active => "vox!a",
#     :Passive => "vox!p",
#     :Undefined => "vox!u",
#     :NotApplicable => "vox!na"
# )

# # -----------------------------------------
# # Part of Speech
# # -----------------------------------------
# # Nouns
# const NOUNS = Dict(
#     :N => Noun(),
#     :PN => ProperNoun()
# )
# const CAMEL_NOUNS = Dict(
#     :pos!noun => Noun(:n, "Noun", "اسم"),
#     :pos!noun_prop => ProperNoun(:noun_prop, "Proper noun", "اسم علم"),
#     :pos!noun_num => Numeral(:noun_num, "Number noun", ""),
#     :pos!noun_quant => Quantity(:noun_quant, "Quantity noun", "")
# )
# const CAMEL_NOUNS_2 = Dict(
#     :Noun => "pos!noun",
#     :ProperNoun => "pos!noun_prop",
#     :Numeral => "pos!noun_num",
#     :Quantity => "pos!noun_quant"
# )
# # Adjective
# const DERIVED_NOMINALS = Dict(
#     :ADJ => Adjective(),
#     :IMPN => ImperativeVerbalNoun()
# )
# const CAMEL_ADJECTIVES = Dict(
#     :pos!adj => Adjective(:adj, "Adjective", "صفة"),
#     :pos!adj_comp => Comparative(:adj_comp, "Comparative adjective", ""),
#     :pos!adj_num => Numerical(:adj_num, "Numerical adjective", ""),
# )
# const CAMEL_ADJECTIVES_2 = Dict(
#     :Adjective => "pos!adj",
#     :Comparative => "pos!adj_comp",
#     :Numerical => "pos!adj_num"
# )
# # Adverb
# const ADVERBS = Dict(
#     :T => Time(),
#     :LOC => Location()
# )
# const CAMEL_ADVERBS = Dict(
#     :pos!adv => Adverb(),
#     :pos!adv_interrog => Interrogative{Adverb}(:adv_interrog, "Interrogative adverb", ""),
#     :pos!adv_rel => Relative{Adverb}(:adv_rel, "Relative adverb", ""),
# )
# const CAMEL_ADVERBS_2 = Dict(
#     :Adverb => "pos!adv",
#     :Interrogative_Adverb => "pos!adv_interrog",
#     :Relative_Adverb => "pos!adv_rel"
# )
# # Pronouns
# const PRONOUNS = Dict(
#     :PRON => Personal(),
#     :DEM => Demonstrative{Pronoun}(),
#     :REL => Relative{Pronoun}()
# )
# const CAMEL_PRONOUNS = Dict(
#     :pos!pron => Pronoun(:pron, "Pronoun", ""),
#     :pos!pron_dem => Demonstrative{Pronoun}(:pron_dem, "Demonstrative pronoun", ""),
#     :pos!pron_rel => Relative{Pronoun}(:pron_rel, "Relative pronoun", ""),
#     :pos!pron_interrog => Interrogative{Pronoun}(:pron_interrog, "Interrogative pronoun", ""),
#     :pos!pron_exclam => Exclamation(:pron_exclam, "Exclamation pronoun", "")
# )
# const CAMEL_PRONOUNS_2 = Dict(
#     :Personal => "pos!pron",
#     :Demonstrative_Pronoun => "pos!pron_dem",
#     :Relative_Pronoun => "pos!pron_rel",
#     :Interrogative_Pronoun => "pos!pron_interrog",
#     :Exclamation => "pos!pron_exclam"
# )
# # Verb
# const VERB_FORMS = Dict(
#     Symbol("(I)") => VerbFormI(),
#     Symbol("(II)") => VerbFormII(),
#     Symbol("(III)") => VerbFormIII(),
#     Symbol("(IV)") => VerbFormIV(),
#     Symbol("(V)") => VerbFormV(),
#     Symbol("(VI)") => VerbFormVI(),
#     Symbol("(VII)") => VerbFormVII(),
#     Symbol("(VIII)") => VerbFormVIII(),    
#     Symbol("(IX)") => VerbFormIX(),
#     Symbol("(X)") => VerbFormX(),    
#     Symbol("(XI)") => VerbFormXI(),
#     Symbol("(XII)") => VerbFormXII()
# )
# const CAMEL_VERB = Dict(
#     :pos!verb => Verb(:verb, "Verb POS"),
#     :pos!pseudo => Pseudo(:pseudo, "Pseudo Verb POS")
# )
# const CAMEL_VERB_2 = Dict(
#     :Verb => "pos!verb",
#     :Pseudo => "pos!pseudo"
# )
# # Particles 
# const PARTICLES = Dict(
#     Symbol("sa+") => Future(Symbol("FUT"), "Prefixed particle indicating the future ('they will')", "حرف استقبال"),
#     Symbol("ya+") => Vocative(Symbol("VOC"), "A vocative prefix usually translated as 'O'", "حرف نداء"),
#     Symbol("ha+") => Vocative(Symbol("VOC"), "A vocative prefix usually translated as 'Lo!'", "حرف نداء"),
#     Symbol("A:INTG+") => Interogative(Symbol("INTG"), "Alif as a prefixed interrogative particle ('is?', 'did?', 'do?')", "حرف استفهام"),
#     Symbol("A:EQ+") => Equalization(Symbol("EQ"), "Alif as a prefixed equalization particle ('whether')", "حرف تسوية"),
#     Symbol("w:REM+") => Resumption(Symbol("REM"), "Waw as a resumption prefix ('then' or 'so')", "حرف استئنافية"),
#     Symbol("w:CIRC+") => Circumstantial(Symbol("CIRC"), "Waw as a circumstantial prefix ('while')", "حرف حال"),
#     Symbol("w:SUP+") => Supplemental(Symbol("SUP"), "Waw as a supplemental perfix ('then' pr 'so')", "حرف زائد"),
#     Symbol("w:COM+") => Comitative(Symbol("COM"), "Waw as a comitative perfix ('with')", "واو المعية"),
#     Symbol("f:REM+") => Resumption(Symbol("REM"), "Fa as a resumption prefix ('then' or 'so')", "حرف استئنافية"),
#     Symbol("f:RSLT+") => Result(Symbol("RSLT"), "Fa as a result prefix ('then')", "حرف واقع في جواب الشرط"),
#     Symbol("f:SUP+") => Supplemental(Symbol("SUP"), "Fa as a supplemental prefix ('then' or 'so')", "حرف زائد"),
#     Symbol("f:CAUS+") => Cause(Symbol("CAUS"), "Fa as a cause prefix ('then' or 'so')", "حرف سببية"),
#     Symbol("ACC") => Accusative(),
#     Symbol("AMD") => Amendment(),
#     Symbol("ANS") => Answer(),
#     Symbol("AVR") => Aversion(),
#     Symbol("CAUS") => Cause(),
#     Symbol("CERT") => Certainty(),
#     Symbol("CIRC") => Circumstantial(),
#     Symbol("COM") => Comitative(),
#     Symbol("COND") => Conditional(),
#     Symbol("EQ") => Equalization(),
#     Symbol("EXH") => Exhortation(),
#     Symbol("EXL") => Explanation(),
#     Symbol("EXP") => Exceptive(),
#     Symbol("FUT") => Future(),
#     Symbol("INC") => Inceptive(),
#     Symbol("INT") => Interpretation(),
#     Symbol("INTG") => Interrogative(),
#     Symbol("NEG") => Negative(),
#     Symbol("PREV") => Preventive(),
#     Symbol("PRO") => Prohibition(),
#     Symbol("REM") => Resumption(),
#     Symbol("RES") => Restriction(),
#     Symbol("RET") => Retraction(),
#     Symbol("RSLT") => Result(),
#     Symbol("SUP") => Supplemental(),
#     Symbol("SUR") => Surprise(),
#     Symbol("VOC") => Vocative()
# )
# const CAMEL_PARTICLES = Dict(
#     :pos!part => Particle(:part, "Particle", ""),
#     :pos!part_dem => Demonstrative{Particle}(:part_dem, "Demonstrative Particle", ""),
#     :pos!part_det => Determiner(:part_det, "Determiner particle", ""),
#     :pos!part_focus => Focus(:part_focus, "Focus particle", ""),
#     :pos!part_fut => FutureMarker(:part_fut, "Future marker particle", ""),
#     :pos!part_interrog => Interrogative{Particle}(:part_interrog, "Interrogative particle", ""),
#     :pos!part_neg => Negative(:part_neg, "Negative particle", ""),
#     :pos!part_restrict => Restriction(:part_restrict, "Restrictive particle", ""),
#     :pos!part_verb => Verbal(:part_verb, "Verbal particle", ""),
#     :pos!part_voc => Vocative(:part_voc, "Vocalized/Vocative particle", "")
# )
# const CAMEL_PARTICLES_2 = Dict(
#     :Particle => "pos!part",
#     :Demonstrative_Particle => "pos!part_dem",
#     :Determiner => "pos!part_det",
#     :Focus => "pos!part_focus",
#     :FutureMarker => "pos!part_fut",
#     :Interrogative_Particle => "pos!part_interrog",
#     :Negative => "pos!part_neg",
#     :Restriction => "pos!part_restrict",
#     :Verbal => "pos!part_verb",
#     :Vocative => "pos!part_voc"
# )
# # Prepositions
# const PREPOSITION = Dict(
#     :P => Preposition(),
# )
# const CAMEL_PREPOSITION = Dict(
#     :pos!prep => Preposition(:prep, "Preposition", ""),
# )
# const CAMEL_PREPOSITION_2 = Dict(
#     :Preposition => "pos!prep",
# )
# # Conjunctions
# const CONJUNCTIONS = Dict(
#     :CONJ => Coordinating(),
#     :SUB => Subordinating{Conjunction}()
# )
# const CAMEL_CONJUNCTIONS = Dict(
#     :pos!conj => Conjunction(:conj, "Conjunction", ""),
#     :pos!conj_sub => Subordinating{Conjunction}(:conj_sub, "Subordinating conjunction", "")
# )
# const CAMEL_CONJUNCTIONS_2 = Dict(
#     :Conjunction => "pos!conj",
#     :Subordinating_Conjunction => "pos!conj_sub"
# )
# # Others
# const CAMEL_OTHER_POS = Dict(
#     :pos!abbrev => Abbreviation(:abbrev, "Abbreviation", ""),
#     :pos!punc => Punctuation(:punc, "Punctuation", ""),
#     :pos!interj => Interjection(:interj, "Interjection", ""),
#     :pos!digit => DigitalNumbers(:digit, "Digital numbers", ""),
#     :pos!latin => Foreign(:latin, "Latin characters", "")
# )

# # -----------------------------------------
# # Article Proclitics
# # -----------------------------------------
# const ARTICLE_PROCLITIC = Dict(
#     Symbol("Al+") => Al_(Symbol("P"), "Determiner prefix ('the')", "حرف جر")
# )
# const CAMEL_ARTICLE_PROCLITIC = Dict(
#     :prc0!0 => NoProclitic(Symbol("0"), "No proclitic", ""),
#     :prc0!na => NotApplicable(:na, "Not applicable", ""),
#     :prc0!Aa_prondem => Aa_{Demonstrative{Particle}}(:Aa_prondem, "Demonstrative particle Aa", ""),
#     :prc0!Al_det => Al_(:Al_det, "Determiner"),
#     :prc0!AlmA_neg => AlmA_{Union{Determiner,Negative}}(:AlmA_neg, "Determiner Al + negative particle mA", ""),
#     :prc0!lA_neg => LA_{Negative}(:lA_neg, "Negative particle lA", ""),
#     :prc0!mA_neg => MA_{Negative}(:mA_neg, "Negative particle mA", ""),
#     :prc0!ma_neg => Ma_{Negative}(:ma_neg, "Negative particle ma", ""),
#     :prc0!mA_part => MA_{Particle}(:mA_part, "Particle MA", ""),
#     :prc0!mA_rel => MA_{Relative{Pronoun}}(:mA_rel, "Relative pronoun mA", "")
# )
# const CAMEL_ARTICLE_PROCLITIC_2 = Dict(
#     :NoProclitic => "prc0!0",
#     :NotApplicable => "prc0!na",
#     :Aa_Demonstrative_Particle => "prc0!Aa_prondem",
#     :Al_ => "prc0!Al_det",
#     :AlmA_Union_Determiner_Negative => "prc0!AlmA_neg",
#     :LA_Negative => "prc0!lA_neg",
#     :MA_Negative => "prc0!mA_neg",
#     :Ma_Negative => "prc0!ma_neg",
#     :MA_Particle => "prc0!mA_part",
#     :MA_Relative_Pronoun => "prc0!mA_rel"
# )

# # -----------------------------------------
# # Preposition Proclitics
# # -----------------------------------------
# const PREPOSITIONS_PROCLITIC = Dict(
#     Symbol("bi+") => Bi_{Preposition}(:P, "Preposition prefix ('by', 'with', 'in')", "حرف جر"),
#     Symbol("ka+") => Ka_(:P, "Preposition prefix ('like' or 'thus')", "حرف جر"),
#     Symbol("ta+") => Ta_(:P, "particle of oath prefix used as a preposition ('by Allah')", "حرف جر"),
#     Symbol("w:P+") => Wa_{Preposition}(:P, "Particle of oath prefix used as a preposition ('by the pen')", "حرف جر"),
#     Symbol("l:P+") => La_{Preposition}(:P, "Lam as a prefixed preposition", "حرف جر")
# )
# const CAMEL_PREPOSITIONS_PROCLITIC = Dict(
#     :prc1!0 => NoProclitic(Symbol("0"), "No proclitic", ""),
#     :prc1!na => NotApplicable(:na, "Not applicable", ""),
#     Symbol("prc1!<i\$h_interrog") => Ish_(Symbol("<i\$h_interrog"), "Interrogative ish", ""),
#     :prc1!bi_part => Bi_{Particle}(:bi_part, "Particle Bi", ""),
#     :prc1!bi_prep => Bi_{Preposition}(:bi_prep, "Preposition Bi", ""),
#     :prc1!bi_prog => Bi_{Progressive}(:bi_prog, "Progressive Bi", ""),
#     :prc1!Ea_prep => Ea_(:Ea_prep, "Preposition Ea", ""),
#     :prc1!EalaY_prep => EalaY_(:EalaY_prep, "Preposition EalaY", ""),
#     :prc1!fiy_prep => Fiy_(:fiy_prep, "Preposition fiy", ""),
#     :prc1!hA_dem => HA_(:hA_dem, "Demonstrative hA", ""),
#     :prc1!Ha_fut => Ha_(:Ha_fut, "Future marker Ha", ""),
#     :prc1!ka_prep => Ka_(:ka_prep, "Preposition ka", ""),
#     :prc1!la_emph => La_{Emphatic}(:la_emph, "Emphatic particle la", ""),
#     :prc1!la_prep => La_{Preposition}(:la_prep, "Emphatic preposition la", ""),
#     :prc1!la_rc => La_{Responsive}(:la_prep, "Emphatic preposition la", ""),
#     :prc1!libi_prep => Libi_(:libi_prep, "Preposition li + preposition bi", ""),
#     :prc1!laHa_emphfut => LaHa_{Union{Emphatic,FutureMarker}}(:laHa, "Emphatic la + future marker Ha", ""),
#     :prc1!laHa_rcfut => LaHa_{Union{Responsive,FutureMarker}}(:laHa, "Responsive la + future marker Ha", ""),
#     :prc1!li_jus => Li_{Jussive}(:li_jus, "Jussive li", ""),
#     :prc1!min_prep => Min_(:min_prep, "Preposition min", ""),
#     :prc1!sa_fut => Sa_(:sa_fut, "Future marker sa", ""),
#     :prc1!ta_prep => Ta_(:ta_prep, "Preposition ta", ""),
#     :prc1!wa_part => Wa_{Particle}(:wa_part, "Particle wa", ""),
#     :prc1!wa_prep => Wa_{Preposition}(:wa_prep, "Preposition wa", ""),
#     :prc1!wA_voc => WA_{Vocative}(:wA_voc, "Vocative wA", ""),
#     :prc1!yA_voc => YA_{Vocative}(:yA_voc, "Vocative yA", "")
# )
# const CAMEL_PREPOSITIONS_2 = Dict(
#     :ALDeterminer => "Al_det",
#     :BiPrep => "bi_prep",
#     :EaPrep => "ea_prep",
#     :EalaYPrep => "EalaY_prep",
#     :FiyPrep => "fiy_prep",
#     :KaPrep => "ka_prep",
#     :TaPrep => "ta_prep",
#     :WaPrep => "wa_prep",
#     :LaPrep => "la_prep",
#     :LibiPrep => "libi_prep",
#     :LiPrep => "li_prep",
#     :MinPrep => "min_prep"
# )

# const CONJUNCTIONS_PROCLITIC = Dict(
#     Symbol("w:CONJ+") => Wa_{Conjunction}(),
#     Symbol("f:CONJ+") => Fa_{Conjunction}()
# )
# const CAMEL_CONJUNCTIONS_PROCLITIC = Dict(
#     :fa_conj => Fa_{Conjunction}()
#     :fa_conn => Fa_{Connective}(),
#     :fa_rc => Fa_{Responsive}(),
#     :fa_sub => Fa_{Subordinating{Conjunction}}()
# )


# # -----------------------------------------
# # Lam Prefixes
# # -----------------------------------------
# const LAM_PREFIXES = Dict(
#     Symbol("l:EMPH+") => La_{Emphatic}(),
#     Symbol("l:IMPV+") => La_{Imperative{Preposition}}(),
#     Symbol("l:PRP+") => La_{Purposive}()
# )
# const CAMEL_LAM_PREFIXES = Dict(
#     :la_emph => La_{Emphatic}(),
# )
# const CAMEL_LAM_PREFIXES_2 = Dict(
#     :EmphaticLam => "la_emph",
# )

# const SUFFIXES = Dict(
#     Symbol("+VOC") => Vocative(Symbol("VOC"), "Vocative suffix", "حرف نداء"),
#     Symbol("+n:EMPH") => EmphaticNun(Symbol("+n:EMPH"), "Emphatic nun", "لام التوكيد")
# )
# const PARTICLES = Dict(
#     Symbol("sa+") => Future(Symbol("FUT"), "Prefixed particle indicating the future ('they will')", "حرف استقبال"),
#     Symbol("ya+") => Vocative(Symbol("VOC"), "A vocative prefix usually translated as 'O'", "حرف نداء"),
#     Symbol("ha+") => Vocative(Symbol("VOC"), "A vocative prefix usually translated as 'Lo!'", "حرف نداء"),
#     Symbol("A:INTG+") => Interogative(Symbol("INTG"), "Alif as a prefixed interrogative particle ('is?', 'did?', 'do?')", "حرف استفهام"),
#     Symbol("A:EQ+") => Equalization(Symbol("EQ"), "Alif as a prefixed equalization particle ('whether')", "حرف تسوية"),
#     Symbol("w:REM+") => Resumption(Symbol("REM"), "Waw as a resumption prefix ('then' or 'so')", "حرف استئنافية"),
#     Symbol("w:CIRC+") => Circumstantial(Symbol("CIRC"), "Waw as a circumstantial prefix ('while')", "حرف حال"),
#     Symbol("w:SUP+") => Supplemental(Symbol("SUP"), "Waw as a supplemental perfix ('then' pr 'so')", "حرف زائد"),
#     Symbol("w:COM+") => Comitative(Symbol("COM"), "Waw as a comitative perfix ('with')", "واو المعية"),
#     Symbol("f:REM+") => Resumption(Symbol("REM"), "Fa as a resumption prefix ('then' or 'so')", "حرف استئنافية"),
#     Symbol("f:RSLT+") => Result(Symbol("RSLT"), "Fa as a result prefix ('then')", "حرف واقع في جواب الشرط"),
#     Symbol("f:SUP+") => Supplemental(Symbol("SUP"), "Fa as a supplemental prefix ('then' or 'so')", "حرف زائد"),
#     Symbol("f:CAUS+") => Cause(Symbol("CAUS"), "Fa as a cause prefix ('then' or 'so')", "حرف سببية"),
#     Symbol("ACC") => Accusative(),
#     Symbol("AMD") => Amendment(),
#     Symbol("ANS") => Answer(),
#     Symbol("AVR") => Aversion(),
#     Symbol("CAUS") => Cause(),
#     Symbol("CERT") => Certainty(),
#     Symbol("CIRC") => Circumstantial(),
#     Symbol("COM") => Comitative(),
#     Symbol("COND") => Conditional(),
#     Symbol("EQ") => Equalization(),
#     Symbol("EXH") => Exhortation(),
#     Symbol("EXL") => Explanation(),
#     Symbol("EXP") => Exceptive(),
#     Symbol("FUT") => Future(),
#     Symbol("INC") => Inceptive(),
#     Symbol("INT") => Interpretation(),
#     Symbol("INTG") => Interogative(),
#     Symbol("NEG") => Negative(),
#     Symbol("PREV") => Preventive(),
#     Symbol("PRO") => Prohibition(),
#     Symbol("REM") => Resumption(),
#     Symbol("RES") => Restriction(),
#     Symbol("RET") => Retraction(),
#     Symbol("RSLT") => Result(),
#     Symbol("SUP") => Supplemental(),
#     Symbol("SUR") => Surprise(),
#     Symbol("VOC") => Vocative()
# )
# const DISCONNECTED = Dict(Symbol("INL") => DisconnectedLetters())
# const PERSONS = Dict(
#     Symbol("1") => FirstPerson(),
#     Symbol("2") => SecondPerson(),
#     Symbol("3") => ThirdPerson()
# )

# const PARTOFSPEECH = Dict(
#     VERB_VOICES..., VERB_ASPECTS..., VERB_MOODS..., VERB_FORMS..., NOMINAL_CASES..., 
#     NOMINAL_STATES..., NOUNS..., PRONOUNS..., DERIVED_NOMINALS..., CONJUNCTIONS..., ADVERBS...,
#     DERIVED_NOUNS..., PREPOSITIONS..., DISCONNECTED..., LAM_PREFIXES..., PARTICLES...,
#     PERSONS..., GENDERS..., NUMBERS..., SUFFIXES..., Symbol("V") => Verb()
# )

const SIMPLE_ENCODING = Dict(
    Symbol(Char(0x0621)) => Symbol("Hamza"),
    Symbol(Char(0x0622)) => Symbol("Alif+Maddah"),
    Symbol(Char(0x0623)) => Symbol("AlifHamzaAbove"),
    Symbol(Char(0x0624)) => Symbol("WawHamzaAbove"),
    Symbol(Char(0x0625)) => Symbol("AlifHamzaBelow"),
    Symbol(Char(0x0626)) => Symbol("YaHamzaAbove"),
    Symbol(Char(0x0627)) => Symbol("Alif"),
    Symbol(Char(0x0628)) => Symbol("Ba"),
    Symbol(Char(0x0629)) => Symbol("TaMarbuta"),
    Symbol(Char(0x062A)) => Symbol("Ta"),
    Symbol(Char(0x062B)) => Symbol("Tha"),
    Symbol(Char(0x062C)) => Symbol("Jeem"),
    Symbol(Char(0x062D)) => Symbol("HHa"),
    Symbol(Char(0x062E)) => Symbol("Kha"),
    Symbol(Char(0x062F)) => Symbol("Dal"),
    Symbol(Char(0x0630)) => Symbol("Thal"),
    Symbol(Char(0x0631)) => Symbol("Ra"),
    Symbol(Char(0x0632)) => Symbol("Zain"),
    Symbol(Char(0x0633)) => Symbol("Seen"),
    Symbol(Char(0x0634)) => Symbol("Sheen"),
    Symbol(Char(0x0635)) => Symbol("Sad"),
    Symbol(Char(0x0636)) => Symbol("DDad"),
    Symbol(Char(0x0637)) => Symbol("TTa"),
    Symbol(Char(0x0638)) => Symbol("DTha"),
    Symbol(Char(0x0639)) => Symbol("Ain"),
    Symbol(Char(0x063A)) => Symbol("Ghain"),
    Symbol(Char(0x0640)) => Symbol("Tatweel"),
    Symbol(Char(0x0641)) => Symbol("Fa"),
    Symbol(Char(0x0642)) => Symbol("Qaf"),
    Symbol(Char(0x0643)) => Symbol("Kaf"),
    Symbol(Char(0x0644)) => Symbol("Lam"),
    Symbol(Char(0x0645)) => Symbol("Meem"),
    Symbol(Char(0x0646)) => Symbol("Noon"),
    Symbol(Char(0x0647)) => Symbol("Ha"),
    Symbol(Char(0x0648)) => Symbol("Waw"),
    Symbol(Char(0x0649)) => Symbol("AlifMaksura"),
    Symbol(Char(0x064A)) => Symbol("Ya"),
    Symbol(Char(0x064B)) => Symbol("Fathatan"),
    Symbol(Char(0x064C)) => Symbol("Dammatan"),
    Symbol(Char(0x064D)) => Symbol("Kasratan"),
    Symbol(Char(0x064E)) => Symbol("Fatha"),
    Symbol(Char(0x064F)) => Symbol("Damma"),
    Symbol(Char(0x0650)) => Symbol("Kasra"),
    Symbol(Char(0x0651)) => Symbol("Shadda"),
    Symbol(Char(0x0652)) => Symbol("Sukun"),
    Symbol(Char(0x0653)) => Symbol("Maddah"),
    Symbol(Char(0x0654)) => Symbol("HamzaAbove"),
    Symbol(Char(0x0670)) => Symbol("AlifKhanjareeya"),
    Symbol(Char(0x0671)) => Symbol("AlifHamzatWasl"),
    Symbol(Char(0x06DC)) => Symbol("SmallHighSeen"),
    Symbol(Char(0x06DF)) => Symbol("SmallHighRoundedZero"),
    Symbol(Char(0x06E0)) => Symbol("SmallHighUprightRectangularZero"),
    Symbol(Char(0x06E2)) => Symbol("SmallHighMeemIsolatedForm"),
    Symbol(Char(0x06E3)) => Symbol("SmallLowSeen"),
    Symbol(Char(0x06E5)) => Symbol("SmallWaw"),
    Symbol(Char(0x06E6)) => Symbol("SmallYa"),
    Symbol(Char(0x06E8)) => Symbol("SmallHighNoon"),
    Symbol(Char(0x06EA)) => Symbol("EmptyCenterLowStop"),
    Symbol(Char(0x06EB)) => Symbol("EmptyCenterHighStop"),
    Symbol(Char(0x06EC)) => Symbol("RoundedHighStopWithFilledCenter"),
    Symbol(Char(0x06ED)) => Symbol("SmallLowMeem")
);
const ORTHOGRAPHY_TYPES = Dict(
    Symbol(Char(0x0621)) => Hamza,
    Symbol(Char(0x0622)) => AlifMaddah,
    Symbol(Char(0x0623)) => AlifHamzaAbove,
    Symbol(Char(0x0624)) => WawHamzaAbove,
    Symbol(Char(0x0625)) => AlifHamzaBelow,
    Symbol(Char(0x0626)) => YaHamzaAbove,
    Symbol(Char(0x0627)) => Alif,
    Symbol(Char(0x0628)) => Ba,
    Symbol(Char(0x0629)) => Ta,
    Symbol(Char(0x062A)) => Ta,
    Symbol(Char(0x062B)) => Tha,
    Symbol(Char(0x062C)) => Jeem,
    Symbol(Char(0x062D)) => HHa,
    Symbol(Char(0x062E)) => Kha,
    Symbol(Char(0x062F)) => Dal,
    Symbol(Char(0x0630)) => Thal,
    Symbol(Char(0x0631)) => Ra,
    Symbol(Char(0x0632)) => Zain,
    Symbol(Char(0x0633)) => Seen,
    Symbol(Char(0x0634)) => Sheen,
    Symbol(Char(0x0635)) => Sad,
    Symbol(Char(0x0636)) => DDad,
    Symbol(Char(0x0637)) => TTa,
    Symbol(Char(0x0638)) => DTha,
    Symbol(Char(0x0639)) => Ain,
    Symbol(Char(0x063A)) => Ghain,
    Symbol(Char(0x0640)) => Tatweel,
    Symbol(Char(0x0641)) => Fa,
    Symbol(Char(0x0642)) => Qaf,
    Symbol(Char(0x0643)) => Kaf,
    Symbol(Char(0x0644)) => Lam,
    Symbol(Char(0x0645)) => Meem,
    Symbol(Char(0x0646)) => Noon,
    Symbol(Char(0x0647)) => Ha,
    Symbol(Char(0x0648)) => Waw,
    Symbol(Char(0x0649)) => AlifMaksurah,
    Symbol(Char(0x064A)) => Ya,
    Symbol(Char(0x064B)) => Fathatan,
    Symbol(Char(0x064C)) => Dammatan,
    Symbol(Char(0x064D)) => Kasratan,
    Symbol(Char(0x064E)) => Fatha,
    Symbol(Char(0x064F)) => Damma,
    Symbol(Char(0x0650)) => Kasra,
    Symbol(Char(0x0651)) => Shadda,
    Symbol(Char(0x0652)) => Sukun,
    Symbol(Char(0x0653)) => Maddah,
    Symbol(Char(0x0654)) => HamzaAbove,
    Symbol(Char(0x0670)) => AlifKhanjareeya,
    Symbol(Char(0x0671)) => AlifHamzatWasl,
    Symbol(Char(0x06DC)) => SmallHighSeen,
    Symbol(Char(0x06DF)) => SmallHighRoundedZero,
    Symbol(Char(0x06E0)) => SmallHighUprightRectangularZero,
    Symbol(Char(0x06E2)) => SmallHighMeemIsolatedForm,
    Symbol(Char(0x06E3)) => SmallLowSeen,
    Symbol(Char(0x06E5)) => SmallWaw,
    Symbol(Char(0x06E6)) => SmallYa,
    Symbol(Char(0x06E8)) => SmallHighNoon,
    Symbol(Char(0x06EA)) => EmptyCenterLowStop,
    Symbol(Char(0x06EB)) => EmptyCenterHighStop,
    Symbol(Char(0x06EC)) => RoundedHighStopWithFilledCenter,
    Symbol(Char(0x06ED)) => SmallLowMeem
);
const BW_ENCODING = Dict(
    Symbol(Char(0x0621)) => Symbol('\''),
    Symbol(Char(0x0622)) => Symbol('('),
    Symbol(Char(0x0623)) => Symbol('>'),
    Symbol(Char(0x0624)) => Symbol('&'),
    Symbol(Char(0x0625)) => Symbol('<'),
    Symbol(Char(0x0626)) => Symbol('}'),
    Symbol(Char(0x0627)) => Symbol('A'),
    Symbol(Char(0x0628)) => Symbol('b'),
    Symbol(Char(0x0629)) => Symbol('p'),
    Symbol(Char(0x062A)) => Symbol('t'),
    Symbol(Char(0x062B)) => Symbol('v'),
    Symbol(Char(0x062C)) => Symbol('j'),
    Symbol(Char(0x062D)) => Symbol('H'),
    Symbol(Char(0x062E)) => Symbol('x'),
    Symbol(Char(0x062F)) => Symbol('d'),
    Symbol(Char(0x0630)) => Symbol('*'),
    Symbol(Char(0x0631)) => Symbol('r'),
    Symbol(Char(0x0632)) => Symbol('z'),
    Symbol(Char(0x0633)) => Symbol('s'),
    Symbol(Char(0x0634)) => Symbol('$'),
    Symbol(Char(0x0635)) => Symbol('S'),
    Symbol(Char(0x0636)) => Symbol('D'),
    Symbol(Char(0x0637)) => Symbol('T'),
    Symbol(Char(0x0638)) => Symbol('Z'),
    Symbol(Char(0x0639)) => Symbol('E'),
    Symbol(Char(0x063A)) => Symbol('g'),
    Symbol(Char(0x0640)) => Symbol('_'),
    Symbol(Char(0x0641)) => Symbol('f'),
    Symbol(Char(0x0642)) => Symbol('q'),
    Symbol(Char(0x0643)) => Symbol('k'),
    Symbol(Char(0x0644)) => Symbol('l'),
    Symbol(Char(0x0645)) => Symbol('m'),
    Symbol(Char(0x0646)) => Symbol('n'),
    Symbol(Char(0x0647)) => Symbol('h'),
    Symbol(Char(0x0648)) => Symbol('w'),
    Symbol(Char(0x0649)) => Symbol('Y'),
    Symbol(Char(0x064A)) => Symbol('y'),
    Symbol(Char(0x064B)) => Symbol('F'),
    Symbol(Char(0x064C)) => Symbol('N'),
    Symbol(Char(0x064D)) => Symbol('K'),
    Symbol(Char(0x064E)) => Symbol('a'),
    Symbol(Char(0x064F)) => Symbol('u'),
    Symbol(Char(0x0650)) => Symbol('i'),
    Symbol(Char(0x0651)) => Symbol('~'),
    Symbol(Char(0x0652)) => Symbol('o'),
    Symbol(Char(0x0653)) => Symbol('^'),
    Symbol(Char(0x0654)) => Symbol('#'),
    Symbol(Char(0x0670)) => Symbol('`'),
    Symbol(Char(0x0671)) => Symbol('{'),
    Symbol(Char(0x06DC)) => Symbol(':'),
    Symbol(Char(0x06DF)) => Symbol('@'),
    Symbol(Char(0x06E0)) => Symbol('\"'),
    Symbol(Char(0x06E2)) => Symbol('['),
    Symbol(Char(0x06E3)) => Symbol(';'),
    Symbol(Char(0x06E5)) => Symbol(','),
    Symbol(Char(0x06E6)) => Symbol('.'),
    Symbol(Char(0x06E8)) => Symbol('!'),
    Symbol(Char(0x06EA)) => Symbol('-'),
    Symbol(Char(0x06EB)) => Symbol('+'),
    Symbol(Char(0x06EC)) => Symbol('%'),
    Symbol(Char(0x06ED)) => Symbol(']')
);

const AR_DIACS_REGEX = Regex(
    string(
        Char(0x064B)[1], "|", 
        Char(0x064C)[1], "|", 
        Char(0x064D)[1], "|", 
        Char(0x064E)[1], "|", 
        Char(0x064F)[1], "|", 
        Char(0x0640)[1], "|", # move this to special diac
        Char(0x0650)[1], "|", 
        Char(0x0651)[1], "|", 
        Char(0x0652)[1], "|", 
        Char(0x0653)[1], "|",
        Char(0x0670)[1], "|",
        Char(0x0654)[1]
    )
);
const PUNCTUATIONS_REGEX = r"[\.,-\/#!$%\^&\*;:{}=\-_`~()@\+\?><\[\]\+\؟\،\؛]"
const AR_DIACS = Symbol.(split(AR_DIACS_REGEX.pattern, "|"));
const SP_DEDIAC_MAPPING = Dict(
    Symbol(Char(0x0622)) => Symbol(Char(0x0627)),
    Symbol(Char(0x0623)) => Symbol(Char(0x0627)),
    Symbol(Char(0x0670)) => Symbol(Char(0x0627)),
    Symbol(Char(0x0671)) => Symbol(Char(0x0627)),
    Symbol(Char(0x0625)) => Symbol(Char(0x0627)),
    Symbol(Char(0x0624)) => Symbol(Char(0x0648)),
    Symbol(Char(0x0626)) => Symbol(Char(0x064A)),
    Symbol(Char(0x0649)) => Symbol(Char(0x064A)),
    Symbol(Char(0x0629)) => Symbol(Char(0x0647)),
    Symbol(Char(0xFDFA)) => Symbol("صلى الله عليه وسلم"),
    Symbol(Char(0xFDFB)) => Symbol("جل جلاله"),
    Symbol(Char(0xFDFD)) => Symbol("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")
);
const SP_DEDIAC_KEYS = collect(keys(SP_DEDIAC_MAPPING));
const SP_REGEX_CHARS = ['\\', '^', '$', '.', '|', '?', '*', '+', ')', '(', ']', '[', '}', '{'];