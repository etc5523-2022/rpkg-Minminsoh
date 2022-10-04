#' Create custom theme for plots
#'
#' @description Create custom theme for bar charts, maps and histogram.
#'
#' @param plot_type The type of plot - "map" or "bar"
#'
#' @return Custom theme that complements the aesthetics of the Shiny App
#'
#' @import ggplot2
#'
#' @export

theme_plot <- function(plot_type) {
  if(plot_type == "map") {

    ggplot2::theme_void() +
  ggplot2::theme(
    legend.position = "top",
    plot.background = element_rect(fill = "#f5f5f5", color = NA),
    panel.background = element_rect(fill = "#f5f5f5", color = NA),
    legend.background = element_rect(fill = "#f5f5f5", color = NA),
    plot.title = element_text(size = 12, hjust = 0.5, color = "#4e4d47")

  )
  } else if (plot_type == "bar") {

    ggplot2::theme(
  panel.background = element_rect(fill = "white", colour = "grey50"),
  axis.line = element_line(size = 3, colour = "grey80"),
  axis.text = element_text(colour = "#6295ED")
)

  } else {

    ggplot2::theme(
  panel.background = element_rect(fill = "white", colour = "grey50"),
  axis.line = element_line(size = 3, colour = "grey80"),
  axis.text = element_text(colour = "#6295ED")
)

  }
}
