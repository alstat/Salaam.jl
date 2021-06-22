function camel_data(full_data::Bool=false)
    if full_data
        os = pyimport("os")
        os.system("camel_data full")
    else
        @info "camel_data light is already installed."
    end
end