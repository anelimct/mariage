#' Open and read a CSV file
#'
#' @description
#' This function opens and reads a CSV file from a specified path.
#' It checks if the file exists and handles any errors that occur during reading.
#'
#' @param path A character string specifying the path to the CSV file.
#' 
#' @return A data frame containing the contents of the CSV file.
#' 
#' @examples
#' \dontrun{
#' open_data("data/myfile.csv")
#' }
open_data <- function(path) {
  
  # Check if the file exists
  if (!file.exists(path)) {
    stop(paste("Le fichier", path, "n'existe pas. Veuillez vérifier le chemin."))
  }
  
  # Attempt to read the CSV file
  tryCatch({
    donnees <- read.csv(path, stringsAsFactors = FALSE)
    return(donnees)
  }, error = function(e) {
    stop("Une erreur s'est produite lors de la lecture du fichier CSV : ", e$message)
  })
}
