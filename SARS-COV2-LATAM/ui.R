#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
shinyUI(fluidPage(
  titlePanel("SARS-COV-2 in Latin American Countries"),
  sidebarLayout(
    sidebarPanel(
      dateRangeInput("daterange", "Date range:",
                     start  = "2020-03-15",
                     end    = Sys.Date(),
                     min    = "2020-02-01",
                     max    = Sys.Date(),
                     format = "mm/dd/yy",
                     separator = " - "),
      checkboxGroupInput("countries", "Select Countries", 
                         choices = c("Colombia"="Colombia",
                                     "Brazil"="Brazil",
                                     "Argentina"="Argentina",
                                     "Peru"="Peru",
                                     "Venezuela"="Venezuela",
                                     "Chile"="Chile",
                                     "Ecuador"="Ecuador",
                                     "Bolivia"="Bolivia",
                                     "Paraguay"="Paraguay",
                                     "Uruguay"="Uruguay",
                                     "Guyana"="Guyana",
                                     "Suriname"="Suriname"), 
                         selected = "Colombia", inline = FALSE, width = NULL, 
                         choiceNames = NULL, choiceValues = NULL),
      radioButtons("yvar", "Select y variable" , choices= c("Confirmed Cases"="confirmed",
                                                           "Tested Cases"="tests",
                                                           "Deaths"="deaths",
                                                           "Recovered"="recovered"))
    ),
    mainPanel(
      h3("Cases per country"),
      plotlyOutput("graph"),
      h3("Today's info"),
      plotlyOutput("graph2")
    )
  )
))
