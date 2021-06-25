Morphological Tokenizer
========
For morphological tokenizer, we use the struct `MorphologicalTokenizer`. For example,
```@repl abc
using Salaam

sentence12 = tokenize("فتنفست الصعداء")
morph_tokenize = MorphologicalTokenizer();
morph_tokenize(sentence12)
```