Working with QuranTree.jl
========
Salaam.jl can seemlessly work with [QuranTree.jl](https://alstat.github.io/QuranTree.jl/dev/).
```@setup abc
using Pkg
Pkg.add("QuranTree")
```
```@repl abc
using Salaam
using QuranTree

data = QuranData();
crps, tnzl = load(data);
crpsdata = table(crps)
tnzldata = table(tnzl)
Salaam.arabic(verses(crpsdata[114])[1])
```
!!! note "Note"
    You have to install QuranTree.jl to run the above example. To install, run
    ```julia
    using Pkg
    Pkg.add("QuranTree")
    ```
## Normalization
```@repl abc
ikhlas = crpsdata[114]
ikhlas_vrs = verses(ikhlas)
ikhlas_nrm = Salaam.normalize.(ikhlas_vrs)
Salaam.arabic.(ikhlas_nrm)
```
## Dediacritization
```@repl abc
ikhlas_ddc = Salaam.dediac.(ikhlas_vrs)
Salaam.arabic.(ikhlas_ddc)
```
## Transliteration
```@repl abc
Salaam.encode.(ikhlas_vrs)
```