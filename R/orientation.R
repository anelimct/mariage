orientation <- function(data) {
  # Créer les subsets
  gay <- data|> 
    dplyr ::filter(SEXE1 == "M" & SEXE2 == "M")
  
  lesbian <- data|> 
    dplyr::filter(SEXE1 == "F" & SEXE2 == "F")
  
  hetero <- data|> 
    dplyr::filter((SEXE1 == "M" & SEXE2 == "F") | (SEXE1 == "F" & SEXE2 == "F"))
  
  # Créer le chemin cible pour les fichiers CSV
  output_dir <- here::here("outputs", "subset")
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)  # Crée le dossier s'il n'existe pas
  }
  
  # Chemins pour les fichiers
  file_paths <- list(
    gay = file.path(output_dir, "gay.csv"),
    lesbian = file.path(output_dir, "lesbian.csv"),
    hetero = file.path(output_dir, "hetero.csv")
  )
  
  # Écrire les fichiers CSV
  write.csv(gay, file = file_paths$gay, row.names = FALSE)
  write.csv(lesbian, file = file_paths$lesbian, row.names = FALSE)
  write.csv(hetero, file = file_paths$hetero, row.names = FALSE)
  
  # Retourner les chemins des fichiers
  return(file_paths)
}
