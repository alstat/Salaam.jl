const DERIVED_NOUNS = Dict(
    Symbol("ACT PCPL") => ActiveParticle(),
    Symbol("PASS PCPL") => PassiveParticle(),
    :VN => VerbalNoun()
)
const VERB_ASPECTS = Dict(
    :PERF => Perfect(),
    :IMPF => Imperfect(),
    :IMPV => Imperative()
)
# const CAMEL_VERB_ASPECTS = Dict(
#     Symbol("asp_p") => Perfect(Symbol("p"), "Perfect verb", "فعل ماض"),
#     Symbol("asp_i") => Imperfect(Symbol("i"), "Imperfect verb", "فعل مضارع"),
#     Symbol("asp_c") => Imperative(Symbol("c", "Imperative or command verb", "فعل أمر"))
# )

# -----------------------------------------
# Verb Moods
# -----------------------------------------
const VERB_MOODS = Dict(
    :IND => Indicative(),
    :SUBJ => Subjunctive(),
    :JUS => Jussive()
)
const CAMEL_VERB_MOODS = Dict(
    :mod_i => Indicative(Symbol("i"), "Indicative mood (default)", "مرفوع"),
    :mod_s => Subjunctive(Symbol("s"), "Subjunctive mood", "منصوب"),
    :mod_j => Jussive(Symbol("j"), "Jussive mood", "مجزوم"),
    :mod_u => Undefined()
)
const CAMEL_VERB_MOODS_2 = Dict(
    :Indicative => "mod_i", 
    :Subjunctive => "mod_s",
    :Jussive => "mod_j",
    :Undefined => "mod_u"
)

# -----------------------------------------
# Verb Voices
# -----------------------------------------
const VERB_VOICES = Dict(
    :ACT => Active(),
    :PASS => Passive()
)
const CAMEL_VERB_VOICES = Dict(
    :vox_a => Active(Symbol("a"), "Active voice (default)", "مبني للمعلوم"),
    :vox_p => Passive(Symbol("p"), "Passive voice", "مبني للمجهول"),
    :vox_u => Undefined()
)
const CAMEL_VERB_VOICES_2 = Dict(
    :Active => "vox_a",
    :Passive => "vox_p",
    :Undefined => "vox_u"
)

# -----------------------------------------
# Verb Forms
# -----------------------------------------
const VERB_FORMS = Dict(
    Symbol("(I)") => VerbFormI(),
    Symbol("(II)") => VerbFormII(),
    Symbol("(III)") => VerbFormIII(),
    Symbol("(IV)") => VerbFormIV(),
    Symbol("(V)") => VerbFormV(),
    Symbol("(VI)") => VerbFormVI(),
    Symbol("(VII)") => VerbFormVII(),
    Symbol("(VIII)") => VerbFormVIII(),    
    Symbol("(IX)") => VerbFormIX(),
    Symbol("(X)") => VerbFormX(),    
    Symbol("(XI)") => VerbFormXI(),
    Symbol("(XII)") => VerbFormXII()
)

# -----------------------------------------
# Nominal Cases
# -----------------------------------------
const NOMINAL_CASES = Dict(
    :NOM => Nominative(),
    :ACCC => Accusative(Symbol("ACC"), "Accusative case", "منصوب"),
    :GEN => Genetive()
)
const CAMEL_NOMINAL_CASES = Dict(
    :cas_n => Nominative(Symbol("n"), "Nominative case", "مرفوع"),
    :cas_a => Accusative(Symbol("a"), "Accusative case", "منصوب"),
    :cas_g => Genetive(Symbol("g"), "Genetive case", "مجرور"),
    :cas_u => Undefined()
)
const CAMEL_NOMINAL_CASES_2 = Dict(
    :Nominative => "cas_n",
    :Accusative => "cas_a",
    :Genetive => "cas_g",
    :Undefined => "cas_u"
)

# -----------------------------------------
# Nominal States
# -----------------------------------------
const NOMINAL_STATES = Dict(
    :DEF => Definite(),
    :INDEF => Indefinite()
)
const CAMEL_NOMINAL_STATES = Dict(
    :stt_d => Definite(Symbol("d"), "Definite state", "معرفة"),
    :stt_i => Indefinite(Symbol("i"), "Indefinite state", "نكرة"),
    :stt_c => Construct(Symbol("c"), "Construct/Poss/Idafa", ""),
    :stt_u => Undefined()
)
const CAMEL_NOMINAL_STATES_2 = Dict(
    :Definite => "stt_d",
    :Indefinite => "stt_i",
    :Construct => "stt_c",
    :Undefined => "stt_u"
)

