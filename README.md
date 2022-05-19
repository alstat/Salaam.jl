# Salaam.jl <img src="docs/src/assets/logo.png" align="right" width="100"/>
[![CI](https://github.com/alstat/Salaam.jl/actions/workflows/ci.yml/badge.svg)](https://github.com/alstat/Salaam.jl/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/alstat/Salaam.jl/branch/main/graph/badge.svg?token=YTEWJ4IXCZ)](https://codecov.io/gh/alstat/Salaam.jl)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://alstat.github.io/Salaam.jl/dev/)
[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/alstat/Salaam.jl/blob/master/LICENSE)

Salaam.jl is a light suite for Arabic Natural Language Processing (ANLP). It offers APIs for the building blocks of ANLP specifically _dediacritization_, _normalization_, _transliteration_ (including _custom transliteration_), _simple encoding_, and _orthographical analysis_.

Salaam (سلام) /səˈläm/ is the Arabic word for "peace," a common greeting among Arabic-speaking countries and among non-Arabic-speaking Muslims around the world.
## Installation
To install the package run the following:
```julia
julia> using Pkg
julia> Pkg.add("Salaam")
```