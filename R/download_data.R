#' Download a file from a given URL and save it to a specified location.
#'
#' @param file_url The URL of the file to download.
#' @return The path to the downloaded file.
#' @export
download_data <- function(file_url) {
    # Download the file from the given URL
    # and store it in the data directory.
    dest_file <- here::here("data", "data.zip")

    # Download the file
    download.file(file_url, dest_file)

    return dest_file
}

