using Downloads
using HTTP
using JSON
using ZipFile

mutable struct CAMeLData
    type::Symbol
end
const GOOGLE_DRIVE = "https://docs.google.com/uc?export=download"
const CATALOGUE = "https://raw.githubusercontent.com/CAMeL-Lab/camel_tools/master/camel_tools/data/catalogue.json"

data = CAMeLData(:light)
download(data)
# Downloads.download

# sqlite
using SQLite
db = SQLite.DB(joinpath(ENV["CAMEL_DATA"], "data", "morphology_db", "calima-egy-r13", "morphology.db"))
db

SQLite.tables(db)
DBInterface.execute(db, ".help")

dict2 = Dict();
dicttxt = ""
open("src/catalogue.json", "r") do f
    global dict2
    global dicttxt
    dicttxt = string(f)  # file information to string
end
JSON.parse(string(readlines("src/catalogue.json")))
dict2=JSON.parse(dicttxt)  # parse and transform data
# https://docs.google.com/uc?export=download&id=1819WzNAA8TYqk5ldHH8emajAeeqttBYj


JSON.parsefile("src/catalogue.json")