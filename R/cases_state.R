#' Compute number of cases of wildlife strike reported in each state
#'
#' @description These functions calculate the number of wildlife strikes reported in each state from 1991 to 2018 in the `wildlife_strikes` dataset.
#' Run `cases_state(input_state)` to obtain the observations for the selected states in a tibble format. Run `cases_statemap(input_state)` which creates a choropleth map showing the number of cases in the selected states. This function is also being used in Shiny App.
#'
#' @param input_state Name of the states in the dataset, such as california, alabama, flordia and georgia.
#'
#' @return A choropleth map showing the reported number of wildlife strikes per state when `cases_statemap(input_state)` is run or a dataframe  when `cases_state(input_state)` is run.
#'
#' @examples
#' cases_state(c("california", "alabama"))
#' cases_state(c("arizona", "california", "florida", "colorado", "texas"))
#' cases_statemap(c("california", "alabama"))
#' cases_statemap(c("arizona", "california", "florida", "colorado", "texas"))
#'
#' @import dplyr
#' @export

cases_statemap <- function(input_state) {

  wildlife_strikes <- wildlifestrikes::wildlife_strikes

  #calculate number of cases of wildlife strike reported in each state
  wildlife_state <- wildlife_strikes %>%
   group_by(abb) %>%
   filter(!abb == "N/A") %>%
   count()

  #join wildlife_strikes data with USmap data
  wildlife_state <- inner_join(wildlife_state, USmap, by = "abb")

  #compute centroid
  centroids <- USmap %>%
   group_by(abb) %>%
   summarize(
     centroid_long = mean(long),
     centroid_lat = mean(lat)
   )

 centroids <- left_join(wildlife_state, centroids, by = "abb") %>%
  select(!group)

 # extract states
 states <- unique(wildlife_state$region)

 df <- filter(wildlife_state, region %in% input_state)

  ggplot2::ggplot(wildlife_state, aes(long, lat, group = region)) +
    ggplot2::geom_polygon(data = USmap, aes(long, lat, group = region), fill = "grey", color = "white") +
    ggplot2::geom_polygon(data = df, aes(long, lat, group = region, fill = n), color = "white") +
    ggplot2::geom_text(data = centroids, aes(x = centroid_long, y = centroid_lat, group = region, label = paste(abb, n, sep = "\n")), size = 2.5) +
    labs(fill = "Count of wildlife strike") +
    ggplot2::ggtitle("Count of wildlife by location from 1991 to 2018") +
    ggplot2::scale_fill_distiller(palette = "Spectral") +
    theme_plot("map")
}

#' @rdname cases_statemap
#'
#' @export
#'


cases_state <- function(input_state) {

#calculate number of cases of wildlife strike reported in each state
wildlife_state <- wildlife_strikes %>%
  group_by(abb) %>%
  filter(!abb == "N/A") %>%
  count()

#join wildlife_strikes data with USmap data to extract the full name of the state
wildlife_state <- inner_join(wildlife_state, USmap, by = "abb") %>%
  select(abb:region) %>%
  filter(region %in% input_state) %>%
  rename(
    `Abbreviation of State` = abb,
    `Number of cases` = n,
    `Name of state` = region
  ) %>%
  distinct()

return(wildlife_state)

}