# -----------------------------------------
# Nouns
# -----------------------------------------
const NOUNS = Dict(
    :N => Noun(),
    :PN => ProperNoun()
)
const CAMEL_NOUNS = Dict(
    :pos_n => Noun(Symbol("n"), "Noun", "اسم"),
    :pos_noun_prop => ProperNoun(Symbol("noun_prop"), "Proper noun", "اسم علم"),
    :pos_noun_num => Numeral(Symbol("noun_num"), "Number noun", ""),
    :pos_noun_quant => Quantity(Symbol("noun_quant"), "Quantity noun", "")
)
const CAMEL_NOUNS_2 = Dict(
    :Noun => "pos_n",
    :ProperNoun => "pos_noun_prop",
    :Numeral => "pos_noun_num",
    :Quantity => "pos_noun_quant"
)

# -----------------------------------------
# Derived Nominals
# -----------------------------------------
const DERIVED_NOMINALS = Dict(
    :ADJ => Adjective(),
    :IMPN => ImperativeVerbalNoun()
)
const CAMEL_DERIVED_NOMINALS = Dict(
    :pos_adj => Adjective(Symbol("adj"), "Adjective", "صفة"),
    :pos_adj_comp => Comparative(Symbol("adj_comp"), "Comparative adjective", ""),
    :pos_adj_num => Numerical(Symbol("adj_num"), "Numerical adjective", ""),
)
const CAMEL_DERIVED_NOMINALS_2 = Dict(
    :Adjective => "pos_adj",
    :Comparative => "pos_adj_comp",
    :Numerical => "pos_adj_num"
)

# -----------------------------------------
# Pronouns
# -----------------------------------------
const PRONOUNS = Dict(
    :PRON => Personal(),
    :DEM => Demonstrative(),
    :REL => Relative()
)
const CAMEL_PRONOUNS = Dict(
    :pos_pron => Personal(Symbol("pron"), "Personal pronoun", "ضمير"),
    :pos_pron_dem => Demonstrative(Symbol("pron_dem"), "Demonstrative pronoun", "اسم اشارة"),
    :pos_pron_rel => Relative(Symbol("pron_rel"), "Relative pronoun", "اسم موصول"),
    :pos_pron_interrog => Interrogative(Symbol("pron_interrog"), "Interrogative pronoun", ""),
    :pos_pron_exclam => Exclamation(Symbol("pron_exclam"), "Exclamation pronoun", "")
)
const CAMEL_PRONOUNS_2 = Dict(
    :Personal => "pos_pron",
    :Demonstrative => "pos_pron_dem",
    :Relative => "pos_pron_rel",
    :Interrogative => "pos_pron_interrog",
    :Exclamation => "pos_pron_exclam"
)

# -----------------------------------------
# Adverbs
# -----------------------------------------
const ADVERBS = Dict(
    :T => Time(),
    :LOC => Location()
)
const CAMEL_ADVERBS = Dict(
    :pos_adv => AbstractAdverb,
    :pos_adv_interrog => InterrogativeAdv(Symbol("adv_interrog"), "Interrogative adverb", ""),
    :pos_adv_rel => RelativeAdv(Symbol("adv_rel"), "Relative adverb", ""),
)
const CAMEL_ADVERBS_2 = Dict(
    :AbstractAdverb => "pos_adv",
    :InterrogativeAdv => "pos_adv_interrog",
    :RelativeAdv => "pos_adv_rel"
)

