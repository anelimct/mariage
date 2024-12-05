#' Age of each gendre
#'
#' @description 
#' This function create a function to filter 
#'   
#'
#' @param data a dataframe
#'
#' @return a list of numerical values 
#' 
#' @export
#'
#'
#'
age_diff <- function(data) {
  # Vérification des colonnes dans le DataFrame
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2")
  if (!all(required_cols %in% names(data))) {
    stop("Le DataFrame doit contenir les colonnes : ANAIS1, ANAIS2, SEXE1, SEXE2.")
  }
  
  diff <- c()
  
  # Boucle sur chaque ligne de données
  for (i in 1:nrow(data)) {
    if (data$SEXE1[i] == "M" && data$SEXE2[i] == "M") {
      diff <- c(diff, abs(data$ANAIS2[i] - data$ANAIS1[i]))  # Deux hommes
    } else if (data$SEXE1[i] == "F" && data$SEXE2[i] == "F") {
      diff <- c(diff, abs(data$ANAIS1[i] - data$ANAIS2[i]))  # Deux femmes
    } else if (data$SEXE1[i] == "M" && data$SEXE2[i] == "F") {
      diff <- c(diff, data$ANAIS2[i] - data$ANAIS1[i])       # Homme avant femme
    } else if (data$SEXE1[i] == "F" && data$SEXE2[i] == "M") {
      diff <- c(diff, data$ANAIS1[i] - data$ANAIS2[i])       # Femme avant homme
    } else {
      diff <- c(diff, NA)  # Valeur manquante si les sexes ne sont pas M/F
    }
  }
  
  # Calcul des statistiques
  stats <- list(
    differences = diff,
    moyenne = mean(diff, na.rm = TRUE),
    mediane = median(diff, na.rm = TRUE),
    quantiles = quantile(diff, probs = c(0.25, 0.75), na.rm = TRUE),
    ecart_type = sd(diff, na.rm = TRUE)
  )
  
  return(stats)
}



