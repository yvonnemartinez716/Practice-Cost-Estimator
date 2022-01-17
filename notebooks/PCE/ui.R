#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(shinydashboard)

fluidPage(theme = shinytheme("cerulean"),
  titlePanel("Practice Cost Estimator"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput("CPTFilter", label = h3("Select CPT Code 1"), choices = rvu$CPT),
      numericInput("num", label = h3("Quantity"), value = 1),
      actionButton("addButton", "Add", icon("Add"))
      ),
    mainPanel(
      tableOutput("Relative"), 
      dataTableOutput("display")
    )
  )
)

#FooterNames 
# shinyApp(
#   ui = tagList(
#     shinythemes::themeSelector(),
#     navbarPage(
#       theme = "cerulean",  
  
