#' count marriages - INSEE 2021 French metropolitan wedding data
#'
#' @description 
#' This function returns the number of weddings in 2021, in metropolitan France.
#'   
#' **Note:** the function [download_data()] and the function [open_data()] must have been run first.
#'
#' @param data a data frame
#'
#' @return a numerical value
#' 
#' @export
#'


count_marriages <- function(data) {
  n(distinct(data))
} 


#' Dimensions - INSEE 2021 French metropolitan wedding data
#'
#' @description 
#' This function returns the mean age of brides and grooms in 2021, in metropolitan France.
#'   
#'
#' @param data a dataframe
#'
#' @return a list of two values c("nrows", "ncols")
#' 
#' @export


data_dim <- function(data) {
  dim(data)
}



#' Variable names - INSEE 2021 French metropolitan wedding data
#'
#' @description 
#' This function returns the variable names considered in the analysis.
#'   
#'
#' @param data a dataframe
#'
#' @return a list of strings containing variables 
#' 
#' @export
#'


data_names <- function(data) {
  names(data)
}

