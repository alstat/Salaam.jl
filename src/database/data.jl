struct CAMeLData
    type::Symbol
end

function find_gcode(ckj)
    for cookie ∈ ckj
        if match(r"_warning_", cookie.name) !== nothing
            return cookie.value
        end
    end
    nothing
end

function check_data(camel::CAMeLData)
    try
        data_list = readdir(CAMEL_DATA)
        if camel.type === :light
            if length(data_list) > 2
                @info "Full CAMeLData already downloaded. To override, run delete!(CAMeLData) and then download again."
                return true
            else
                @info "Light CAMeLData already downloaded. To override, run delete!(CAMeLData) and then download again."
                return true
            end
        elseif camel.type === :full
            if length(data_list) < 3
                @info "Overriding light CAMeLData already downloaded, to download the full CAMeLData."
                return false
            else 
                return true
            end
        else
            error(string("Expecting :light or :full for CAMeLData, got ", camel.type, " instead."))
        end
    catch
        return false
    end
end

function Base.download(camel::CAMeLData, update_period::Int64=5)
    isdata = check_data(camel)

    if isdata
        return nothing
    else
        @info "downloading catalogue from camel_tools"
        HTTP.download(CATALOGUE, CAMEL_CATALOGUE, update_period=5);
        catalogue = JSON.parsefile(CAMEL_CATALOGUE);
        if camel.type === :light
            data = catalogue["downloads"]["light"]
        else
            data = catalogue["downloads"]["full"]
        end

        url = string(GOOGLE_DRIVE, "&id=", data["file_id"])
        filepath = joinpath(@__DIR__, "../..", "data.zip")
        
        @info "downloading camel data"
        downloaded_bytes = 0
        default_ckjar = HTTP.CookieRequest.default_cookiejar
        ckjar = copy(default_ckjar isa Array ? default_ckjar[Base.Threads.threadid()] : default_ckjar)
        HTTP.open("GET", url; cookies=true, cookiejar=ckjar) do stream
            ckj = ckjar["docs.google.com"]
            code = find_gcode(ckj)
            if code !== nothing
                url = string(GOOGLE_DRIVE, "&confirm=", code, "&id=", data["file_id"])
                HTTP.request("GET", url, response_stream=stream, update_period=5)
                Base.open(filepath, "w") do file
                    while(!eof(steam))
                        write(file, readavailable(stream))
                    end
                end
            else
                HTTP.download(url, filepath, response_stream=stream, update_period=5)
            end
        end

        @info "unzipping downloaded data"
        unzip(filepath, joinpath(@__DIR__, "../.."))
    end
end

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

function Base.delete!(::Type{CAMeLData})
    try
        rm(CAMEL_DATA, recursive=true)
        @info string("successfully deleted data at ", CAMEL_DATA)
    catch
        @info "no camel data yet"
    end

    try 
        rm(CAMEL_CATALOGUE)
        @info string("successfully deleted catalogue at ", CAMEL_CATALOGUE)
    catch
        @info "no camel catalogue yet"
    end
end

function locate(::Type{CAMeLData})
    return CAMEL_DATA
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