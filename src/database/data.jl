struct CAMeLData
    data::Symbol
end

function Base.download(camel::CAMeLData)
    check_db()
    if camel.data == :morphology
        camel_morphology()
    elseif camel.data == :morphology_egy
        camel_morphology(:egy)
    elseif camel.data == :morphology_msa
        camel_morphology(:msa)
    elseif camel.data == :morphology_glf
        camel_morphology(:glf)
    elseif camel.data == :disambiguation
        camel_disambiguation()
    elseif camel.data == :disambiguation_mle_egy
        camel_disambiguation(:mle_egy)
    elseif camel.data == :disambiguation_mle_msa
        camel_disambiguation(:mle_msa)
    elseif camel.data == :disambiguation_bert_egy
        camel_disambiguation(:bert_egy)
    elseif camel.data == :disambiguation_bert_msa
        camel_disambiguation(:bert_msa)
    elseif camel.data == :disambiguation_bert_glf
        camel_disambiguation(:bert_glf)
    elseif camel.data == :sentiment
        camel_sentiment()
    elseif camel.data == :sentiment_mbert
        camel_sentiment(:mbert)
    elseif camel.data == :sentiment_arabert
        camel_sentiment(:arabert)
    elseif camel.data == :ner
        camel_ner()
    elseif camel.data == :dialectid
        camel_dialectidentification()
    elseif camel.data == :all
        @info "Downloading all data."
        camel_morphology()
        camel_disambiguation()
        camel_sentiment()
        camel_ner()
        camel_dialectid()
    else
        throw("data=:" * string(camel.data) * " is not supported. See docs for available choices for data.")
    end
end

function camel_morphology(type::Symbol=:all)
    files = readdir(Salaam.CAMEL_MORPHOLOGY)
    if length(files) > 0
        @info "Morphology DB is already available, no need to download. Run delete!(CAMeLData(:morphology)) to delete current Morphology DB."
    else
        catalogue = JSON.parsefile(Salaam.CAMEL_CATALOGUE);
        if type == :all
            HTTP.download(catalogue["packages"]["morphology-db-egy-r13"]["url"], Salaam.CAMEL_MORPHOLOGY_EGY_R13)
            HTTP.download(catalogue["packages"]["morphology-db-msa-r13"]["url"], Salaam.CAMEL_MORPHOLOGY_MSA_R13)
            HTTP.download(catalogue["packages"]["morphology-db-glf-01"]["url"], Salaam.CAMEL_MORPHOLOGY_GLF_01)
            unzip(Salaam.CAMEL_MORPHOLOGY_EGY_R13)
            unzip(Salaam.CAMEL_MORPHOLOGY_MSA_R13)
            unzip(Salaam.CAMEL_MORPHOLOGY_GLF_01)
        elseif type == :egy
            HTTP.download(catalogue["packages"]["morphology-db-egy-r13"]["url"], Salaam.CAMEL_MORPHOLOGY_EGY_R13)
        elseif type == :msa
            HTTP.download(catalogue["packages"]["morphology-db-msa-r13"]["url"], Salaam.CAMEL_MORPHOLOGY_MSA_R13)
        elseif type == :glf
            HTTP.download(catalogue["packages"]["morphology-db-glf-01"]["url"], Salaam.CAMEL_MORPHOLOGY_GLF_01)
        else
            throw("type=:" * string(type) * ", unknown type. Choices are :egy, :msa, :glf and :all.")
        end
    end
end

