using PyCall

println("Running build.jl for the Salaam package.")

# Change that to whatever packages you need.
const PACKAGES = ["camel-tools"]

# Use eventual proxy info
proxy_arg=String[]
if haskey(ENV, "http_proxy")
    push!(proxy_arg, "--proxy")
    push!(proxy_arg, ENV["http_proxy"])
end

# Import pip
try
    global pip
    @pyimport pip
catch
    # If it is not found, install it
    println("Pip not found on your sytstem. Downloading it.")
    get_pip = joinpath(dirname(@__FILE__), "get-pip.py")
    download("https://bootstrap.pypa.io/get-pip.py", get_pip)
    run(`$(PyCall.python) $(proxy_arg) $get_pip --user`)
end

println("Installing required python packages using pip")
run(`$(PyCall.python) $(proxy_arg) -m pip install --user --upgrade pip setuptools`)
run(`$(PyCall.python) $(proxy_arg) -m pip install --user $(PACKAGES)`)

println("Installing camel light data")
os = pyimport("os")
os.environ["CAMELTOOLS_DATA"] = joinpath(@__DIR__, "..", "data", "camel_tools")
os.system("export CAMELTOOLS_DATA")
os.system("camel_data light")