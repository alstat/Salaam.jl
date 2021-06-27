# Welcome to Salaam.jl Documentation
Salaam.jl is a natural language processing (NLP) suite for Arabic language. It offers APIs for all the necessary functionalities, from basic utilities like _dediacritization_, _normalization_, _transliteration_ (including _custom transliteration_) and _simple encoding_; to advanced features, such as _disambiguation_, _morphological analysis_, _dialectic identification_, _named-entity recognition_ and _sentiment analysis_. The advanced features are based on [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html)' APIs.

In addition to this, Salaam.jl aims to offer standardized types on the Morphological Features. This is because [QuranTree.jl](https://alstat.github.io/QuranTree.jl/dev/) has different labelling (_see_ table [here](https://alstat.github.io/QuranTree.jl/dev/man/morphological_features/)) compared to the [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/reference/camel_morphology_features.html). In order to address this, Salaam.jl uses standardized immutable types that is already used in [QuranTree.jl](https://alstat.github.io/QuranTree.jl/dev/), but can also be applied to different mappings like the one specified in [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html). With this standardization, Salaam.jl can therefore seemlessly apply the advanced features based on [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html) to QuranTree.jl. See section for application of Salaam.jl on QuranTree.jl.

Salaam (سلام) /səˈläm/ is the Arabic word for "peace", a common greeting in many Arabic-speaking and Muslim countries.
## Requirements
In order to use all of the advanced features based on [CAMeL Tools](https://camel-tools.readthedocs.io/en/latest/index.html), Salaam.jl requires you to have Python 3.0 or above installed in your machine.

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
The above code will also download the CAMeL light data, which includes all advanced features mentioned except for _dialectic identification_, _named-entity recognition_ and _sentiment analysis_. If you want to install the full CAMeL dataset (about 2GB file size), run the following instead:
```julia
julia> using Salaam
julia> install_camel(true)
```
If you prefer to save the CAMeL data into a specific folder, you need to specify this in your environment variables via `.bashrc`, `.bash_profile`, etc. as follows:
```
export CAMELTOOLS_DATA=/path/to/camel_tools_data
```
For more on CAMeL data setup, please refer to this [link](https://camel-tools.readthedocs.io/en/latest/getting_started.html#installation).