function camel_disambiguation(type::Symbol=:all)
    files = readdir(Salaam.CAMEL_DISAMBIGUATION)
    if length(files) > 0
        @info "Disambiguation DB is already available, no need to download. Run delete!(CAMeLData(:disambiguation)) to delete current Disambiguation DB."
    else
        catalogue = JSON.parsefile(Salaam.CAMEL_CATALOGUE);
        if type == :all
            HTTP.download(catalogue["packages"]["disambig-mle-calima-egy-r13"]["url"], Salaam.CAMEL_DISAMBIG_MLE_CALIMA_EGY_R13)
            HTTP.download(catalogue["packages"]["disambig-mle-calima-msa-r13"]["url"], Salaam.CAMEL_DISAMBIG_MLE_CALIMA_MSA_R13)
            HTTP.download(catalogue["packages"]["disambig-bert-unfactored-egy"]["url"], Salaam.CAMEL_DISAMBIG_BERT_UNFACTORED_EGY)
            HTTP.download(catalogue["packages"]["disambig-bert-unfactored-msa"]["url"], Salaam.CAMEL_DISAMBIG_BERT_UNFACTORED_MSA)
            HTTP.download(catalogue["packages"]["disambig-bert-unfactored-glf"]["url"], Salaam.CAMEL_DISAMBIG_BERT_UNFACTORED_GLF)
        elseif type == :mle_egy
            HTTP.download(catalogue["packages"]["disambig-mle-calima-egy-r13"]["url"], Salaam.CAMEL_DISAMBIG_MLE_CALIMA_EGY_R13)
        elseif type == :mle_msa
            HTTP.download(catalogue["packages"]["disambig-mle-calima-msa-r13"]["url"], Salaam.CAMEL_DISAMBIG_MLE_CALIMA_MSA_R13)
        elseif type == :bert_egy
            HTTP.download(catalogue["packages"]["disambig-bert-unfactored-egy"]["url"], Salaam.CAMEL_DISAMBIG_BERT_UNFACTORED_EGY)
        elseif type == :bert_msa
            HTTP.download(catalogue["packages"]["disambig-bert-unfactored-msa"]["url"], Salaam.CAMEL_DISAMBIG_BERT_UNFACTORED_MSA)
        elseif type == :bert_glf
            HTTP.download(catalogue["packages"]["disambig-bert-unfactored-glf"]["url"], Salaam.CAMEL_DISAMBIG_BERT_UNFACTORED_GLF)
        else
            throw("type=:" * string(type) * ", unknown type. Choices are :mle_egy, :mle_msa, :bert_egy, :bert_msa, :bert_glf and :all.")
        end
    end
end

function camel_ner()
    files = readdir(Salaam.CAMEL_NER)
    if length(files) > 0
        @info "NER DB is already available, no need to download. Run delete!(CAMeLData(:ner)) to delete current NER DB."
    else
        catalogue = JSON.parsefile(Salaam.CAMEL_CATALOGUE);
        HTTP.download(catalogue["packages"]["ner-arabert"]["url"], Salaam.CAMEL_NER_ARABERT)
    end
end

function camel_dialectidentification()
    files = readdir(Salaam.CAMEL_DIALECTID)
    if length(files) > 0
        @info "Dialect Identification DB is already available, no need to download. Run delete!(CAMeLData(:dialectid)) to delete current Dialect Identification DB."
    else
        catalogue = JSON.parsefile(Salaam.CAMEL_CATALOGUE);
        HTTP.download(catalogue["packages"]["dialectid-default"]["url"], Salaam.CAMEL_DIALECTID_DEFAULT)
    end
end

function camel_sentiment(type::Symbol=:all)
    files = readdir(Salaam.CAMEL_SENTIMENT)
    if length(files) > 0
        @info "Sentiment DB is already available, no need to download. Run delete!(CAMeLData(:sentiment)) to delete current Sentiment DB."
    else
        catalogue = JSON.parsefile(Salaam.CAMEL_CATALOGUE);
        if type == :all
            HTTP.download(catalogue["packages"]["sentiment-analysis-mbert"]["url"], Salaam.CAMEL_SENTIMENT_MBERT)
            HTTP.download(catalogue["packages"]["sentiment-analysis-arabert"]["url"], Salaam.CAMEL_SENTIMENT_ARABERT)    
        elseif type == :mbert
            HTTP.download(catalogue["packages"]["sentiment-analysis-mbert"]["url"], Salaam.CAMEL_SENTIMENT_MBERT)
        elseif type == :arabert
            HTTP.download(catalogue["packages"]["sentiment-analysis-arabert"]["url"], Salaam.CAMEL_SENTIMENT_ARABERT)    
        else
            throw("type=:" * string(type) * ", unknown type. Choices are :mbert, :arabert and :all.")
        end
    end
