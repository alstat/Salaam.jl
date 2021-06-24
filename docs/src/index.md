# Salaam.jl

Salaam.jl is a universal NLP toolkit for Arabic language. It offers features from basic to advance. For the basic utilities, it has the following functionalities: dediacritization, normalization, transliteration (including custom transliteration) and simple encoding. For advance features, it uses the CAMeL Tools' APIs for task such as, disambiguation, morphological analysis like generation and reinflection of a given word. It also includes dialectic identification, named-entity recognition and sentiment analysis. 

Salaam /səˈläm/ (سلام) is the Arabic word for "peace", a universal Muslim greeting.

## Installation
To install the package, run the following:
```julia
julia> using Pkg
julia> Pkg.add("Salaam")
```
Once successfully installed, next is to install the CAMeL Tools as follows:
```julia
julia> using Salaam
julia> install_camel()
```
The above code will also download the CAMeL Light Data, which includes all advanced items mentioned except for dialectic identification, named-entity recognition and sentiment analysis. If you want to install the full CAMeL Data (with 2GB file size), run the following instead or after the above code:
```julia
julia> using Salaam
julia> install_camel(true)
```
```@raw html
<style>
@import url('https://fonts.googleapis.com/css2?family=Scheherazade:wght@400;700&display=swap');

.arabic {
    font-family: 'Scheherazade', serif;
    font-size: 23px;
}
</style>
The following is an example of arabic text.
<div class="arabic" style="text-align: center;">
بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ
</div>
```