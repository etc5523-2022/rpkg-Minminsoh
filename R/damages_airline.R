#' Computes the number of attacks incurred by selected airline in the selected year  by damages level
#'
#' @description This function computes the number of wildlife attacks incurred by airlines by damages level. This function is also being used in Shiny App.
#'
#' @param input_operator Name of the airlines in the dataset, namely `AMERICAN AIRLINES`, `UNITED AIRLINES`, `SOUTHWEST AIRLINES` and `DELTA AIR LINES`
#' @param input_year Year in the dataset, ranging from 1990 to 2018
#'
#'
#' @return A dataframe.
#' @export
#'
#' @examples
#' damages_airline("AMERICAN AIRLINES", 2011)
#' damages_airline("UNITED AIRLINES", 2011)
#'
#' @import dplyr

damages_airline <- function(input_operator, input_year) {


  #Calculate attacks by damage levels

  damage <- wildlife_strikes %>%
  mutate(damage = factor(damage,
    levels = c("M", "M?", "N", "S"),
    labels = c("Minor", "Uncertain", "None", "Substantial")
  )) %>%
  group_by(operator, damage, incident_year) %>%
  count()

  output <- damage %>%
  filter(
    operator == input_operator,
    incident_year == input_year
  )

return(output)

}



