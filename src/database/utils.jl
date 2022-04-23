# Base.unzip
function unzip(file, exdir="")
    @info "Unzipping file"
    fileFullPath = isabspath(file) ?  file : joinpath(pwd(),file)
    basePath = dirname(fileFullPath)
    outPath = (exdir == "" ? basePath : (isabspath(exdir) ? exdir : joinpath(pwd(),exdir)))
    isdir(outPath) ? "" : mkdir(outPath)
    zarchive = ZipFile.Reader(fileFullPath)
    for f in zarchive.files
        fullFilePath = joinpath(outPath,f.name)
        @info "Zip file path " * fullFilePath
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
    @info "Deleting zip file"
    rm(file)
end