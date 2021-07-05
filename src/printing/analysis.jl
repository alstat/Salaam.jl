function Base.show(io::IO, t::Analysis)
    print(io, "Analysis: ")
    print(io, " └ root: ", t.data["root"], "; gloss: ", t.data["gloss"], "; pos: ", t.data["pos"], "; call .data attribute for more.")
end