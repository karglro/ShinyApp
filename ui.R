
library(shiny)


descr_text <- " 
This application predicts an annual salary in thousands of dollars given 

<ul>
<li> the number of years the player played in  the major leagues
<li> the number of hits the player had
</ul>


Data is given by the Hitters data set of the ISLR package.

<p>

To use the application choose the application tab and select the parameters with the sliders on the left hand side.<br>
Press the Submit button to provide the application with the selected data.

<p>
The plot shows the relation of Hits with annual salaries as given in the data set.<br>
Coloring of the points hints at the years of experience of the player associated with the data point.<br>
The green line shows the linear relationship between Hits and Salary.<br>
The actual predicition also takes into account the years of experience and is shown below the plot. 
"
  
  
  

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Salaries of Baseball Players"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderHits", "How many Hits? ", 0, 250, value = 100),
      sliderInput("sliderYears", "Years of Experience", 0, 25, value = 10),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Description", br(),
                          HTML(descr_text)
                           ), 
                  tabPanel("Application", br(), 
                           plotOutput("plot1"),
                           h3("Predicted Salary"),
                           textOutput("pred")
                           )
      )
      
    
    )
  )
))
