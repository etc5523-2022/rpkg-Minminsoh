#' Provides the Dataset for reported wildlife strikes from 1991 to 2018 in the U.S, reported by The New York Times.
#'
#' @source
#' [tidytuesday GitHub](https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-23/wildlife_impacts.csv)
#'
#' @format a tibble with 225 observations and 21 variables:
#'
#' - **incident_date**: Date of incident
#' - **abb**: Abbreviation of U.S. state
#' - **airport_id**: Airport ID
#' - **airport**: Airport Name
#' - **operator**: Operator/Airline
#' - **atype**: Airline type
#' - **type_eng**: Engine type
#' - **species_id**: Species ID
#' - **species**: Species
#' - **damage**: Damage: N None M Minor, M Uncertain, S Substantial, D Destroyed
#' - **num_engs**: Number of engines
#' - **incident_month**: Incident month
#' - **incident_year**: Incident year
#' - **time_of_day**: Incident time
#' - **time**: Incident time
#' - **height**: Plane height at impact
#' - **speed**: Plane speed at impact
#' - **phase_of_flt**: Phase of flight at impact
#' - **sky**: Sky condition
#' - **precip**: Precipitation
#' - **cost_repairs_infl_adj**: Cost of repairs adjusted for inflation
#'
#'
"wildlife_strikes"
