#' Filter by sexual orientation
#'
#' This function takes a data frame as input and
#' splits it into three groups based on the sexual orientation.
#' The groups are named "gay", "lesbian", and "hetero".
#' The function then returns the three groups as a list.
#'
#' @param data A data frame with columns \code{SEXE1} and \code{SEXE2}.
#' @return A list of two data frames, each containing the rows of the
#' input data frame that correspond to the specified orientation.
#' @export
orientation <- function(data) {
  data |> 
    dplyr::group_by(SEXE1, SEXE2) |> 
    dplyr::group_split() |> 
    purrr::map(
      ~if (.x$SEXE1 == "H" & .x$SEXE2 == "H") "gay" else if (.x$SEXE1 == "F" & .x$SEXE2 == "F") "lesbian" else "hetero"
    ) |> 
    purrr::set_names(c("gay", "lesbian", "hetero"))
}
