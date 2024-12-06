# Calculate the absolute age difference for same-sex couples
#' @description
#' Calculate the absolute age difference for same-sex couples in the given data.
#'
#' @param data A data frame with at least the columns \code{ANAIS1},
#' \code{ANAIS2}, \code{SEXE1}, and \code{SEXE2}.
#'
#' @return A named list with the absolute age differences, mean, median,
#' quantiles, and standard deviation.
#' @export
difference_age_absolu_homo <- function(data) {
  # Vérification des colonnes dans le DataFrame
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2")
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop(paste("Le DataFrame doit contenir les colonnes :",
    paste(required_cols, collapse = ", ")))
  }

  # Filtrer les couples homosexuels
  homo_mask <- (data$SEXE1 == "M" & data$SEXE2 == "M")
  | (data$SEXE1 == "F" & data$SEXE2 == "F")
  data_homo <- data[homo_mask, ]
  
  # Calculer la différence d'âge absolue
  data_homo$diff <- abs(data_homo$ANAIS2 - data_homo$ANAIS1)
  
  # Extraire les différences
  diff <- data_homo$diff
  
  # Calcul des statistiques
  moyenne <- mean(diff, na.rm = TRUE)
  mediane <- median(diff, na.rm = TRUE)
  quantiles <- quantile(diff, probs = c(0.25, 0.75), na.rm = TRUE)
  ecart_type <- sd(diff, na.rm = TRUE)
  
  # Liste des résultats
  stats <- list(
    differences = diff,
    moyenne = moyenne,
    mediane = mediane,
    quantiles = quantiles,
    ecart_type = ecart_type
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
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2")
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop(paste("Le DataFrame doit contenir les colonnes :",
    paste(required_cols, collapse = ", ")))
  }
  
  # Filtrer les couples hétérosexuels
  hetero_mask <- (data$SEXE1 == "M" & data$SEXE2 == "F")
  | (data$SEXE1 == "F" & data$SEXE2 == "M")
  data_hetero <- data[hetero_mask, ]
  
  # Calculer la différence d'âge absolue
  data_hetero$diff <- abs(data_hetero$ANAIS2 - data_hetero$ANAIS1)
  
  # Extraire les différences
  diff <- data_hetero$diff
  
  # Calcul des statistiques
  moyenne <- mean(diff, na.rm = TRUE)
  mediane <- median(diff, na.rm = TRUE)
  quantiles <- quantile(diff, probs = c(0.25, 0.75), na.rm = TRUE)
  ecart_type <- sd(diff, na.rm = TRUE)
  
  # Liste des résultats
  stats <- list(
    differences = diff,
    moyenne = moyenne,
    mediane = mediane,
    quantiles = quantiles,
    ecart_type = ecart_type
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
  required_cols <- c("ANAIS1", "ANAIS2", "SEXE1", "SEXE2")
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop(paste("Le DataFrame doit contenir les colonnes :",
    paste(required_cols, collapse = ", ")))
  }
  
  # Filtrer les couples hétérosexuels
  hetero_mask <- (data$SEXE1 == "M" & data$SEXE2 == "F")
  | (data$SEXE1 == "F" & data$SEXE2 == "M")
  data_hetero <- data[hetero_mask, ]
  
  # Calculer la différence d'âge relative
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
  
  # Liste des résultats
  stats <- list(
    differences = diff,
    moyenne = moyenne,
    mediane = mediane,
    quantiles = quantiles,
    ecart_type = ecart_type
  )
  
  return(stats)
}