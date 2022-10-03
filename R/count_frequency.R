#' Calculate frequency of occurrence
#'
#' @description These functions calculate the frequency of the observations for a particular variable in the `wildlife_strikes` dataset.
#' It is helpful in identifying which condition in the variable is associated with higher occurence of wildlife strikes to aircrafts.
#' Run `count_frequency(var)` to obtain the frequency of observations in a tibble format. Run `count_frequency_plot(var)` which shows the number of cases in each group in a bar plot format.
#' This function is also being used in Shiny App.
#'
#' @param var name of variable
#'
#'
#' @return A dataframe with observations and frequency, similar to the function `df %>% summarise (n = n())` when `count_frequency(var)` is run or bar plot when `count_frequency_plot(var)` is run.
#' @export
#'
#' @examples
#' count_frequency(sky)
#' count_frequency(phase_of_flt)
#' count_frequency_plot(sky)
#' count_frequency_plot(phase_of_flt)
#'
#' @import dplyr

count_frequency <- function(var){


  # calculate frequency---
  output<- wildlife_strikes %>%
    group_by({{var}})%>%
    count()

  return(output)

}

#' @rdname count_frequency
#'
#'
#'
#' @export

count_frequency_plot <- function(var){

  # calculate frequency---
  output <- wildlife_strikes %>%
    group_by({{var}})%>%
    count()

  # plot frequency---
  output %>%
    ggplot(aes(x = {{var}}, n))+
    geom_col() +
    geom_text(aes(label = paste(n)),
              position= position_stack(vjust = 0.5),
              color = "white",size = 5)+
    labs(y = "Number of Cases")+
    theme_plot("bar")

}



