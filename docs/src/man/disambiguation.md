Disambiguation
==========
While Arabic has vowels like English, in practice these are not often indicated in texts. As such, any word with no vowel can have multiple readings. Its reading is determined based on the context of the sentence it is used in. Salaam.jl, using CAMeL APIs, offers functionality for analyzing the possible disambiguation of the text.

As an example, to disambiguate the dediacritized basmala, we instantiate the `Disambiguator` object and use it for disambiguation.
```@repl abc
using Salaam

ar_basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
dd_basmala = dediac(ar_basmala)
```
To disambiguate this, we run the following:
```@repl abc
disambig = Disambiguator();
dis = predict(disambig, split(dd_basmala))
```
It returns a lot of output, and the predicted disambiguation is obtained as follows:
```@repl abc
join([d[2][1][2]["diac"] for d in dis], " ")
```