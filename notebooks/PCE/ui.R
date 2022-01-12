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
      textInput("CPT", label = h3("Select CPT Code"), value = "CPT"),
      textInput("text", label = h3("Quantity"), value = "Quantity"),
    ),
    mainPanel(
      textOutput("greeting")
    )
  )
)

  
#textInput("CPT", "CPT Code"),
#textOutput("DESCRIPTION")