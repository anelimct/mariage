#' Calculate the absolute age difference for same-sex couples
#' in the given data.
#'
#' @param data A data frame with at least the columns \code{ANAIS1},
#' \code{ANAIS2}, \code{SEXE1}, and \code{SEXE2}.
#'
#' @return A named list with the absolute age differences, mean, median,
#' quantiles, and standard deviation.
#' @export
difference_age_absolu_gay <- function(data) {
  # Vérification des colonnes dans le DataFrame
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2", "DEPMAR")
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop(paste("Le DataFrame doit contenir les colonnes :",
    paste(required_cols, collapse = ", ")))
  }

  # Calculer la différence d'âge absolue
  data_gay <- data |>
    dplyr::filter(SEXE1 == "M" & SEXE2 == "M")
  data_gay$diff <- abs(data_gay$ANAIS2 - data_gay$ANAIS1)

  # Extraire les différences
  diff <- data_gay$diff

  # Calcul des statistiques
  moyenne <- mean(diff, na.rm = TRUE)
  mediane <- median(diff, na.rm = TRUE)
  quantiles <- quantile(diff, probs = c(0.25, 0.75), na.rm = TRUE)
  ecart_type <- sd(diff, na.rm = TRUE)
  
  # Ajout des departements
  deps <- data$DEPMAR

  # Liste des résultats
  stats <- list(
    differences = diff,
    moyenne = moyenne,
    mediane = mediane,
    quantiles = quantiles,
    ecart_type = ecart_type, 
    departements = deps
  )

  return(stats)
}


#' Calculate the absolute age difference for same-sex couples
#' in the given data.
#'
#' @param data A data frame with at least the columns \code{ANAIS1},
#' \code{ANAIS2}, \code{SEXE1}, and \code{SEXE2}.
#'
#' @return A named list with the absolute age differences, mean, median,
#' quantiles, and standard deviation.
#' @export
difference_age_absolu_lesbien <- function(data) {
  # Vérification des colonnes dans le DataFrame
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2", "DEPMAR")
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop(paste("Le DataFrame doit contenir les colonnes :",
    paste(required_cols, collapse = ", ")))
  }

  # Calculer la différence d'âge absolue
  data_lesbien <- data |>
    dplyr::filter(SEXE1 == "F" & SEXE2 == "F")
  data_lesbien$diff <- abs(data_lesbien$ANAIS2 - data_lesbien$ANAIS1)

  # Extraire les différences
  diff <- data_lesbien$diff

  # Calcul des statistiques
  moyenne <- mean(diff, na.rm = TRUE)
  mediane <- median(diff, na.rm = TRUE)
  quantiles <- quantile(diff, probs = c(0.25, 0.75), na.rm = TRUE)
  ecart_type <- sd(diff, na.rm = TRUE)
  
  # Ajout des departements
  deps <- data$DEPMAR
  
  # Liste des résultats
  stats <- list(
    differences = diff,
    moyenne = moyenne,
    mediane = mediane,
    quantiles = quantiles,
    ecart_type = ecart_type, 
    departements = deps
  )

  return(stats)
}

# Calculate the absolute age difference for opposite-sex couples
#' @description
#' Calculate the absolute age difference for opposite-sex couples
#' in the given data.
#'
#' @param data A data frame with at least the columns \code{ANAIS1},
#' \code{ANAIS2}, \code{SEXE1}, and \code{SEXE2}.
#'
#' @return A named list with the absolute age differences, mean, median,
#' quantiles, and standard deviation.
#' @export
difference_age_absolu_hetero <- function(data) {
  # Vérification des colonnes dans le DataFrame
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2", "DEPMAR")
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop(paste("Le DataFrame doit contenir les colonnes :",
    paste(required_cols, collapse = ", ")))
  }

  # Calculer la différence d'âge absolue
  data_hetero <- data |>
    dplyr::filter(SEXE1 != SEXE2)
  data_hetero$diff <- abs(data_hetero$ANAIS2 - data_hetero$ANAIS1)

  # Extraire les différences
  diff <- data_hetero$diff

  # Calcul des statistiques
  moyenne <- mean(diff, na.rm = TRUE)
  mediane <- median(diff, na.rm = TRUE)
  quantiles <- quantile(diff, probs = c(0.25, 0.75), na.rm = TRUE)
  ecart_type <- sd(diff, na.rm = TRUE)
  
  # Ajout des departements
  deps <- data$DEPMAR
  
  # Liste des résultats
  stats <- list(
    differences = diff,
    moyenne = moyenne,
    mediane = mediane,
    quantiles = quantiles,
    ecart_type = ecart_type, 
    departements = deps
  )

  return(stats)
}

# Calculate the relative age difference for opposite-sex couples
#' @description
#' Calculate the relative age difference for opposite-sex couples
#' in the given data.
#'
#' @param data A data frame with at least the columns \code{ANAIS1},
#' \code{ANAIS2}, \code{SEXE1}, and \code{SEXE2}.
#'
#' @return A named list with the relative age differences, mean, median,
#' quantiles, and standard deviation.
#' @export
difference_age_relatif_hetero <- function(data) {
  # Vérification des colonnes dans le DataFrame
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2", "DEPMAR")
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop(paste("Le DataFrame doit contenir les colonnes :",
    paste(required_cols, collapse = ", ")))
  }

  # Calculer la différence d'âge relative
  data_hetero <- data |>
    dplyr::filter(SEXE1 != SEXE2)
  data_hetero$diff <- ifelse(
    data_hetero$SEXE1 == "M" & data_hetero$SEXE2 == "F",
    data_hetero$ANAIS2 - data_hetero$ANAIS1,
    ifelse(data_hetero$SEXE1 == "F" & data_hetero$SEXE2 == "M",
           data_hetero$ANAIS1 - data_hetero$ANAIS2,
           NA_real_)
  )

  # Extraire les différences
  diff <- data_hetero$diff

  # Calcul des statistiques
  moyenne <- mean(diff, na.rm = TRUE)
  mediane <- median(diff, na.rm = TRUE)
  quantiles <- quantile(diff, probs = c(0.25, 0.75), na.rm = TRUE)
  ecart_type <- sd(diff, na.rm = TRUE)
  
  # Ajout des departements
  deps <- data$DEPMAR
  
  # Liste des résultats
  stats <- list(
    differences = diff,
    moyenne = moyenne,
    mediane = mediane,
    quantiles = quantiles,
    ecart_type = ecart_type, 
    departements = deps
  )

  return(stats)
}
