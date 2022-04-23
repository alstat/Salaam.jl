using Salaam
data = CAMeLData(:morphology_glf)
download(data)
delete!(data)
delete!(CAMeLData(:all))
rm(Salaam.CAMEL_DISAMBIGUATION * "/", recursive=true)
readdir(Salaam.CAMEL_MORPHOLOGY)

function Base.delete!(data::Symbol)
    if data == :all_db
        rm(Salaam.CAMEL_DATA, recursive=true)
        @info "Successfully deleted db folder"
    elseif data == :morphology
        delete_all_files!(Salaam.CAMEL_MORPHOLOGY)
        @info "Successfully deleted files under the morphology folder."
    elseif data == :disambiguation
        delete_all_files!(Salaam.CAMEL_DISAMBIGUATION)
        @info "Successfully deleted files under the disambiguation folder."
    elseif data == :ner
        delete_all_files!(Salaam.CAMEL_NER)
        @info "Successfully deleted files under the ner folder."
    elseif data == :sentiment
        delete_all_files(Salaam.CAMEL_SENTIMENT)
        @info "Successfully deleted files under the sentiment folder."
    elseif data == :dialectid
        delete_all_files(Salaam.CAMEL_DIALECTID)
        @info "Successfully deleted files under the dialectid folder."
    else
        throw("Unknown value data=:" * string(data) * ", choices are :all_db, :morphology, :disambiguation, :ner, :sentiment, :diaclectid.")
    end
end

function delete_all_files!(path::String)
    all_files = readdir(path)
    for i in all_files
        rm(joinpath(path, i), recursive=true)
    end
end
data = CAMeLData(:disambiguation)
Salaam.CAMEL_MORPHOLOGY