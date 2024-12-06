#' Plot the absolute age difference violin plot for different types of marriages
#'
#' This function takes three vectors of absolute age differences as input and
#' plots a violin plot for each type of marriage (heterosexual, gay, and lesbian).
#'
#' @param liste_hetero A vector of absolute age differences for heterosexual couples.
#' @param liste_gay A vector of absolute age differences for gay couples.
#' @param liste_lesbien A vector of absolute age differences for lesbian couples.
#'
#' @return A ggplot violin plot.
#' @export

plot_violin_diff_type_de_mariage <- function(
    liste_hetero, 
    liste_gay, 
    liste_lesbien
) {
    # Vérifier que les entrées sont des vecteurs numériques
    if (!is.numeric(liste_hetero) | !is.numeric(liste_gay) | !is.numeric(liste_lesbien)) {
        stop("Toutes les listes doivent être des vecteurs numériques.")
    }
    
    # Créer un data frame combinant toutes les listes
    data <- data.frame(
        Valeur = c(liste_hetero, liste_gay, liste_lesbien),
        Type_de_Mariage = factor(
            rep(c("Hétérosexuel", "Gay", "Lesbienne"),
                times = c(length(liste_hetero), length(liste_gay), length(liste_lesbien)))
        )
    )
    
    # Créer le violin plot avec ggplot2
    p <- ggplot(data, aes(x = Type_de_Mariage, y = Valeur, fill = Type_de_Mariage)) +
        geom_violin(trim = FALSE, alpha = 0.7) +
        geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) +
        theme_minimal() +
        labs(
            y = "Différence d'âge en valeur absolue"
        ) +
        theme(
            text = element_text(size = 14),
            legend.position = "none",
            plot.title = element_text(hjust = 0.5, face = "bold")
        ) +
        scale_fill_brewer(palette = "Set2")
}
