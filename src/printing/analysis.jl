function Base.show(io::IO, t::Analysis)
    asp = String[]
    prc1 = String[]
    cas = String[]
    lex = String[]
    mod = String[]
    vox = String[]
    enc0 = String[]
    diac = String[]
    gen = String[]
    pos = String[]
    rot = String[]
    per = String[]
    stt = String[]
    for i in t.data
        push!(diac, i["diac"])
        push!(pos, i["pos"])
        push!(gen, i["gen"])
        push!(lex, i["lex"])
        push!(asp, i["asp"])
        push!(mod, i["mod"])
        push!(prc1, i["prc1"])
        push!(cas, i["cas"])
        push!(per, i["per"])
        push!(vox, i["vox"])
        push!(rot, i["root"])
        push!(enc0, i["enc0"])
        push!(stt, i["stt"])
    end

    header = ["Diac", "Lemma", "Root", "POS", "Gender", "Aspect", "Case", "Voice", "Mood", "State", "Person", "Prep. PC", "Enclitic"]
    println(io, " «Call .data attribute for more features»")
    pretty_table(io, hcat(diac, lex, rot, pos, gen, asp, cas, vox, mod, stt, per, prc1, enc0); header = header, tf = PrettyTables.tf_compact)
end