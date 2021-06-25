# Welcome to Salaam.jl Documentation
Salaam.jl is a natural language processing suite for Arabic language. It offers the following basic utilities: _dediacritization_, _normalization_, _transliteration_ (including _custom transliteration_) and _simple encoding_. For advance features, it uses the [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html)' APIs for tasks such as, _disambiguation_, _morphological analysis_, _dialectic identification_, _named-entity recognition_ and _sentiment analysis_. 

Salaam (سلام) /səˈläm/ is the Arabic word for "peace", a common greeting in many Arabic-speaking and Muslim countries.
## Requirements
In order to use functionalities from [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html), Salaam.jl requires you to have Python 3.0 or above installed in your machine.

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
The above code will also download the CAMeL light data, which includes all advanced features mentioned except for dialectic identification, named-entity recognition and sentiment analysis. If you want to install the full CAMeL data (about 2GB file size), run the following instead:
```julia
julia> using Salaam
julia> install_camel(true)
```
If you prefer to save the CAMeL data into a specific folder, you need to specify this in your environment variables via `.bashrc`, `.bash_profile`, etc. as follows:
```
export CAMELTOOLS_DATA=/path/to/camel_tools_data
```
For more on CAMeL data setup, please refer to this [link](https://camel-tools.readthedocs.io/en/latest/getting_started.html#installation).