end

function create_db()
    # create folder
    mkdir(Salaam.CAMEL_DATA)
    mkdir(Salaam.CAMEL_MORPHOLOGY)
    mkdir(Salaam.CAMEL_DISAMBIGUATION)
    mkdir(Salaam.CAMEL_DIALECTID)
    mkdir(Salaam.CAMEL_NER)
    mkdir(Salaam.CAMEL_SENTIMENT)
end

function check_db()
    try
        readdir(joinpath(@__DIR__, "../../db"))
    catch
        create_db()
        HTTP.download(Salaam.CATALOGUE_URL, Salaam.CAMEL_CATALOGUE, update_period=5);
    end
end

function Base.delete!(camel::CAMeLData)
    try
        if camel.data == :all
            rm(Salaam.CAMEL_DATA, recursive=true)
            @info "Successfully deleted db folder"
        elseif camel.data == :morphology
            delete_all_files!(Salaam.CAMEL_MORPHOLOGY)
            @info "Successfully deleted files under the morphology folder."
        elseif camel.data == :disambiguation
            delete_all_files!(Salaam.CAMEL_DISAMBIGUATION)
            @info "Successfully deleted files under the disambiguation folder."
        elseif camel.data == :ner
            delete_all_files!(Salaam.CAMEL_NER)
            @info "Successfully deleted files under the ner folder."
        elseif camel.data == :sentiment
            delete_all_files!(Salaam.CAMEL_SENTIMENT)
            @info "Successfully deleted files under the sentiment folder."
        elseif camel.data == :dialectid
            delete_all_files!(Salaam.CAMEL_DIALECTID)
            @info "Successfully deleted files under the dialectid folder."
        else
            throw("Unknown value CAMeLData(:" * string(data) * "), choices for x in CAMeLData(x) are :all, :morphology, :disambiguation, :ner, :sentiment, :diaclectid.")
        end
    catch
        throw("No db folder yet, run download(CAMeLData(:" * string(camel.data) * ")) to create the folder.")
    end
end

function delete_all_files!(path::String)
    all_files = readdir(path)
    for i in all_files
        rm(joinpath(path, i), recursive=true)
    end
end

#######
# function find_gcode(ckj)
#     for cookie ∈ ckj
#         if match(r"_warning_", cookie.name) !== nothing
#             return cookie.value
#         end
#     end
#     nothing
# end

# function check_data(camel::CAMeLData)
#     try
#         data_list = readdir(CAMEL_DATA)
#         if camel.type === :light
#             if length(data_list) > 2
#                 @info "Full CAMeLData already downloaded. To override, run delete!(CAMeLData) and then download again."
#                 return true
#             else
#                 @info "Light CAMeLData already downloaded. To override, run delete!(CAMeLData) and then download again."
#                 return true
#             end
#         elseif camel.type === :full
#             if length(data_list) < 3
#                 @info "Overriding light CAMeLData already downloaded, to download the full CAMeLData."
#                 return false
#             else 
#                 return true
#             end
#         else
#             error(string("Expecting :light or :full for CAMeLData, got ", camel.type, " instead."))
#         end
#     catch
#         return false
#     end
# end

# function Base.download(camel::CAMeLData, update_period::Int64=5)
#     isdata = check_data(camel)

#     if isdata
#         return nothing
#     else
#         @info "downloading catalogue from camel_tools"
#         HTTP.download(CATALOGUE, CAMEL_CATALOGUE, update_period=5);
#         catalogue = JSON.parsefile(CAMEL_CATALOGUE);
#         if camel.type === :light
#             data = catalogue["downloads"]["light"]
#         else
#             data = catalogue["downloads"]["full"]
#         end

#         url = string(GOOGLE_DRIVE, "&id=", data["file_id"])
#         filepath = joinpath(@__DIR__, "../..", "data.zip")
        
