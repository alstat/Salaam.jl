Basic Utilities
=====
In this section, we are going to discuss how to use the APIs for dediacritization, normalization and transliteration.
## Dediacritization
The function to use is `dediac`, which works on Arabic, Buckwalter and custom transliterated characters.
```@repl abc
using Salaam

ar_basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
dediac(ar_basmala)
```
Or using Buckwalter as follows:
```@repl abc
bw_basmala = "bisomi {ll~ahi {lr~aHoma`ni {lr~aHiymi";
dediac(bw_basmala)
```
For dediacritization on custom transliteration, refer here.
## Normalization
The function to use is `normalize`, which works on Arabic, Buckwalter and custom transliterated characters. For example, using the `ar_basmala` and `bw_basmala` defined above, the normalized version would be
```@repl abc
normalize(ar_basmala)
normalize(bw_basmala)
```
You can also normalize specific characters, for example:
```@repl abc
normalize(ar_basmala, :alif_khanjareeya)
normalize(ar_basmala, :hamzat_wasl)
sentence1 = "وَٱلَّذِينَ يُؤْمِنُونَ بِمَآ أُنزِلَ إِلَيْكَ وَمَآ أُنزِلَ مِن قَبْلِكَ وَبِٱلْءَاخِرَةِ هُمْ يُوقِنُونَ"
normalize(sentence1, :alif_maddah)
normalize(sentence1, :alif_hamza_above)
sentence2 = "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ";
normalize(sentence2, :alif_hamza_below)
sentence3 = "ٱلَّذِينَ يُؤْمِنُونَ بِٱلْغَيْبِ وَيُقِيمُونَ ٱلصَّلَوٰةَ وَمِمَّا رَزَقْنَٰهُمْ يُنفِقُونَ";
normalize(sentence3, :waw_hamza_above)
normalize(sentence3, :ta_marbuta)
sentence4 = "ٱللَّهُ يَسْتَهْزِئُ بِهِمْ وَيَمُدُّهُمْ فِى طُغْيَٰنِهِمْ يَعْمَهُونَ";
normalize(sentence4, :ya_hamza_above)
sentence5 = "ذَٰلِكَ ٱلْكِتَٰبُ لَا رَيْبَ فِيهِ هُدًى لِّلْمُتَّقِينَ";
normalize(sentence5, :alif_maksura)
```
Or a combination,
```@repl abc
normalize(ar_basmala, [:alif_khanjareeya, :hamzat_wasl])
```
For normalization on custom transliteration, refer here.
## Transliteration
By default, Salaam.jl uses [extended Buckwalter transliteration](https://corpus.quran.com/java/buckwalter.jsp). The function to use are `encode` (Arabic -> Roman) and `arabic` (Roman -> Arabic). The following are some examples:
```@repl abc
arabic(bw_basmala)
arabic(bw_basmala) === ar_basmala
encode(ar_basmala)
encode(ar_basmala) === bw_basmala
```
### Custom Transliteration
For custom transliteration, user must specify the character mapping in a dictionary with `Symbol` type for both keys and values. By default, the Buckwalter mapping used in Salaam.jl is encoded in the constant variable `BW_ENCODING`.
```@repl abc
BW_ENCODING
```
Suppose we want to create a custom transliteration by simply reversing the values of the dictionary, then we have the following:
```@repl abc
old_keys = collect(keys(BW_ENCODING));
new_vals = reverse(collect(values(BW_ENCODING)));
```
The new dictionary would be:
```@repl abc
my_encoder = Dict(old_keys .=> new_vals)
```
Next is to declare this new transliteration so functions for dediacritization and normalization can use the new mapping. This is done using the macro `@transliterator`, which takes two arguments: _the dictionary_ and _the type name of the mapping_.
```@repl abc
@transliterator my_encoder "MyEncoder"
```
Using this new transliteration, we now have an updated mapping for the basmala above:
```@repl abc
encode(ar_basmala)
```
Reversing this two Arabic characters should give us the appropriate decoding:
```@repl abc
arabic(encode(ar_basmala))
```