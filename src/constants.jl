const DERIVED_NOUNS = Dict(
    Symbol("ACT PCPL") => ActiveParticle(),
    Symbol("PASS PCPL") => PassiveParticle(),
    Symbol("VN") => VerbalNoun()
)
const VERB_ASPECTS = Dict(
    Symbol("PERF") => Perfect(),
    Symbol("IMPF") => Imperfect(),
    Symbol("IMPV") => Imperative()
)
const CAMEL_VERB_ASPECTS = Dict(
    Symbol("asp_p") => Perfect(Symbol("p"), "Perfect verb", "فعل ماض"),
    Symbol("asp_i") => Imperfect(Symbol("i"), "Imperfect verb", "فعل مضارع"),
    Symbol("asp_c") => Imperative(Symbol("c", "Imperative or command verb", "فعل أمر"))
)
const VERB_MOODS = Dict(
    Symbol("IND") => Indicative(),
    Symbol("SUBJ") => Subjunctive(),
    Symbol("JUS") => Jussive()
)
const CAMEL_VERB_MOODS = Dict(
    Symbol("mod_i") => Indicative(Symbol("i"), "Indicative mood (default)", "مرفوع"),
    Symbol("mod_s") => Subjunctive(Symbol("s"), "Subjunctive mood", "منصوب"),
    Symbol("mod_j") => Jussive(Symbol("j"), "Jussive mood", "مجزوم"),
    Symbol("mod_u") => Undefined()
)
const VERB_VOICES = Dict(
    Symbol("ACT") => Active(),
    Symbol("PASS") => Passive()
)
const CAMEL_VERB_VOICES = Dict(
    Symbol("vox_a") => Active(Symbol("a"), "Active voice (default)", "مبني للمعلوم"),
    Symbol("vox_p") => Passive(Symbol("p"), "Passive voice", "مبني للمجهول")
    Symbol("vox_u") => Undefined()
)
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
const NOMINAL_CASES = Dict(
    Symbol("NOM") => Nominative(),
    Symbol("ACCC") => Accusative(Symbol("ACC"), "Accusative case", "منصوب"),
    Symbol("GEN") => Genetive()
)
const CAMEL_NOMINAL_CASES = Dict(
    Symbol("cas_n") => Nominative(Symbol("n"), "Nominative case", "مرفوع"),
    Symbol("cas_a") => Accusative(Symbol("a"), "Accusative case", "منصوب"),
    Symbol("cas_g") => Genetive(Symbol("g"), "Genetive case", "مجرور")
    Symbol("cas_u") => Undefined()
)
const NOMINAL_STATES = Dict(
    Symbol("DEF") => Definite(),
    Symbol("INDEF") => Indefinite()
)
const CAMEL_NOMINAL_STATES = Dict(
    Symbol("stt_d") => Definite(Symbol("d"), "Definite state", "معرفة"),
    Symbol("stt_i") => Indefinite(Symbol("i"), "Indefinite state", "نكرة"),
    Symbol("stt_c") => Construct(Symbol("c"), "Construct/Poss/Idafa", ""),
    Symbol("stt_u") => Undefined()
)
const NOUNS = Dict(
    Symbol("N") => Noun(),
    Symbol("PN") => ProperNoun()
)
const CAMEL_NOUNS = Dict(
    Symbol("pos_n") => Noun(Symbol("n"), "Noun", "اسم"),
    Symbol("pos_noun_prop") => ProperNoun(Symbol("noun_prop"), "Proper noun", "اسم علم"),
    Symbol("pos_noun_num") => Numeral(Symbol("noun_num"), "Number noun", ""),
    Symbol("pos_noun_quant") => Quantity(Symbol("noun_quant"), "Quantity noun", "")
)
const DERIVED_NOMINALS = Dict(
    Symbol("ADJ") => Adjective(),
    Symbol("IMPN") => ImperativeVerbalNoun()
)
const CAMEL_DERIVED_NOMINALS = Dict(
    Symbol("pos_adj") => Adjective(Symbol("adj"), "Adjective", "صفة"),
    Symbol("pos_adj_comp") => Comparative(Symbol("adj_comp"), "Comparative adjective", ""),
    Symbol("pos_adj_num") => Numerical(Symbol("adj_num"), "Numerical adjective", ""),
)
const PRONOUNS = Dict(
    Symbol("PRON") => Personal(),
    Symbol("DEM") => Demonstrative(),
    Symbol("REL") => Relative()
)
const CAMEL_PRONOUNS = Dict(
    Symbol("pos_pron") => Personal(Symbol("pron"), "Personal pronoun", "ضمير"),
    Symbol("pos_pron_dem") => Demonstrative(Symbol("pron_dem"), "Demonstrative pronoun", "اسم اشارة"),
    Symbol("pos_pron_rel") => Relative(Symbol("pron_rel"), "Relative pronoun", "اسم موصول"),
    Symbol("pos_pron_interrog") => Interrogative(Symbol("pron_interrog"), "Interrogative pronoun", ""),
    Symbol("pos_pron_exclam") => Exclamation(Symbol("pron_exclam"), "Exclamation pronoun", "")
)
const ADVERBS = Dict(
    Symbol("T") => Time(),
    Symbol("LOC") => Location()
)
const CAMEL_ADVERBS = Dict(
    Symbol("pos_adv") => AbstractAdverb,
    Symbol("pos_adv_interrog") => InterrogativeAdv(Symbol("adv_interrog"), "Interrogative adverb", ""),
    Symbol("pos_adv_rel") => RelativeAdv(Symbol("adv_rel"), "Relative adverb", ""),
)
const PREPOSITIONS = Dict(
    Symbol("P") => Preposition(),
    Symbol("Al+") => Preposition(Symbol("P"), "Determiner prefix ('the')", "حرف جر"),
    Symbol("bi+") => Preposition(Symbol("P"), "Preposition prefix ('by', 'with', 'in')", "حرف جر"),
    Symbol("ka+") => Preposition(Symbol("P"), "Preposition prefix ('like' or 'thus')", "حرف جر"),
    Symbol("ta+") => Preposition(Symbol("P"), "particle of oath prefix used as a preposition ('by Allah')", "حرف جر"),
    Symbol("w:P+") => Preposition(Symbol("P"), "Particle of oath prefix used as a preposition ('by the pen')", "حرف جر"),
    Symbol("l:P+") => Preposition(Symbol("P"), "Lam as a prefixed preposition", "حرف جر")
)
const CAMEL_PREPOSITIONS = Dict(
    Symbol("prc1") => Preposition(Symbol("prc1"), "Preposition", "حرف جر"),
    Symbol("Al+") => Preposition(Symbol("P"), "Determiner prefix ('the')", "حرف جر"),
    Symbol("bi+") => Preposition(Symbol("P"), "Preposition prefix ('by', 'with', 'in')", "حرف جر"),
    Symbol("ka+") => Preposition(Symbol("P"), "Preposition prefix ('like' or 'thus')", "حرف جر"),
    Symbol("ta+") => Preposition(Symbol("P"), "particle of oath prefix used as a preposition ('by Allah')", "حرف جر"),
    Symbol("w:P+") => Preposition(Symbol("P"), "Particle of oath prefix used as a preposition ('by the pen')", "حرف جر"),
    Symbol("l:P+") => Preposition(Symbol("P"), "Lam as a prefixed preposition", "حرف جر")
)
const LAM_PREFIXES = Dict(
    Symbol("l:EMPH+") => EmphaticLam(),
    Symbol("l:IMPV+") => ImperativeLam(),
    Symbol("l:PRP+") => PurposeLam()
)
const CONJUNCTIONS = Dict(
    Symbol("CONJ") => Coordinating(),
    Symbol("SUB") => Subordinating(),
    Symbol("w:CONJ+") => Coordinating(Symbol("CONJ"), "Waw as a conjunctin prefix ('and')", "حرف عطف"),
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
    Symbol(Char(0x0623)) => Symbol("HamzaAbove"),
    Symbol(Char(0x0624)) => Symbol("HamzaAbove"),
    Symbol(Char(0x0625)) => Symbol("HamzaBelow"),
    Symbol(Char(0x0626)) => Symbol("HamzaAbove"),
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
    Symbol(Char(0x0671)) => Symbol("HamzatWasl"),
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
    # Symbol(Char(0xFDFA)) => Symbol('θ'),
    # Symbol(Char(0xFDFB)) => Symbol('ϕ'),
    # Symbol(Char(0xFDFD)) => Symbol('Ω')
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