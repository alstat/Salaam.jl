using Salaam
using Test

@info "type testing"
@info VERB_ASPECTS[:PERF]
@info typeof((VERB_ASPECTS[:PERF],VERB_ASPECTS[:IMPF]))

function isfeat(x, y)
    out = findfirst(z -> z isa y, x)
    out isa Nothing ? false : true
end
mfeat = [VERB_ASPECTS[:PERF],VERB_ASPECTS[:IMPF]]
@info isfeat(mfeat, Aspect{Perfect}) && isfeat(mfeat, Aspect{Imperative})

@info findfirst(x -> x isa Aspect{Perfect}, [VERB_ASPECTS[:PERF],VERB_ASPECTS[:IMPF]])

@info "encoding"
ar_basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ"
@test encode(ar_basmala) === "bisomi {ll~ahi {lr~aHoma`ni {lr~aHiymi"

@info "dediac and arabic"
bw_basmala = "bisomi {ll~ahi {lr~aHoma`ni {lr~aHiymi"
@test dediac(bw_basmala) === "bsm {llh {lrHmn {lrHym"
@test arabic(dediac(bw_basmala)) === "بسم ٱلله ٱلرحمن ٱلرحيم"
@test dediac(arabic(bw_basmala)) === arabic(dediac(bw_basmala))

@info "normalizing"
ar_basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ"
@test normalize(ar_basmala, :alif_khanjareeya) === "بِسْمِ ٱللَّهِ ٱلرَّحْمَانِ ٱلرَّحِيمِ"
@test normalize(ar_basmala, :hamzat_wasl) === "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ"

sentence1 = "وَٱلَّذِينَ يُؤْمِنُونَ بِمَآ أُنزِلَ إِلَيْكَ وَمَآ أُنزِلَ مِن قَبْلِكَ وَبِٱلْءَاخِرَةِ هُمْ يُوقِنُونَ"
@test normalize(sentence1, :alif_maddah) === "وَٱلَّذِينَ يُؤْمِنُونَ بِمَا أُنزِلَ إِلَيْكَ وَمَا أُنزِلَ مِن قَبْلِكَ وَبِٱلْءَاخِرَةِ هُمْ يُوقِنُونَ"
@test normalize(sentence1, :alif_hamza_above) === "وَٱلَّذِينَ يُؤْمِنُونَ بِمَآ اُنزِلَ إِلَيْكَ وَمَآ اُنزِلَ مِن قَبْلِكَ وَبِٱلْءَاخِرَةِ هُمْ يُوقِنُونَ"

sentence2 = "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ"
@test normalize(sentence2, :alif_hamza_below) === "اِيَّاكَ نَعْبُدُ وَاِيَّاكَ نَسْتَعِينُ"

sentence3 = "ٱلَّذِينَ يُؤْمِنُونَ بِٱلْغَيْبِ وَيُقِيمُونَ ٱلصَّلَوٰةَ وَمِمَّا رَزَقْنَٰهُمْ يُنفِقُونَ"
@test normalize(sentence3, :waw_hamza_above) === "ٱلَّذِينَ يُوْمِنُونَ بِٱلْغَيْبِ وَيُقِيمُونَ ٱلصَّلَوٰةَ وَمِمَّا رَزَقْنَٰهُمْ يُنفِقُونَ"
@test normalize(sentence3, :ta_marbuta) === "ٱلَّذِينَ يُؤْمِنُونَ بِٱلْغَيْبِ وَيُقِيمُونَ ٱلصَّلَوٰهَ وَمِمَّا رَزَقْنَٰهُمْ يُنفِقُونَ"

sentence4 = "ٱللَّهُ يَسْتَهْزِئُ بِهِمْ وَيَمُدُّهُمْ فِى طُغْيَٰنِهِمْ يَعْمَهُونَ"
@test normalize(sentence4, :ya_hamza_above) === "ٱللَّهُ يَسْتَهْزِيُ بِهِمْ وَيَمُدُّهُمْ فِى طُغْيَٰنِهِمْ يَعْمَهُونَ"

sentence5 = "ذَٰلِكَ ٱلْكِتَٰبُ لَا رَيْبَ فِيهِ هُدًى لِّلْمُتَّقِينَ"
@test normalize(sentence5, :alif_maksura) === "ذَٰلِكَ ٱلْكِتَٰبُ لَا رَيْبَ فِيهِ هُدًي لِّلْمُتَّقِينَ"

@test normalize(ar_basmala, [:alif_khanjareeya, :hamzat_wasl]) === "بِسْمِ اللَّهِ الرَّحْمَانِ الرَّحِيمِ"

sentence6 = "ﷺ"
@test normalize(sentence6) === "صلى الله عليه وسلم"

sentence7 = "ﷻ"
@test normalize(sentence7) === "جل جلاله"

sentence8 = "﷽"
@test normalize(sentence8) === ar_basmala

sentence0 = ["بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
           "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ"
       ]
@test normalize("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ") === "بِسْمِ اللَّهِ الرَّحْمَانِ الرَّحِيمِ"
# normalize("إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ")
# normalize.(sentence0)

