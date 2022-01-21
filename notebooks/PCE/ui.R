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
library(ggplot2)

fluidPage(theme = shinytheme("cerulean"),
  titlePanel("Practice Cost Estimator"),
  sidebarLayout(
    sidebarPanel(width = 2,
      selectizeInput("HCPSFilter", label = h3("Select HCPS Code"), choices = rvu$HCPS),
      numericInput("num", label = h3("Quantity"), value = 1),
      actionButton("addButton", "Add", icon("Add")),
      uiOutput("removerow"),
       
      actionButton(inputId = "remove", label = "Remove HCPS Code")
      ),
    mainPanel(
      #tableOutput("Relative"), 
      dataTableOutput("display"),
      plotOutput("plot")
      
    )
  )
)


  
