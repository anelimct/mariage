
#' Retrieve URL for INSEE statistical data
#'
#' @description
#' This function returns the URL for downloading the INSEE statistical data
#' for marital status in 2021.
#'
#' @return A character string containing the URL to the zip file.
url_data <- function() {
    # URL for the INSEE marital status data for the year 2021
    return("https://www.insee.fr/fr/statistiques/fichier/7453878/etatcivil2021_mar2021_csv.zip")
}
