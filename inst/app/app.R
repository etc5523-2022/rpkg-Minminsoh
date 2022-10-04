#Load library

library(tidyverse)
library(wildlifestrikes)
library(plotly)
library(shiny)
library(shinythemes)

# ---------------------------------------------------- Load Data ---------------------------------------------------#

# ui ----------------------------------------------------------------------

ui <- navbarPage(
  "Wildlife Strikes to Aviation in the United States",
  theme= shinytheme("simplex"),
  tabPanel("About", fluid = TRUE, icon = icon("question"),
           titlePanel("Background"),
           fluidRow(column(11,
                           div(class = "about",
                               uiOutput('about')))),
           includeCSS("styles.css")),
  tabPanel(
    "Analysis",
    titlePanel(div(
      windowTitle = "Aircraft Strikes",
      img(src = "https://media.cntraveler.com/photos/572a418aef80b66d1671815c/16:9/w_2560%2Cc_limit/GettyImages-497721394.jpg", width = "100%", class = "bg", height="350px"),
    )),
    #tab$br(),
    tabsetPanel(
      type = "tabs",

      tabPanel(
        "Factors", fluid = TRUE,
        sidebarLayout(
          sidebarPanel(
            h3("What are the factors affecting wildlife strikes on aircrafts?"),
            tags$br(),
            fluidRow(column(12, div(ui_input("guess1", "guessTime", wildlife_strikes),
                                    ui_input("guess2", "guessPhase", wildlife_strikes),
                                    ui_input("guess3", "guessSky", wildlife_strikes),
                                    class = "guess"),
                            br(),
                            actionButton("submit", "Submit your guess!", class = "btn-lg btn-success")))
          ),
          mainPanel(
            strong(textOutput("message1")),
            br(),
            strong(textOutput("message2")),
            br(),
            strong(textOutput("message3")),
            br(),
            br(),
            plotOutput("timePlot"),
            br(),
            plotOutput("phasePlot"),
            br(),
            plotOutput("skyPlot")
          )
        )
      ),



      tabPanel(
        "Geographic Differences", icon = icon ("earth-americas"),
        sidebarLayout(
          sidebarPanel(
            h3("How many cases of wildlife strikes on aircrafts reported in each states from 1991 to 2018?"),
            tags$br(),
            ui_input("state", "statename", USmap)),
          mainPanel(
            h3("Impacts on Airports in each States"),
            plotOutput(outputId = "stateComparison"),
            dataTableOutput(outputId = "stateTable")
          )
        )
      ),

      tabPanel(
        "Impact on Airlines",
        sidebarLayout(
          sidebarPanel(
            h3("Damages Level incurred by Airlines"),
            tags$br(),
            ui_input("operator", "operatorDamage", wildlife_strikes),
            ui_input("year", "operatorYear", wildlife_strikes)
          ),
          mainPanel(
            strong(textOutput("cases")),
            br(),
            plotlyOutput(outputId = "damagePlot")
          )
        ),
        fluidRow(
          sidebarLayout(
            sidebarPanel(
              h3("Distribution of Repair Costs incurred by Airlines "),
              tags$br(),
              ui_input("operator", "operatorRepair", wildlife_strikes),
              ui_input("histogram", "bins", wildlife_strikes)
            ),
            mainPanel(
              plotlyOutput("distPlot")
            )
          )
        )
      )

    )))

# server ----------------------------------------------------------------------

