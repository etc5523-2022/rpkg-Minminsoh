#' Return the number of attacks incurred by selected airline in the selected year
#'
#' @description This function calculates the number of wildlife attacks incurred by selected airline in the selected year. This function is also being used in Shiny App.
#'
#' @param input_operator Name of the airlines in the dataset, namely `AMERICAN AIRLINES`, `UNITED AIRLINES`, `SOUTHWEST AIRLINES` and `DELTA AIR LINES`.
#' @param input_year Year in the dataset, ranging from 1991 to 2018
#'
#'
#' @return Characters
#' @export
#'
#' @examples
#' cases_airline("AMERICAN AIRLINES", 2018)
#' cases_airline("UNITED AIRLINES", 2018)
#'
#'
#' @import dplyr


cases_airline <- function(input_operator, input_year) {

  # calculate number of attacks incurred by selected airline in the selected year

  a <- wildlife_strikes %>%
   filter(operator == input_operator) %>%
   filter(incident_year == input_year) %>%
   count()

 b <- input_operator

 c <- input_year

 output <- paste0(b, " incurred ", a, "  wildlife strikes to the aircrafts in ", c, ".")

 return(output)

}
