hist_mois_mariage <- function(data) {
  # Vérifier si la colonne 'MMAR' existe
  if (!"MMAR" %in% colnames(data)) {
    stop("La colonne 'MMAR' est absente dans les données.")
  }
  
  # Compter le nombre de mariages par mois
  mois_counts <- data |>
    dplyr::group_by(MMAR) |>
    dplyr::summarise(NombreMariages = dplyr::n()) |>
    dplyr::arrange(MMAR)
  
  # Tracer le graphique
  ggplot(mois_counts, aes(x = factor(MMAR, levels = 1:12), y = NombreMariages)) +
    geom_bar(stat = "identity", fill = "skyblue") +
    labs(
      title = "Nombre de mariages par mois",
      x = "Mois",
      y = "Nombre de mariages"
    ) +
    scale_x_discrete(labels = c("Janvier", "Février", "Mars", "Avril", "Mai", "Juin", 
                                "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre")) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

