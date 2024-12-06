#' count marriages per region 
#'
#' @description 
#' This function returns the number of weddings in 2021, in metropolitan France.
#'   
#' @param data a data frame
#'
#' @return A tibble: 101 × 2
#' 
#' @export
#'


wed_reg <- function(data) {
  countbyreg <- data |>
    dplyr::mutate(department = as.factor(DEPMAR))|>
    dplyr::group_by(DEPMAR)|>
    dplyr::summarise(count = dplyr::n())
} 


#' Plot marriages per region 
#'
#' @description 
#' This function returns the plot of the number of weddings in 2021 per department, in metropolitan France.
#'   
#' @param data a data frame
#'
#' @return A plot containing a map
#' 
#' @export
#'
#'


open_deps <- function(data) {
  # Spécifiez le chemin relatif vers votre fichier .geojson
  geojson_file <- here::here("data/departments/departements.geojson")
  
  # Lire le fichier GeoJSON
  france_departments <- sf::st_read(geojson_file)
  
  france_with_data <- france_departments |> 
    dplyr::left_join(data, by = c("code" = "DEPMAR")) 
  
  ggplot2::ggplot(france_with_data) +
    ggplot2::geom_sf(ggplot2::aes(fill = count), color = "black") +  
    ggplot2::scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "grey") +
    ggplot2::theme_minimal() +
    ggplot2::labs(
      title = "Nombre de mariages en France métropolitaine en 2021",
      fill = "Nombre de mariages en 2021"
    )
  
}

#' count marriages per region 
#'
#' @description 
#' This function returns the number of weddings in 2021, in metropolitan France.
#'   
#' @param data a data frame
#'
#' @return A tibble: 101 × 2
#' 
#' @export
#'


wed_reg_prop <- function(data_subset, data) {
  
  countbyreg <- data_subset |>
    dplyr::mutate(department = as.factor(DEPMAR))|>
    dplyr::group_by(DEPMAR)|>
    dplyr::summarise(count = dplyr::n()/dplyr::n(data))
  
} 


#' Plot age difference per region 
#'
#' @description 
#' This function returns the plot of the age difference per region
#' 
#' @param data a data frame
#'
#' @return A plot containing a map
#' 
#' @export
#'
#'


open_deps2 <- function(data) {
  
  data_df <- as.data.frame(data)
  
  # Spécifiez le chemin relatif vers votre fichier .geojson
  geojson_file <- here::here("data/departments/departements.geojson")
  
  # Lire le fichier GeoJSON
  france_departments <- sf::st_read(geojson_file)
  
  france_with_data <- france_departments |> 
    dplyr::left_join(data_df, by = c("code" = "departements")) 
  
  ggplot2::ggplot(france_with_data) +
    ggplot2::geom_sf(ggplot2::aes(fill = count), color = "black") +  
    ggplot2::scale_fill_gradient(low = "pink", high = "darkred", na.value = "grey") +
    ggplot2::theme_minimal() +
    ggplot2::labs(
      title = "Nombre de mariages en France métropolitaine en 2021",
      fill = "Nombre de mariages en 2021"
    )
  
}

