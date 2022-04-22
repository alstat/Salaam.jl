using Salaam
using HTTP
using JSON
using ZipFile

CATALOGUE = "https://raw.githubusercontent.com/CAMeL-Lab/camel-tools-data/main/catalogue-1.4.json";
ENV["CAMEL_CATALOGUE"] = joinpath(@__DIR__, "../catalogue.json");
HTTP.download(CATALOGUE, ENV["CAMEL_CATALOGUE"], update_period=5);
catalogue = JSON.parsefile(ENV["CAMEL_CATALOGUE"]);
keys(catalogue["packages"])

function unzip(file, exdir="")
    fileFullPath = isabspath(file) ?  file : joinpath(pwd(),file)
    basePath = dirname(fileFullPath)
    outPath = (exdir == "" ? basePath : (isabspath(exdir) ? exdir : joinpath(pwd(),exdir)))
    isdir(outPath) ? "" : mkdir(outPath)
    zarchive = ZipFile.Reader(fileFullPath)
    for f in zarchive.files
        fullFilePath = joinpath(outPath,f.name)
        if (endswith(f.name,"/") || endswith(f.name,"\\"))
            try
                mkdir(fullFilePath)
            catch
                rm(fullFilePath, recursive=true)
                mkdir(fullFilePath)
            end
        else
            write(fullFilePath, read(f))
        end
    end
    close(zarchive)
    @info "deleting zip file"
    rm(file)
end

ENV["CAMEL_MORPHOLOGY_EGY_R13"] = joinpath(@__DIR__, "../../db/morphology/morphology-db-egy-r13.zip");
ENV["CAMEL_MORPHOLOGY_MSA_R13"] = joinpath(@__DIR__, "../../db/morphology/morphology-db-msa-r13.zip");
ENV["CAMEL_MORPHOLOGY_GLF_01"] = joinpath(@__DIR__, "../../db/morphology/morphology-db-glf-01.zip");
ENV["CAMEL_DISAMBIG_MLE_CALIMA_EGY_R13"] = joinpath(@__DIR__, "../../db/disambig/disambig-mle-calima-egy-r13.zip");
ENV["CAMEL_DISAMBIG_MLE_CALIMA_MSA_R13"] = joinpath(@__DIR__, "../../db/disambig/disambig-mle-calima-msa-r13.zip");
ENV["CAMEL_DISAMBIG_BERT_UNFACTORED_EGY"] = joinpath(@__DIR__, "../../db/disambig/disambig-bert-unfactored-egy.zip");
ENV["CAMEL_DISAMBIG_BERT_UNFACTORED_MSA"] = joinpath(@__DIR__, "../../db/disambig/disambig-bert-unfactored-msa.zip");
ENV["CAMEL_DISAMBIG_BERT_UNFACTORED_GLF"] = joinpath(@__DIR__, "../../db/disambig/disambig-bert-unfactored-glf.zip");
ENV["CAMEL_DIALECTID_DEFAULT"] = joinpath(@__DIR__, "../../db/dialectid/dialectid-default.zip");
ENV["CAMEL_NER_ARABERT"] = joinpath(@__DIR__, "../../db/ner/ner-arabert.zip");
ENV["CAMEL_SENTIMENT_MBERT"] = joinpath(@__DIR__, "../../db/sentiment/sentiment-analysis-mbert.zip");
ENV["CAMEL_SENTIMENT_ARABERT"] = joinpath(@__DIR__, "../../db/sentiment/sentiment-analysis-arabert.zip");



catalogue["packages"]["disambig-bert-unfactored-glf"]["url"]

function create_data_folder()
    # create folder
    mkdir(joinpath(@__DIR__, "../../db"))
    mkdir(joinpath(@__DIR__, "../../db/morphology"))
    mkdir(joinpath(@__DIR__, "../../db/disambig"))
    mkdir(joinpath(@__DIR__, "../../db/dialectid"))
    mkdir(joinpath(@__DIR__, "../../db/ner"))
    mkdir(joinpath(@__DIR__, "../../db/sentiment"))
end

# download zip file
HTTP.download(catalogue["packages"]["morphology-db-egy-r13"]["url"], ENV["CAMEL_MORPHOLOGY_EGY_R13"])
HTTP.download(catalogue["packages"]["morphology-db-msa-r13"]["url"], ENV["CAMEL_MORPHOLOGY_MSA_R13"])
HTTP.download(catalogue["packages"]["morphology-db-glf-01"]["url"], ENV["CAMEL_MORPHOLOGY_GLF_01"])
HTTP.download(catalogue["packages"]["disambig-mle-calima-egy-r13"]["url"], ENV["CAMEL_DISAMBIG_MLE_CALIMA_EGY_R13"])
HTTP.download(catalogue["packages"]["disambig-mle-calima-msa-r13"]["url"], ENV["CAMEL_DISAMBIG_MLE_CALIMA_MSA_R13"])
HTTP.download(catalogue["packages"]["disambig-bert-unfactored-egy"]["url"], ENV["CAMEL_DISAMBIG_BERT_UNFACTORED_EGY"])
HTTP.download(catalogue["packages"]["disambig-bert-unfactored-msa"]["url"], ENV["CAMEL_DISAMBIG_BERT_UNFACTORED_MSA"])
HTTP.download(catalogue["packages"]["disambig-bert-unfactored-glf"]["url"], ENV["CAMEL_DISAMBIG_BERT_UNFACTORED_GLF"])
HTTP.download(catalogue["packages"]["dialectid-default"]["url"], ENV["CAMEL_DIALECTID_DEFAULT"])
HTTP.download(catalogue["packages"]["ner-arabert"]["url"], ENV["CAMEL_NER_ARABERT"])
HTTP.download(catalogue["packages"]["sentiment-analysis-mbert"]["url"], ENV["CAMEL_SENTIMENT_MBERT"])
HTTP.download(catalogue["packages"]["sentiment-analysis-arabert"]["url"], ENV["CAMEL_SENTIMENT_ARABERT"])


catalogue["packages"]["disambig-bert-unfactored-glf"]["url"]
# extract zip file
unzip(ENV["CAMEL_MORPHOLOGY_EGY_R13"])

# load db
db = parse(MorphologyDB, "morphology-db-egy-r13.db", :a);





keys(catalogue["packages"])
data = catalogue["components"]["DisambigMLE"]["datasets"]