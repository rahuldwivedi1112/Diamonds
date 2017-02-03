#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(plotly))
data("diamonds")
my_data <- select(diamonds,carat,cut,color,clarity,depth,price)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
  
    output$Plot <- renderPlot({
      final_data <- filter(my_data,price >=input$Pricemin & price<= input$Pricemax,cut == input$cut)
      hist(x = final_data$price/final_data$carat)

    })

})