sentence9 = "يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوٓا۟ إِذَا تَدَايَنتُم بِدَيْنٍ إِلَىٰٓ أَجَلٍ مُّسَمًّى فَٱكْتُبُوهُ وَلْيَكْتُب بَّيْنَكُمْ كَاتِبٌۢ بِٱلْعَدْلِ وَلَا يَأْبَ كَاتِبٌ أَن يَكْتُبَ كَمَا عَلَّمَهُ ٱللَّهُ فَلْيَكْتُبْ وَلْيُمْلِلِ ٱلَّذِى عَلَيْهِ ٱلْحَقُّ وَلْيَتَّقِ ٱللَّهَ رَبَّهُۥ وَلَا يَبْخَسْ مِنْهُ شَيْـًٔا فَإِن كَانَ ٱلَّذِى عَلَيْهِ ٱلْحَقُّ سَفِيهًا أَوْ ضَعِيفًا أَوْ لَا يَسْتَطِيعُ أَن يُمِلَّ هُوَ فَلْيُمْلِلْ وَلِيُّهُۥ بِٱلْعَدْلِ وَٱسْتَشْهِدُوا۟ شَهِيدَيْنِ مِن رِّجَالِكُمْ فَإِن لَّمْ يَكُونَا رَجُلَيْنِ فَرَجُلٌ وَٱمْرَأَتَانِ مِمَّن تَرْضَوْنَ مِنَ ٱلشُّهَدَآءِ أَن تَضِلَّ إِحْدَىٰهُمَا فَتُذَكِّرَ إِحْدَىٰهُمَا ٱلْأُخْرَىٰ وَلَا يَأْبَ ٱلشُّهَدَآءُ إِذَا مَا دُعُوا۟ وَلَا تَسْـَٔمُوٓا۟ أَن تَكْتُبُوهُ صَغِيرًا أَوْ كَبِيرًا إِلَىٰٓ أَجَلِهِۦ ذَٰلِكُمْ أَقْسَطُ عِندَ ٱللَّهِ وَأَقْوَمُ لِلشَّهَٰدَةِ وَأَدْنَىٰٓ أَلَّا تَرْتَابُوٓا۟ إِلَّآ أَن تَكُونَ تِجَٰرَةً حَاضِرَةً تُدِيرُونَهَا بَيْنَكُمْ فَلَيْسَ عَلَيْكُمْ جُنَاحٌ أَلَّا تَكْتُبُوهَا وَأَشْهِدُوٓا۟ إِذَا تَبَايَعْتُمْ وَلَا يُضَآرَّ كَاتِبٌ وَلَا شَهِيدٌ وَإِن تَفْعَلُوا۟ فَإِنَّهُۥ فُسُوقٌۢ بِكُمْ وَٱتَّقُوا۟ ٱللَّهَ وَيُعَلِّمُكُمُ ٱللَّهُ وَٱللَّهُ بِكُلِّ شَىْءٍ عَلِيمٌ"
@time dediac(sentence9)

@info "tokenization"
sentence10 = "هَلْ,; ذَهَبْتَ إِلَى المَكْتَبَةِ؟"
@info tokenize(sentence10) === ["هَلْ", "ذَهَبْتَ", "إِلَى", "المَكْتَبَةِ", ",", ";", "؟"]
@info tokenize(sentence10, false) === ["هَلْ,;", "ذَهَبْتَ", "إِلَى", "المَكْتَبَةِ؟"]