server <- function(input, output, session) {

  output$message1 <- renderText({
    if(input$guessTime == "Day"){
      paste("Correct!","Wildlife Strikes on aircraft flying during the day are reported the highest. Refer Graph 1.")
    }else {
      paste("Wrong guess!", "Wildlife Strikes on aircraft flying during the day are reported the highest. Refer Graph 1.")
    }
  }) %>% bindEvent(input$submit)


  output$message2 <- renderText({
    if(input$guessPhase == "Approach"){
      paste("Correct!", "Wildlife strikes tend to occur the most when aircraft is on approaching phase. Refer Graph 2. ")
    }else {
      paste("Wrong guess!", "Wildlife strikes tend to occur the most when aircraft is on approaching phase. Refer Graph 2.")
    }
  })%>%bindEvent(input$submit)

  output$message3 <- renderText({
    if(input$guessSky == "No Cloud"){
      paste("Correct!", "Wildlife strikes tend to occur the most where the sky condition has no cloud. Refer Graph 3. ")
    }else {
      paste("Wrong guess!", "Wildlife strikes tend to occur the most where the sky condition has no cloud. Refer Graph 3.")
    }
  })%>%bindEvent(input$submit)


  output$timePlot <- renderPlot({

    d <- count_frequency(time_of_day)

    d %>%
      ggplot(aes(x = reorder(time_of_day,n), n))+
      geom_col() +
      geom_col(data = ~filter(.x, time_of_day == "Day"),
               fill = "#6295ED")+
      geom_text(aes(label = paste(n)),
                position= position_stack(vjust = 0.5),
                color = "white",size = 5)+
      ggtitle("Graph 1: Occurence of Wildlife Strikes to Aircraft : Time of the Day") +
      labs(y = "Number of Cases", x = "Time of the Day")+
      theme_plot("bar")

  }) %>%bindEvent(input$submit)

  output$phasePlot <- renderPlot({

    d <- count_frequency(phase_of_flt)

    d %>%
      ggplot(aes(x = reorder(phase_of_flt,n), n))+
      geom_col() +
      geom_col(data = ~filter(.x, phase_of_flt == "Approach"),
               fill = "#6295ED")+
      geom_text(aes(label = paste(n)),
                position= position_stack(vjust = 0.5),
                color = "white",size = 5)+
      ggtitle("Graph 2: Occurence of Wildlife Strikes to Aircraft : Phase of Flights") +
      labs(y = "Number of Cases", x = "Phase of Flights")+
      theme_plot("bar")

  }) %>%bindEvent(input$submit)

  output$skyPlot <- renderPlot({

    d <- count_frequency(sky)

    d %>%
      ggplot(aes(x = reorder(sky,n), n))+
      geom_col() +
      geom_col(data = ~filter(.x, sky == "No Cloud"),
               fill = "#6295ED")+
      geom_text(aes(label = paste(n)),
                position= position_stack(vjust = 0.5),
                color = "white",size = 5)+
      ggtitle("Graph 3: Occurence of Wildlife Strikes to Aircraft : Sky Conditions") +
      labs(y = "Number of Cases", x = "Sky Conditions")+
      theme_plot("bar")

  }) %>%bindEvent(input$submit)


  output$stateComparison <- renderPlot({

    # Function cases_statemap(input_state)
    cases_statemap(c(input$statename))

  })

  output$stateTable <- renderDataTable(

    # Function cases_state(input_state)
    cases_state(c(input$statename)), options = list(pageLength = 5)
  )

  #Third tab Damages and Costs by Airlines

  output$cases <- renderText({

    operator <- as.character(input$operatorDamage)
    year <- as.numeric(input$operatorYear)

    cases_airline(operator, year)

  })

  output$damagePlot <- renderPlotly ({

    operator <- input$operatorDamage
    year <- as.numeric(input$operatorYear)

    # Function damages_airline(input_operator, input_year)
    damages_airline(operator, year) %>%
      ggplot(aes(x = reorder(damage,n) , y = n))+
      geom_col(fill = "#6295ED")+
      geom_text(aes(label = paste(n)),
                position = position_stack(vjust = 0.5),
                color = "white",size = 3)+
      ggtitle("Damage Level to Airline")+
      labs(y = "Number of Case(s)", x = "Damage Level")+
      theme_plot("bar")

  })



  output$distPlot <- renderPlotly({

    operator <- input$operatorRepair
    bin <- as.numeric(input$bins)

    histPlot(operator, bin)

  })

  output$about <- renderUI({
    knitr::knit("about.Rmd", quiet = TRUE) %>%
      markdown::markdownToHTML(fragment.only = TRUE) %>%
      HTML()
  })

}
shinyApp(ui, server)
