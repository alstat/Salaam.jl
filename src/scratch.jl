using Salaam

data = CAMeLData(:light)
# data.type = :full

download(data)
delete!(CAMeLData)

using HTTP
url = "https://docs.google.com/uc?export=download&id=1wznZY1nXIwKan5rLbvQjukozNrF-P0j3"
url = "https://docs.google.com/uc?export=download&id=1819WzNAA8TYqk5ldHH8emajAeeqttBYj"
d = HTTP.download(url)
default_ckjar = HTTP.CookieRequest.default_cookiejar
ckjar = copy(default_ckjar isa Array ? default_ckjar[Base.Threads.threadid()] : default_ckjar)
ckjar
rq = HTTP.request("HEAD", url; cookies=true, cookiejar=ckjar)
function find_gcode(ckj)
    for cookie ∈ ckj
        if match(r"_warning_", cookie.name) !== nothing
            return cookie.value
        end
    end

    nothing
end

ckj = ckjar["docs.google.com"]
find_gcode(ckj)

url = "https://docs.google.com/uc?export=download&id=1wznZY1nXIwKan5rLbvQjukozNrF-P0j3"
HTTP.download(url)

using JSON
GOOGLE_DRIVE = "https://docs.google.com/uc?export=download"
CATALOGUE = "https://raw.githubusercontent.com/CAMeL-Lab/camel_tools/master/camel_tools/data/catalogue.json"

ENV["CAMEL_CATALOGUE"] = joinpath(@__DIR__, "../catalogue.json")
HTTP.download(CATALOGUE, ENV["CAMEL_CATALOGUE"], update_period=5);
catalogue = JSON.parsefile(ENV["CAMEL_CATALOGUE"]);
filepath = joinpath(@__DIR__, "..", "data.zip")
data = catalogue["downloads"]["light"]
default_ckjar = HTTP.CookieRequest.default_cookiejar
ckjar = copy(default_ckjar isa Array ? default_ckjar[Base.Threads.threadid()] : default_ckjar)
HTTP.open("GET", url; cookies=true, cookiejar=ckjar) do io
    ckj = ckjar["docs.google.com"]
    code = find_gcode(ckj)
    url = string(GOOGLE_DRIVE, "&confirm=", code, "&id=", data["file_id"])
    HTTP.download(url, filepath, response_stream=io)
end
using ZipFile
@info "unzipping downloaded data"
unzip(filepath, joinpath(@__DIR__, ".."))


function download1(camel::CAMeLData, path::Union{String,Nothing}=nothing)
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
    default_ckjar = HTTP.CookieRequest.default_cookiejar
    ckjar = copy(default_ckjar isa Array ? default_ckjar[Base.Threads.threadid()] : default_ckjar)
    HTTP.open("GET", url; cookies=true, cookiejar=ckjar) do io
        ckj = ckjar["docs.google.com"]
        code = find_gcode(ckj)
        url = string(GOOGLE_DRIVE, "&confirm=", code, "&id=", data["file_id"])
        HTTP.download(url, filepath, response_stream=io, update_period=5)
    end

    @info "unzipping downloaded data"
    if path isa Nothing
        unzip(filepath, joinpath(@__DIR__, "../.."))
    else
        unzip(filepath, path)
    end
end

data = CAMeLData(:light)
# data.type = :full

download1(data)
delete!(CAMeLData)

filepath

url