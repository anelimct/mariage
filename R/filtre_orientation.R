#' Filter by sexual orientation
#'
#' This function takes a data frame as input and
#' splits it into three groups based on the sexual orientation.
#' The groups are named "gay", "lesbian", and "hetero".
#' The function then returns the three groups as a list.
#'
#' @param data A data frame with columns \code{SEXE1} and \code{SEXE2}.
#' @return A list of two data frames, each containing the rows of the
#' input data frame that correspond to the specified orientation.
#' @export

orientation_gay <- function(data) {
  # Créer les subsets
  gay <- data|> 
    dplyr ::filter(SEXE1 == "M" & SEXE2 == "M")
  

  
return(gay)
}

orientation_lesbian <- function(data) {
  
  lesbian <- data|> 
    dplyr::filter(SEXE1 == "F" & SEXE2 == "F")
  
  
  
  return(lesbian)
}

orientation_hetero <- function(data) {
  
  hetero <- data|> 
    dplyr::filter((SEXE1 == "M" & SEXE2 == "F") | (SEXE1 == "F" & SEXE2 == "F"))
  
  
  
  return(lesbian)
}

