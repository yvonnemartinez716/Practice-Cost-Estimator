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
          titlePanel("Practice Revenue Estimator"),
          sidebarLayout(
            sidebarPanel(width = 2,
                         radioButtons("radio", label = h3(" "),
                                      choices = list("Select by CPT Code" = 1, "Select by Description" = 2), 
                                      selected = 1),
                         conditionalPanel("input.radio == 1", selectizeInput("CPTFilter", label = h3("Select CPT Code"), choices = rvu$CPT),
                           numericInput("num", label = h3("Quantity"), value = 1),
                           actionButton("addButton", "Add", icon("Add"))
                         ),
                         conditionalPanel("input.radio == 2",selectizeInput("descFilter", label = h3("Select Description"), choices = rvu$Description),
                                          uiOutput("SelectCPTcode"),
                                          numericInput("numdesc", label = h3("Quantity"), value = 1),
                                          actionButton("descButton", "Add", icon("Add"))
                                          
                         ),
                         
                         
                                             uiOutput("removerow"),
                         
                         actionButton(inputId = "remove", label = "Remove CPT Code")
            ),
            mainPanel(
              #tableOutput("Relative"), 
              dataTableOutput("display"),
              plotOutput("plot")
              
            )
          )
)



