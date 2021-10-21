mutable struct CAMeLData
    type::Symbol
end

function Base.download(camel::CAMeLData, path::Union{String,Nothing}=nothing)
    @info "downloading catalogue from camel_tools"
    ENV["CAMEL_CATALOGUE"] = joinpath(@__DIR__, "../catalogue.json")
    HTTP.download(CATALOGUE, ENV["CAMEL_CATALOGUE"], update_period=5);
    catalogue = JSON.parsefile(ENV["CAMEL_CATALOGUE"]);
    if camel.type === :light
        data = catalogue["downloads"]["light"]
        url = string(GOOGLE_DRIVE, "&id=", data["file_id"])
    else
        data = catalogue["downloads"]["full"]
        url = string(GOOGLE_DRIVE, "&id=", data["file_id"])
    end

    if path isa Nothing
        ENV["CAMEL_DATA"] = joinpath(@__DIR__, "../..", "data")
        filepath = joinpath(@__DIR__, "../..", "data.zip")
    else
        ENV["CAMEL_DATA"] = joinpath(path, "data")
        filepath = joinpath(path, "data.zip")
    end
    @info "downloading camel data"
    HTTP.download(url, filepath, update_period=5)
    
    @info "unzipping downloaded data"
    if path isa Nothing
        unzip(filepath, joinpath(@__DIR__, "../.."))
    else
        unzip(filepath, path)
    end
end

function Base.delete!(::Type{CAMeLData})
    try
        rm(ENV["CAMEL_DATA"], recursive=true)
        @info string("successfully deleted data at ", ENV["CAMEL_DATA"])
    catch
        @info "no camel data yet"
    end

    try 
        rm(ENV["CAMEL_CATALOGUE"])
        @info string("successfully deleted catalogue at ", ENV["CAMEL_CATALOGUE"])
    catch
        @info "no camel catalogue yet"
    end
end

function install_camel(full_data::Bool=false)
    if full_data
        @info "installing camel-tools"
        run(`pip3 install camel-tools`)
        @info "downloading camel_data"
        run(`camel_data full`)
    else
        @info "installing camel-tools"
        run(`pip3 install camel-tools`)
        @info "downloading camel_data"
        run(`camel_data light`)
    end
end

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