
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel(""),
  
  sidebarPanel(
    numericInput("choose_VP"),
    
    uiOutput("choose_i"),
    
    uiOutput("choose_n")
  ),
  
  
  mainPanel(
    tableOutput("data_table")
  )
))
