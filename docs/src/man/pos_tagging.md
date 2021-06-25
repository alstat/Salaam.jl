Part-of-Speech Tagging
======
POS Tagging is done using the `Tagger` struct. For example,

```@repl abc
using Salaam

sentence11 = tokenize("نجح بايدن في الانتخابات")
tag = Tagger();
tag(sentence11)
```