@info "transliterator"
my_encoder = Dict(
    Symbol(Char(0x0621)) => Symbol('('),
    Symbol(Char(0x0622)) => Symbol('\''),
    Symbol(Char(0x0623)) => Symbol('&'),
    Symbol(Char(0x0624)) => Symbol('>'),
    Symbol(Char(0x0625)) => Symbol('}'),
    Symbol(Char(0x0626)) => Symbol('<'),
    Symbol(Char(0x0627)) => Symbol('b'),
    Symbol(Char(0x0628)) => Symbol('A'),
    Symbol(Char(0x0629)) => Symbol('t'),
    Symbol(Char(0x062A)) => Symbol('p'),
    Symbol(Char(0x062B)) => Symbol('j'),
    Symbol(Char(0x062C)) => Symbol('v'),
    Symbol(Char(0x062D)) => Symbol('x'),
    Symbol(Char(0x062E)) => Symbol('H'),
    Symbol(Char(0x062F)) => Symbol('*'),
    Symbol(Char(0x0630)) => Symbol('d'),
    Symbol(Char(0x0631)) => Symbol('z'),
    Symbol(Char(0x0632)) => Symbol('r'),
    Symbol(Char(0x0633)) => Symbol('$'),
    Symbol(Char(0x0634)) => Symbol('s'),
    Symbol(Char(0x0635)) => Symbol('D'),
    Symbol(Char(0x0636)) => Symbol('S'),
    Symbol(Char(0x0637)) => Symbol('Z'),
    Symbol(Char(0x0638)) => Symbol('T'),
    Symbol(Char(0x0639)) => Symbol('g'),
    Symbol(Char(0x063A)) => Symbol('E'),
    Symbol(Char(0x0640)) => Symbol('f'),
    Symbol(Char(0x0641)) => Symbol('_'),
    Symbol(Char(0x0642)) => Symbol('k'),
    Symbol(Char(0x0643)) => Symbol('q'),
    Symbol(Char(0x0644)) => Symbol('m'),
    Symbol(Char(0x0645)) => Symbol('l'),
    Symbol(Char(0x0646)) => Symbol('h'),
    Symbol(Char(0x0647)) => Symbol('n'),
    Symbol(Char(0x0648)) => Symbol('Y'),
    Symbol(Char(0x0649)) => Symbol('w'),
    Symbol(Char(0x064A)) => Symbol('F'),
    Symbol(Char(0x064B)) => Symbol('y'),
    Symbol(Char(0x064C)) => Symbol('K'),
    Symbol(Char(0x064D)) => Symbol('N'),
    Symbol(Char(0x064E)) => Symbol('u'),
    Symbol(Char(0x064F)) => Symbol('a'),
    Symbol(Char(0x0650)) => Symbol('~'),
    Symbol(Char(0x0651)) => Symbol('i'),
    Symbol(Char(0x0652)) => Symbol('^'),
    Symbol(Char(0x0653)) => Symbol('o'),
    Symbol(Char(0x0654)) => Symbol('`'),
    Symbol(Char(0x0670)) => Symbol('#'),
    Symbol(Char(0x0671)) => Symbol(':'),
    Symbol(Char(0x06DC)) => Symbol('{'),
    Symbol(Char(0x06DF)) => Symbol('\"'),
    Symbol(Char(0x06E0)) => Symbol('@'),
    Symbol(Char(0x06E2)) => Symbol(';'),
    Symbol(Char(0x06E3)) => Symbol('['),
    Symbol(Char(0x06E5)) => Symbol('.'),
    Symbol(Char(0x06E6)) => Symbol(','),
    Symbol(Char(0x06E8)) => Symbol('-'),
    Symbol(Char(0x06EA)) => Symbol('!'),
    Symbol(Char(0x06EB)) => Symbol('%'),
    Symbol(Char(0x06EC)) => Symbol('+'),
    Symbol(Char(0x06ED)) => Symbol(']')
);

@transliterator my_encoder "MyEncoder"
@test encode(ar_basmala) === "A~\$^l~ :mmiun~ :mziux^lu#h~ :mziux~Fl~"
@test arabic(encode(ar_basmala)) === ar_basmala

old_keys = collect(keys(BW_ENCODING));
new_vals = reverse(collect(values(BW_ENCODING)));
my_encoder = Dict(old_keys .=> new_vals)
@transliterator my_encoder "MyEncoder"
@info encode(ar_basmala)
@info arabic(encode(ar_basmala))

@info "parsing the orthography"
# @info Ba <: AbstractCharacter
a = parse.(Orthography, tokenize(ar_basmala))
# @info Type{Ba} <: AbstractCharacter
# @info Type{Ba} <: Type{AbstractCharacter}
@info a
# @info typeof(a)
# @info a[1].data[1]
# @info vocal(a[1].data[1])
@info a[2]
# @info vocal(a[2])
# @info numeral(a[2].data[1])
# @info numeral(a[2])

# @info "simple encoding"
# @info parse(SimpleEncoding, ar_basmala)
# @info "types lunar"
# @info Union{Alif,Maddah} <: Union{AbstractLunar}
# @info "trying out camel"
# disambig = Disambiguator()
# dis = predict(disambig, split(dediac(ar_basmala)))
# @test join([d[2][1][2]["diac"] for d in dis], " ") === "بِسَمّ اللّٰه الرَحْمٰن الرَحِيم"

@info "Analyzer"
# analyze = Analyzer()
# aa = analyze("موظف")
# @info aa
# # @info "Generator"
# generate = Generator()
# lemma = "مُوَظَّف"
# features = Dict(
#     "pos" => "noun",
#     "gen" => "m",
#     "num" => "p"
# )
# @info generate(lemma, features)

# @info "Reinflector"
# reinflect = Reinflector()
# word = "شوارع"
# features = Dict(
#     "num" => "d",
#     "prc1" => "bi_prep"
# )

# @info reinflect(word, features)

# # @info "Tagger"
# # sentence11 = tokenize("نجح بايدن في الانتخابات")
# # tag = Tagger()
# # @info tag(sentence11)

# # @info "Morphological Tokenizer"
# # sentence12 = tokenize("فتنفست الصعداء")
# # morph_tokenize = MorphologicalTokenizer()
# # @info morph_tokenize(sentence12)

# # # @info "Dialect Identifier"
# # # sentences13 = [
# # #     "مال الهوى و مالي شكون اللي جابني ليك  ما كنت انايا ف حالي بلاو قلبي يانا بيك",
# # #     "بدي دوب قلي قلي بجنون بحبك انا مجنون ما بنسى حبك يوم"
# # # ]

# # # did = DialectIdentifier()

# # # @info predict(did, sentences13)

