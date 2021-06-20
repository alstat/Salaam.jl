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
    Symbol(Char(0x06ED)) => Symbol(']'),
    Symbol(Char(0xFDFA)) => Symbol("SlY Allh Elyh wslm"),
    Symbol(Char(0xFDFB)) => Symbol("jl jlAlh"),
    Symbol(Char(0xFDFD)) => Symbol("bisomi {ll~ahi {lr~aHoma`ni {lr~aHiymi")
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