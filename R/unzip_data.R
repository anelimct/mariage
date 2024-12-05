#' Unzip the downloaded file
#'
#' @description
#' This function unzips the downloaded marital status data from INSEE.
#' The file is unzipped in the \code{data} folder.
#'
#' @return Nothing
#' @export
unzip_data <- function() {
    # Unzip the file
    unzip(zipfile = dest_file, exdir = here::here("data", "data.csv"))
}
