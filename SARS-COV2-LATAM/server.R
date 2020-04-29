#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(COVID19)
library(ggplot2)
library(plotly)

ylabs<-c("Number of Confirmed Cases"="confirmed",
         "Number of Tested Cases"="tests",
         "Number of Deaths"="deaths",
         "Number of Recovered Cases"="recovered")

mainlabs<-c("Confirmed Cases per country in Latin America"="confirmed",
            "Tested Cases per country in Latin America"="tests",
            "Deaths per country in Latin America"="deaths",
            "Recovered cases per country in Latin America"="recovered")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  data<-reactive({data<-covid19(start = input$daterange[1], end = input$daterange[2])
  return(data)})
  
  latamdata<-reactive({
    latamcountries<- input$countries
    lat<-subset(data(), subset= country %in% latamcountries)
    return(lat)
  })
  
  output$graph<-renderPlotly(
    ggplotly(plot1<-
               ggplot(latamdata(), aes_string(x="date",y=input$yvar))+
               geom_line(aes(col=country))+geom_point(aes(col=country))+
               xlab("Date")+ylab(names(ylabs[which(ylabs == input$yvar)]))+ggtitle(names(mainlabs[which(mainlabs == input$yvar)]))))
  
  todaydata<-reactive({
    latamcountries<- c("Colombia","Brazil","Argentina","Peru","Venezuela","Chile","Ecuador","Bolivia","Paraguay","Uruguay","Guyana", "Suriname")
    todaydata<-subset(data(), subset= country %in% latamcountries)
    today<-Sys.Date()-1
    todaydata<-subset(todaydata,subset=date %in% today)
    return(todaydata)
  })
  
  output$graph2<-renderPlotly(
    ggplotly(plot2<-
               ggplot(todaydata(), aes(x=country,y=get(input$yvar), fill=country))+
               geom_col()+
               xlab("Country")+ylab(names(ylabs[which(ylabs == input$yvar)]))+ggtitle(names(mainlabs[which(mainlabs == input$yvar)]))))
  
})

