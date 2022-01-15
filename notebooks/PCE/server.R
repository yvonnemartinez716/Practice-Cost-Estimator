#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(data.table)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    values <-reactiveValues(rvu = (head(rvu,1) %>% 
                              mutate(Total = Facility_Total) %>% 
                              head(0)))
    output$Relative <- renderTable({ values$rvu
            })
      observeEvent(input$addButton,{
      rvutable <- subset(rvu, rvu$CPT ==input$CPTFilter) %>% 
        mutate(Total = Facility_Total * input$num)
        values$rvu <-rbind(values$rvu, rvutable)
                              })
    })


# Define server logic required to draw a histogram
#shinyServer(function(input, output) {
  #output$Relative <- renderTable({ 
    #rvutable <- subset(rvu, rvu$CPT ==input$CPTFilter) %>% 
#
  #})
#})

       
#shinyServer(function(input, output) {
  
  #output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2]
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  #})
  
#})