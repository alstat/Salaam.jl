Orthographical Analysis
=============
All Arabic characters and diacritics and other characters used in Arabic texts, such as the Qur'an are all encoded as `struct`s or types. These types have properties that can be used for Orthography analysis. These properties are the vocal and numeral associated with each of the character.

## Numerals
The numerals we refer here is the [Abjad numeral](https://en.wikipedia.org/wiki/Abjad_numerals).
```@repl abc2
using Salaam

ar_basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
```
If we want to take the numerals, we need to tokenize it first.
```@repl abc2
arb_token = tokenize(ar_basmala)
```
Next we then parse each of these words as   `Orthography`.
```@repl abc2
arb_parsed1 = parse(Orthography, arb_token[1])
arb_parsed2 = parse.(Orthography, arb_token)
```
Finally, we can compute the numerals of the parsed tokens as follows:
```@repl abc2
numeral(arb_parsed2[1])
numeral(arb_parsed2[2])
numeral(arb_parsed2[3])
```
```@repl abc2
isfeat(arb_parsed2[1], AbstractLunar)
arb_parsed2[1][isfeat(arb_parsed2[1], AbstractLunar)]
isfeat.(arb_parsed2, AbstractLunar)
isfeat.(arb_parsed2, AbstractSolar)
```
## Vocals
```@repl abc2
vocal(arb_parsed2[1])
vocal(arb_parsed2[2])
vocal(arb_parsed2[3])
```

## Simple Encoding
```@repl abc2
parse(SimpleEncoding, ar_basmala)
```