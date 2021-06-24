# Welcome to Salaam.jl Documentation
Salaam.jl is a natural language processing toolkit for Arabic language. It has the following basic utilities: dediacritization, normalization, transliteration (including custom transliteration) and simple encoding. For advance features, it uses the [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html)' APIs for tasks such as, disambiguation, morphological analysis, dialectic identification, named-entity recognition and sentiment analysis. 

Salaam (سلام) /səˈläm/ is the Arabic word for "peace", a common greeting in many Arabic-speaking and Muslim countries.

## Installation
To install the package, run the following:
```julia
julia> using Pkg
julia> Pkg.add("Salaam")
```
Once successfully installed, next is to install the [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html) as follows:
```julia
julia> using Salaam
julia> install_camel()
```
The above code will also download the CAMeL light data, which includes all advanced items mentioned except for dialectic identification, named-entity recognition and sentiment analysis. If you want to install the full CAMeL data (about 2GB file size), run the following instead:
```julia
julia> using Salaam
julia> install_camel(true)
```
If you prefer to save the CAMeL data into a specific folder, you need to specify this in your environment variables via `.bashrc`, `.bash_profile`, etc. as follows:
```
export CAMELTOOLS_DATA=/path/to/camel_tools_data
```
For more on CAMeL data setup, please refer to this [link](https://camel-tools.readthedocs.io/en/latest/getting_started.html#installation).