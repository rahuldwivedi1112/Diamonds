#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
suppressPackageStartupMessages(library(ggplot2))

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamonds"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("Pricemin",
                   "Minimum Price in $:",
                   min = 326,
                   max = 18820,
                   value = 400),
       sliderInput("Pricemax",
                   "Maximum Price in $:",
                   min = 326,
                   max = 18820,
                   value = 800),
       radioButtons("cut", "Cut of the Diamond:",
                    c("Fair" = "Fair",
                      "Good" = "Good",
                      "Very Good" = "Very Good",
                      "Premium" = "Premium",
                      "Ideal" = "Ideal"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Graph of Diamond Price Vs Carat"),
      plotOutput("Plot")
    )
  )
))
