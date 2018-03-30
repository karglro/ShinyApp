
library(shiny)
library(ggplot2)
library(ISLR)

data("Hitters")
Hitters <- Hitters[!is.na(Hitters$Salary),]



shinyServer(function(input, output) {
  
  modfit <- lm(Salary ~ Years + Hits, data = Hitters)
  
  pred <- reactive({
    predict(modfit, newdata = data.frame(Years = input$sliderYears, Hits = input$sliderHits))
  })
   
  output$plot1 <- renderPlot({
      
    ggplot(data=Hitters, aes(x=Hits, y=Salary, colour=Years))+geom_point()+
      stat_smooth(method = "lm", col = "green",se = FALSE)+
      geom_point(aes(x=input$sliderHits, y=pred()), colour="red", size=3, shape=3)
    
    
    
  })
  
  output$pred <- renderText({
    paste(as.integer(pred()),"k Dollar")
  })
  
  
  
  
})
