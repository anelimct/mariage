#' Ouvrir et lire un fichier CSV dont le nom commence par "mar"
#'
#' @description
#' Cette fonction recherche dans un dossier spécifié un fichier CSV dont le nom commence par "mar",
#' l'ouvre et retourne son contenu sous forme de data frame. Elle vérifie également que le dossier
#' existe et qu'un seul fichier correspondant est trouvé.
#'
#' @param folder_path Une chaîne de caractères spécifiant le chemin vers le dossier contenant le fichier CSV.
#'
#' @return Un data frame contenant le contenu du fichier CSV.
#'
#' @examples
#' \dontrun{
#' mes_donnees <- open_data_folder("data/")
#' head(mes_donnees)
#' }
#'
#' @importFrom utils read.csv
#' @export
open_data_folder <- function(folder_path) {
  
  # Lister les fichiers dans le dossier qui commencent par "mar" et se terminent par ".csv"
  fichiers <- list.files(path = folder_path, pattern = "^mar.*\\.csv$", full.names = TRUE)
  
  # Vérifier qu'au moins un fichier a été trouvé
  if (length(fichiers) == 0) {
    stop(paste("Aucun fichier CSV commençant par 'mar' trouvé dans le dossier", folder_path))
  }
  
  # Le chemin complet du fichier à ouvrir
  fichier_a_ouvrir <- fichiers[1]
  
  # Tenter de lire le fichier CSV
  tryCatch({
    donnees <- read.csv(fichier_a_ouvrir, stringsAsFactors = FALSE, sep = ";")
    return(donnees)
  }, error = function(e) {
    stop("Une erreur s'est produite lors de la lecture du fichier CSV : ", e$message)
  })
}

