Morphological Analysis
=================
Roots serves as the source of the inflection and generation. However, unlike in English which can inflect up to at most 6 variations, Arabic can have more than 500. This inflection returns a unique morphology which therefore deserves analysis.
## Analysis
For example:
```@repl abc
using Salaam

analyze = Analyzer();
analyze("موظف")
```
## Generation
For generation, we can do the following:
```@repl abc
generate = Generator();
lemma = "مُوَظَّف";
features = Dict(
    "pos" => "noun",
    "gen" => "m",
    "num" => "p"
);
generate(lemma, features)
```
## Reinflection
For inflection, we can do the following:
```@repl abc
reinflect = Reinflector();
word = "شوارع";
features = Dict(
    "num" => "d",
    "prc1" => "bi_prep"
);
reinflect(word, features)
```