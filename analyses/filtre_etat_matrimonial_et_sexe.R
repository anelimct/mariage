#' Filtrer un tableau par état matrimonial et sexe
#'
#' @description
#' Cette fonction filtre un tableau de données en fonction de l'état matrimonial 
#' et du sexe spécifiés. Elle vérifie d'abord que les colonnes nécessaires existent 
#' dans le tableau, puis applique les conditions de filtrage.
#'
#' @param etat_marital Une chaîne de caractères représentant l'état matrimonial à filtrer.
#' @param sexe Une chaîne de caractères représentant le sexe à filtrer.
#' @param tableau Un data frame contenant les données à filtrer, avec les colonnes "ETAMAT1", 
#' "SEXE1", "ETAMAT2", et "SEXE2".
#'
#' @return Un data frame contenant les lignes qui correspondent aux conditions spécifiées.
#' 
#' @examples
#' \dontrun{
#' resultat_filtre <- filtrer_tableau("Marié", "F", mon_tableau)
#' }
filtre_etat_matrimonial_et_sexe <- function(etat_marital, sexe, tableau) {
  # Vérifier que les colonnes nécessaires existent dans le tableau
  colonnes_requises <- c("ETAMAT1", "SEXE1", "ETAMAT2", "SEXE2")
  if(!all(colonnes_requises %in% names(tableau))) {
    stop("Le tableau doit contenir les colonnes ETAMAT1, SEXE1, ETAMAT2 et SEXE2.")
  }
  
  # Filtrer les lignes selon les conditions spécifiées
  resultat <- subset(tableau, 
                     (ETAMAT1 == etat_marital & SEXE1 == sexe) |
                     (ETAMAT2 == etat_marital & SEXE2 == sexe))
  
  # Retourner le résultat filtré
  return(resultat)
}
