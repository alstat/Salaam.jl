function install_camel(full_data::Bool=false)
    if full_data
        run(`pip3 install camel-tools`)
        run(`camel_data full`)
    else
        run(`pip3 install camel-tools`)
        run(`camel_data light`)
    end
end