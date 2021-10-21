using Documenter
using Salaam

makedocs(
    sitename = "Salaam.jl",
    format = Documenter.HTML(
        # assets = ["assets/favicon.ico"]
    ),
    authors = "Al-Ahmadgaid B. Asaad",
    modules = [Salaam],
    pages = [
        "Home" => "index.md",
        "Basic Utilities" => "man/basic_utilities.md",
        "Orthographical Analysis" => "man/orthography.md",
        "Morphological Analysis" => "man/morphology.md",
        "Disambiguation" => "man/disambiguation.md",
        "Morphological Tokenizer" => "man/tokenizer.md",
        "POS Tagging" => "man/pos_tagging.md",
        "API" => "man/api.md",
        "Arabic Grammar" => [
            "Introduction" => "book/introduction.md",
            "Ch1. Structure" => "book/structure.md",
            "Ch2. Verb" => "book/verb.md"
        ]
    ]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