# -----------------------------------------
# Prepositions
# -----------------------------------------
const PREPOSITIONS = Dict(
    :P => Preposition(),
    Symbol("Al+") => ALDeterminer(Symbol("P"), "Determiner prefix ('the')", "حرف جر"),
    Symbol("bi+") => BiPrep(Symbol("P"), "Preposition prefix ('by', 'with', 'in')", "حرف جر"),
    Symbol("ka+") => KaPrep(Symbol("P"), "Preposition prefix ('like' or 'thus')", "حرف جر"),
    Symbol("ta+") => TaPrep(Symbol("P"), "particle of oath prefix used as a preposition ('by Allah')", "حرف جر"),
    Symbol("w:P+") => WaPrep(Symbol("P"), "Particle of oath prefix used as a preposition ('by the pen')", "حرف جر"),
    Symbol("l:P+") => LaPrep(Symbol("P"), "Lam as a prefixed preposition", "حرف جر")
)
const CAMEL_PREPOSITIONS = Dict(
    :Al_det => ALDeterminer(Symbol("P"), "Determiner prefix ('the')", "حرف جر"),
    :bi_prep => BiPrep(Symbol("P"), "Preposition prefix ('by', 'with', 'in')", "حرف جر"),
    :Ea_prep => EaPrep(Symbol("P"), "Preposition prefix Ea", "حرف جر")
    :EalaY_prep => EalaYPrep(Symbol("P"), "Preposition prefix EalaY", "حرف جر")
    :fiy_prep => FiyPrep(Symbol("P"), "Preposition prefix EalaY", "حرف جر")
    :ka_prep => KaPrep(Symbol("P"), "Preposition prefix ('like' or 'thus')", "حرف جر"),
    :ta_prep => TaPrep(Symbol("P"), "particle of oath prefix used as a preposition ('by Allah')", "حرف جر"),
    :wa_prep => WaPrep(Symbol("P"), "Particle of oath prefix used as a preposition ('by the pen')", "حرف جر"),
    :la_prep => LaPrep(Symbol("P"), "Lam as a prefixed preposition", "حرف جر"),
    :libi_prep => LibiPrep(Symbol("P"), "Lam as a prefixed preposition", "حرف جر"),
    :li_prep => LiPrep(Symbol("P"), "Lam as a prefixed preposition", "حرف جر"),
    :min_prep => MinPrep(Symbol("P"), "Lam as a prefixed preposition", "حرف جر")
)
const CAMEL_PREPOSITIONS_2 = Dict(
    :ALDeterminer => "Al_det",
    :BiPrep => "bi_prep",
    :EaPrep => "ea_prep",
    :EalaYPrep => "EalaY_prep",
    :FiyPrep => "fiy_prep",
    :KaPrep => "ka_prep",
    :TaPrep => "ta_prep",
    :WaPrep => "wa_prep",
    :LaPrep => "la_prep",
    :LibiPrep => "libi_prep",
    :LiPrep => "li_prep",
    :MinPrep => "min_prep"
)

# -----------------------------------------
# Lam Prefixes
# -----------------------------------------
const LAM_PREFIXES = Dict(
    Symbol("l:EMPH+") => EmphaticLam(),
    Symbol("l:IMPV+") => ImperativeLam(),
    Symbol("l:PRP+") => PurposeLam()
)
const CAMEL_LAM_PREFIXES = Dict(
    :la_emph => EmphaticLam(),
)
const CAMEL_LAM_PREFIXES_2 = Dict(
    :EmphaticLam => "la_emph",
)

# -----------------------------------------
# Conjunctions
# -----------------------------------------
const CONJUNCTIONS = Dict(
    :CONJ => Coordinating(),
    :SUB => Subordinating(),
    Symbol("w:CONJ+") => WaConj(Symbol("CONJ"), "Waw as a conjunctin prefix ('and')", "حرف عطف"),
    Symbol("f:CONJ+") => FaConj(Symbol("CONJ"), "Fa as a conjunction prefix ('and')", "حرف عطف")
)
const CAMEL_CONJUNCTIONS = Dict(
    :fa_conj => FaConj(Symbol("CONJ"), "Fa as a conjunction prefix ('and')", "حرف عطف")
    :fa_conn => FaConn(),
    :fa_rc => Coordinating(Symbol("CONJ"), "Waw as a conjunctin prefix ('and')", "حرف عطف"),
    Symbol("f:CONJ+") => Coordinating(Symbol("CONJ"), "Fa as a conjunction prefix ('and')", "حرف عطف")
)

