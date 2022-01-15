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
    output$Relative <- renderTable({ values$rvu}, striped = TRUE)
          
          observeEvent(input$addButton,{
      rvutable <- subset(rvu, rvu$CPT ==input$CPTFilter) %>% 
        mutate(Total = Facility_Total * input$num)
        values$rvu <-rbind(values$rvu, rvutable)
                              })
      sketch <- htmltools::withTags(table(
           tableHeader(Names), tableFooter(FooterName))
          )
          
          opts <- list(
            dom = 'Bfrtip', buttons = list('print',list(extend='collection',text='Download',buttons = list('copy','csv','excel','pdf'))),
            footerCallback = JS(
              "function( tfoot, data, start, end, display ) {",
              "var api = this.api(), data;",
              "$( api.column(6).footer()).html('SubTotal:  '+",
              "api.column(6).data().reduce( function ( a, b ) {",
              "return a + b;",
              "} )",
              ");",
              "$( api.column(7).footer()).html('SubTotal: '+",
              "api.column(7).data().reduce( function ( a, b ) {",
              "return a + b;",
              "} )",
              ");","}")
          )
          
          output$display <- DT::renderDataTable(container = sketch,extensions = 'Buttons',options = opts, rownames= FALSE, {
          data.frame (values$rvu)})
          
              })


# values$Data = data.table