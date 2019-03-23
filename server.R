#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output) {
  result <- eventReactive(input$button,{
    h <- ES.h(input$prop1, input$prop2)
    sig <- as.numeric(1-as.numeric(input$confidence))
    pwr.2p.test(h=as.numeric(h), n=NULL, sig.level=as.numeric(sig), power=as.numeric(input$p), alternative=input$type)
  })
  output$sampize <- renderPrint({result()[2]})
  output$sig <- renderText(as.numeric(1-as.numeric(input$confidence)))
}
