using Documenter
using Salaam

makedocs(
    sitename = "Salaam.jl",
    format = Documenter.HTML(
        assets = ["assets/logo.ico"]
    ),
    authors = "Al-Ahmadgaid B. Asaad",
    modules = [Salaam]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
