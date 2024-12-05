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

