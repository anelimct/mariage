plot_couples <- function(data) {
  # Vérifier que les colonnes nécessaires existent
  if (!all(c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2") %in% colnames(data))) {
    stop("Le DataFrame doit contenir les colonnes ANAIS1, ANAIS2, SEXE1, et SEXE2.")
  }
  
  # Créer un DataFrame réorganisé pour les couples hétéro
  data_plot <- data |>
    dplyr::filter(SEXE1 != SEXE2) |>  # Sélectionner les couples hétéro
    dplyr::mutate(
      an_femme = ifelse(SEXE1 == "F", ANAIS1, ANAIS2),  # Année de naissance des femmes
      an_homme = ifelse(SEXE1 == "M", ANAIS1, ANAIS2)   # Année de naissance des hommes
    )
  
  # Tracer le graphique avec ggplot2
  library(ggplot2)
  
  ggplot(data_plot, aes(x = an_femme, y = an_homme)) +
    geom_point(alpha = 0.1, color = "blue") +
    labs(
      title = "Années de naissance des couples hétéro",
      x = "Année de naissance des femmes",
      y = "Année de naissance des hommes"
    ) +
    theme_minimal()
}

