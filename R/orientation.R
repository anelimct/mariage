orientation <- function(data) {
  gay <- data |> 
    dplyr::filter(SEXE1 == "H" & SEXE2 == "H")
  
  lesbian <- data |> 
    dplyr::filter(SEXE1 == "F" & SEXE2 == "F")
  
  hetero <- data |>
    dplyr::filter((SEXE1 == "H" & SEXE2 == "F") | (SEXE1 == "F" & SEXE2 == "H"))
  
  list(gay = gay, lesbian = lesbian, hetero = hetero)
}