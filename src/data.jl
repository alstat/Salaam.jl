using PyCall

function google_drive_downloader()
    gdd = pyimport("google_drive_downloader.GoogleDriveDownloader")
    gdd.download_file_from_google_drive(file_id="12y9QZvoi7Vu2vUbg_CBE7J5gueUY-fPR",
                                    dest_path="~/.camel_tools/",
                                    unzip=True)
end

# function install_camel(full_data::Bool=false)
#     if full_data

#     else
#         @info "camel_data light is already installed."
#     end
# end