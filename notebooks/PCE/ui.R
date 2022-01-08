#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

fluidPage(
  titlePanel("Practice Cost Estimator"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Observations:", min = 0, max = 1000, value = 500), 
      textInput("text", label = h3("CPT"), value = "Enter CPT Code")
    ),
    mainPanel(
      textOutput("greeting")
    )
  )
)

  
#textInput("CPT", "CPT Code"),
#textOutput("DESCRIPTION")