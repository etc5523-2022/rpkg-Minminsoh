#' Histogram for repair cost for the particular airline in the year
#'
#' @description This function builds the histogram which shows the distribution of repair cost incurred for the selected airline from 1991 to 2018 due to wildlife strikes, where data is obtained from the `wildlife_strikes` dataset. This function will be used in the Shiny App.
#'
#' @param input_operator Name of the airlines in the dataset, namely `AMERICAN AIRLINES`, `UNITED AIRLINES`, `SOUTHWEST AIRLINES` and `DELTA AIR LINES`
#' @param input_bins Number of the bins for histogram
#'
#' @import scales
#' @return A histogram plot which displays the distribution of with selected number of bins.
#' @export
#'
#' @examples
#' histPlot("AMERICAN AIRLINES", 10)
#' histPlot("UNITED AIRLINES", 5)



histPlot <- function(input_operator, input_bins){

  x <- wildlife_strikes %>%
    filter(operator == input_operator)

  ggplot2::ggplot(x, aes(cost_repairs_infl_adj)) +
    ggplot2::geom_histogram(bins = input_bins, fill = "#6295ED") +
    ggplot2::theme_bw(base_size = 14) +
    labs(x = "Repair Costs", y = "Count")+
    ggplot2::scale_x_continuous(labels = scales::comma)+
    theme_plot("hist")

}