const SUFFIXES = Dict(
    Symbol("+VOC") => Vocative(Symbol("VOC"), "Vocative suffix", "حرف نداء"),
    Symbol("+n:EMPH") => EmphaticNun(Symbol("+n:EMPH"), "Emphatic nun", "لام التوكيد")
)
const PARTICLES = Dict(
    Symbol("sa+") => Future(Symbol("FUT"), "Prefixed particle indicating the future ('they will')", "حرف استقبال"),
    Symbol("ya+") => Vocative(Symbol("VOC"), "A vocative prefix usually translated as 'O'", "حرف نداء"),
    Symbol("ha+") => Vocative(Symbol("VOC"), "A vocative prefix usually translated as 'Lo!'", "حرف نداء"),
    Symbol("A:INTG+") => Interogative(Symbol("INTG"), "Alif as a prefixed interrogative particle ('is?', 'did?', 'do?')", "حرف استفهام"),
    Symbol("A:EQ+") => Equalization(Symbol("EQ"), "Alif as a prefixed equalization particle ('whether')", "حرف تسوية"),
    Symbol("w:REM+") => Resumption(Symbol("REM"), "Waw as a resumption prefix ('then' or 'so')", "حرف استئنافية"),
    Symbol("w:CIRC+") => Circumstantial(Symbol("CIRC"), "Waw as a circumstantial prefix ('while')", "حرف حال"),
    Symbol("w:SUP+") => Supplemental(Symbol("SUP"), "Waw as a supplemental perfix ('then' pr 'so')", "حرف زائد"),
    Symbol("w:COM+") => Comitative(Symbol("COM"), "Waw as a comitative perfix ('with')", "واو المعية"),
    Symbol("f:REM+") => Resumption(Symbol("REM"), "Fa as a resumption prefix ('then' or 'so')", "حرف استئنافية"),
    Symbol("f:RSLT+") => Result(Symbol("RSLT"), "Fa as a result prefix ('then')", "حرف واقع في جواب الشرط"),
    Symbol("f:SUP+") => Supplemental(Symbol("SUP"), "Fa as a supplemental prefix ('then' or 'so')", "حرف زائد"),
    Symbol("f:CAUS+") => Cause(Symbol("CAUS"), "Fa as a cause prefix ('then' or 'so')", "حرف سببية"),
    Symbol("ACC") => Accusative(),
    Symbol("AMD") => Amendment(),
    Symbol("ANS") => Answer(),
    Symbol("AVR") => Aversion(),
    Symbol("CAUS") => Cause(),
    Symbol("CERT") => Certainty(),
    Symbol("CIRC") => Circumstantial(),
    Symbol("COM") => Comitative(),
    Symbol("COND") => Conditional(),
    Symbol("EQ") => Equalization(),
    Symbol("EXH") => Exhortation(),
    Symbol("EXL") => Explanation(),
    Symbol("EXP") => Exceptive(),
    Symbol("FUT") => Future(),
    Symbol("INC") => Inceptive(),
    Symbol("INT") => Interpretation(),
    Symbol("INTG") => Interogative(),
    Symbol("NEG") => Negative(),
    Symbol("PREV") => Preventive(),
    Symbol("PRO") => Prohibition(),
    Symbol("REM") => Resumption(),
    Symbol("RES") => Restriction(),
    Symbol("RET") => Retraction(),
    Symbol("RSLT") => Result(),
    Symbol("SUP") => Supplemental(),
    Symbol("SUR") => Surprise(),
    Symbol("VOC") => Vocative()
)
const DISCONNECTED = Dict(Symbol("INL") => DisconnectedLetters())
const PERSONS = Dict(
    Symbol("1") => FirstPerson(),
    Symbol("2") => SecondPerson(),
    Symbol("3") => ThirdPerson()
)
const GENDERS = Dict(
    Symbol("M") => Masculine(),
    Symbol("F") => Feminine()
)
const NUMBERS = Dict(
    Symbol("S") => Singular(),
    Symbol("D") => Dual(),
    Symbol("PL") => Plural()
)
const PARTOFSPEECH = Dict(
    VERB_VOICES..., VERB_ASPECTS..., VERB_MOODS..., VERB_FORMS..., NOMINAL_CASES..., 
    NOMINAL_STATES..., NOUNS..., PRONOUNS..., DERIVED_NOMINALS..., CONJUNCTIONS..., ADVERBS...,
    DERIVED_NOUNS..., PREPOSITIONS..., DISCONNECTED..., LAM_PREFIXES..., PARTICLES...,
    PERSONS..., GENDERS..., NUMBERS..., SUFFIXES..., Symbol("V") => Verb()
)

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