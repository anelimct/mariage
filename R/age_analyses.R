#' Age of each gendre
#'
#' @description 
#' This function create a function to filter 
#'   
#'
#' @param data a dataframe
#'
#' @return *** 
#' 
#' @export
#'
age_diff <- function(data, year1, year2, ind1, ind2) {
  # Vérification des inputs
  if (!is.numeric(year1) || !is.numeric(year2)) {
    stop("Les années (year1 et year2) doivent être des valeurs numériques.")
  }
  
  # Calcul de la différence
  diff <- 0
  if (ind1 == "M" && ind2 == "M") {
    diff <- abs(year2 - year1) # Pour deux hommes
  } else if (ind1 == "F" && ind2 == "F") {
    diff <- abs(year1 - year2) # Pour deux femmes
  } else if (ind1 == "M" && ind2 == "F") {
    diff <- year2 - year1      # Homme avant femme
  } else if (ind1 == "F" && ind2 == "M") {
    diff <- year1 - year2      # Femme avant homme
  } else {
    stop("Les indicateurs (ind1 et ind2) doivent être 'M' ou 'F'.")
  }
  
  return(diff)
}


