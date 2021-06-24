function install_camel(full_data::Bool=false, data_directory::Union{Nothing,String}=nothing)
    if full_data
        @info "installing camel-tools"
        run(`pip3 install camel-tools`)
        if data_directory isa Nothing
            @info "downloading camel_data"
            run(`camel_data full`)
        else
            @info "downloading camel_data to " * data_directory
            ENV["CAMELTOOLS_DATA"] = data_directory
            run(`sh -c export '|' camel_data full`)
            # run(`camel_data full`)
        end
    else
        @info "installing camel-tools"
        run(`pip3 install camel-tools`)
        if data_directory isa Nothing
            @info "downloading camel_data"
            run(`camel_data light`)
        else
            @info "downloading camel_data to " * data_directory
            ENV["CAMELTOOLS_DATA"] = data_directory
            run(`sh -c export '|' camel_data light`)
            # run(`camel_data light`)
        end
    end
end