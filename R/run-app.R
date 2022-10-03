#' Load Shiny Application from inst/app directory
#'
#'
#' @return
#' A Shiny App embedded in the package
#'
#
#' @importFrom shiny runApp
#' @export
#'
run_app <- function() {
  app_dir <- system.file("app", package = "wildlifestrikes")
  runApp(app_dir, display.mode = "normal")
}
