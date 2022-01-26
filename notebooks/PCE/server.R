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
library(datasets)



shinyServer(function(input, output,session) {
  values <-reactiveValues(rvu = (head(rvu,1) %>% 
                                   mutate(QTY = 0, Revenue = FacilityTotal) %>% 
                                   head(0)))
  #output$Relative <- renderTable({ values$rvu}, striped = TRUE)
  
  observeEvent(input$addButton,{
    rvutable <- subset(rvu, rvu$CPT ==input$CPTFilter) %>% 
      mutate(QTY = input$num + 0, Revenue = FacilityTotal * input$num *34.6062)
    values$rvu <-rbind(values$rvu, rvutable)
  })
  observeEvent(input$descButton,{
    rvutable <- subset(rvu, rvu$CPT ==input$CPTdesc) %>% 
    mutate(QTY = input$numdesc + 0, Revenue = FacilityTotal * input$numdesc *34.6062)
    values$rvu <-rbind(values$rvu, rvutable)
  })
  
  observeEvent(input$remove,{
    values$rvu <-filter(values$rvu, CPT != input$remove_CPT)
  })
  output$SelectHCPScode <- renderUI({
    selectizeInput("CPTdesc", label = h3("Select CPT Code"), choices = subset(rvu, rvu$Description ==input$descFilter)$CPT)
    
    
  })
  output$removerow <-renderUI({
    selectInput(inputId = "remove_CPT", label = "Remove CPT Code",
                choices = (values$rvu$CPT))
    
  })
  
  
  sketch <- htmltools::withTags(table(
    tableHeader(Names), tableFooter(FooterName))
  )
  
  opts <- list(
    dom = 'Bfrtip', buttons = list(list(extend='collection',text='Download',buttons = list('copy','csv','excel','pdf'))),
    footerCallback = JS(
      "function( tfoot, data, start, end, display ) {",
      "var api = this.api(), data;",
      "$( api.column(6).footer()).html('SubTotal:  '+",
      "api.column(6).data().reduce( function ( a, b ) {",
      "return a + b;",
      "} )",
      ");",
      "$( api.column(7).footer()).html('QTY Total: '+",
      "api.column(7).data().reduce( function ( a, b ) {",
      "return a + b;",
      "} )",
      ");",
      "$( api.column(8).footer()).html('Revenue: '+",
      "api.column(8).data().reduce( function ( a, b ) {",
      "return a + b;",
      "} )",
      ");","}")
  )
  
  output$display <- DT::renderDataTable(container = sketch,extensions = 'Buttons',options = opts,{
    data.frame (values$rvu)
    
  })
  output$plot <- renderPlot({
    values$rvu %>%
      ggplot(aes(x=CPT, y = Revenue)) +
      geom_col()
  })        
  
  
  
})




