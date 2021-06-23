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