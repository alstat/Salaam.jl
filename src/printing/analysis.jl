function Base.show(io::IO, t::Analysis)
    println(io, "Analysis: ")
    j = 1
    for i in t.data
        if j === length(t.data)
            println(io, " └ root: ", i["root"], "; gloss: ", i["gloss"], "; pos: ", i["pos"])
            println(io, "call .data attribute for more.")
        else 
            print(io, " ├ root: ", i["root"], "; gloss: ", i["gloss"], "; pos: ", i["pos"])
        end
        j += 1
    end
end