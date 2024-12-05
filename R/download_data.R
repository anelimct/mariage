#' Download a file from a given URL and save it to a specified location.
#'
#' @param file_url The URL of the file to download.
#' @export
download_data <- function(file_url) {

    # Download the file from the given URL
    # and store it in the data directory.
    download.file(file_url, here::here("data", "data.zip"))
}