#         @info "downloading camel data"
#         downloaded_bytes = 0
#         default_ckjar = HTTP.CookieRequest.default_cookiejar
#         ckjar = copy(default_ckjar isa Array ? default_ckjar[Base.Threads.threadid()] : default_ckjar)
#         HTTP.open("GET", url; cookies=true, cookiejar=ckjar) do stream
#             ckj = ckjar["docs.google.com"]
#             code = find_gcode(ckj)
#             if code !== nothing
#                 url = string(GOOGLE_DRIVE, "&confirm=", code, "&id=", data["file_id"])
#                 HTTP.request("GET", url, response_stream=stream, update_period=5)
#                 Base.open(filepath, "w") do file
#                     while(!eof(steam))
#                         write(file, readavailable(stream))
#                     end
#                 end
#             else
#                 HTTP.download(url, filepath, response_stream=stream, update_period=5)
#             end
#         end

#         @info "unzipping downloaded data"
#         unzip(filepath, joinpath(@__DIR__, "../.."))
#     end
# end

# function Base.download(camel::CAMeLData, path::Union{String,Nothing}=nothing)
#     @info "downloading catalogue from camel_tools"
#     ENV["CAMEL_CATALOGUE"] = joinpath(@__DIR__, "../catalogue.json")
#     HTTP.download(CATALOGUE, ENV["CAMEL_CATALOGUE"], update_period=5);
#     catalogue = JSON.parsefile(ENV["CAMEL_CATALOGUE"]);
#     if camel.type === :light
#         data = catalogue["downloads"]["light"]
#         url = string(GOOGLE_DRIVE, "&id=", data["file_id"])
#     else
#         data = catalogue["downloads"]["full"]
#         url = string(GOOGLE_DRIVE, "&id=", data["file_id"])
#     end

#     if path isa Nothing
#         ENV["CAMEL_DATA"] = joinpath(@__DIR__, "../..", "data")
#         filepath = joinpath(@__DIR__, "../..", "data.zip")
#     else
#         ENV["CAMEL_DATA"] = joinpath(path, "data")
#         filepath = joinpath(path, "data.zip")
#     end
#     @info "downloading camel data"
#     HTTP.download(url, filepath, update_period=5)
    
#     @info "unzipping downloaded data"
#     if path isa Nothing
#         unzip(filepath, joinpath(@__DIR__, "../.."))
#     else
#         unzip(filepath, path)
#     end
# end

# function Base.delete!(::Type{CAMeLData})
#     try
#         rm(CAMEL_DATA, recursive=true)
#         @info string("successfully deleted data at ", CAMEL_DATA)
#     catch
#         @info "no camel data yet"
#     end

#     try 
#         rm(CAMEL_CATALOGUE)
#         @info string("successfully deleted catalogue at ", CAMEL_CATALOGUE)
#     catch
#         @info "no camel catalogue yet"
#     end
# end

# function locate(::Type{CAMeLData})
#     return CAMEL_DATA
# end

# function install_camel(full_data::Bool=false)
#     if full_data
#         @info "installing camel-tools"
#         run(`pip3 install camel-tools`)
#         @info "downloading camel_data"
#         run(`camel_data full`)
#     else
#         @info "installing camel-tools"
#         run(`pip3 install camel-tools`)
#         @info "downloading camel_data"
#         run(`camel_data light`)
#     end
# end

# function install_camel(full_data::Bool=false, data_directory::Union{Nothing,String}=nothing)
#     if full_data
#         @info "installing camel-tools"
#         run(`pip3 install camel-tools`)
#         if data_directory isa Nothing
#             @info "downloading camel_data"
#             run(`camel_data full`)
#         else
#             @info "downloading camel_data to " * data_directory
#             ENV["CAMELTOOLS_DATA"] = data_directory
#             run(`sh -c export '|' camel_data full`)
#             # run(`camel_data full`)
#         end
#     else
#         @info "installing camel-tools"
#         run(`pip3 install camel-tools`)
#         if data_directory isa Nothing
#             @info "downloading camel_data"
#             run(`camel_data light`)
#         else
#             @info "downloading camel_data to " * data_directory
#             ENV["CAMELTOOLS_DATA"] = data_directory
#             run(`sh -c export '|' camel_data light`)
#             # run(`camel_data light`)
#         end
#     end
# end