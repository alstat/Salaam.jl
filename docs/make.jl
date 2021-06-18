using Documenter
using Salaam

makedocs(
    sitename = "Salaam",
    format = Documenter.HTML(),
    modules = [Salaam]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
