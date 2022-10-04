#' Creates user interface inputs for Shiny app
#'
#' @description This function creates user interface inputs for Shinyapp such as radio button and slider input.
#'
#' @param dataset A data frame
#' @param input_type Character string specifying type of input, "date" or "state"
#' @param input_id A string specifying the label Id
#'
#' @return
#' Creates a reactive slider/picker input for Shiny App
#'
#' @import shiny
#'
#' @export


ui_input <- function(input_type, input_id, dataset) {

  if(input_type == "operator"){

    radioButtons (inputId = input_id,
                  label = "Choose airline",
                  choices = unique(dataset$operator),
                  inline = TRUE )

  } else if (input_type == "state") {

    selectInput (inputId = input_id,
                 label = "Choose states",
                 choices = unique(dataset$region),
                 selected = c("arizona", "california", "florida", "colorado", "texas" ),
                 multiple = TRUE)

  } else if (input_type == "year") {

    selectInput (inputId = input_id,
                 label = "Select year",
                 choices = unique(dataset$incident_year),
                 selected = 2011,
                 multiple = FALSE)

  } else if (input_type == "guess1") {

    radioButtons (inputId = input_id,
                  label = "Guess: Which time of the day wildlife strikes on airplanes are the highest?",
                  choices = c("Dawn", "Dusk", "Night", "Day"),
                  inline = TRUE )

  } else if (input_type == "guess2") {

    radioButtons (inputId = input_id,
                  label = "Guess: Which phase of the flights is impacted the most by wildlife strikes",
                  choices = c("Take-off run", "Descent", "Landing Roll", "Climb", "Approach"),
                  inline = TRUE )

  } else if (input_type == "guess3") {

    radioButtons (inputId = input_id,
                  label = "Guess: Which sky condition where wildlife strikes occurred the most?",
                  choices = c("Overcast", "No Cloud", "Some Cloud"),
                  inline = TRUE )
  } else {

    sliderInput(inputId = input_id,
                label = "Number of bins:",
                min = 5,
                max = 20,
                value = 10)
  }

}
