########### 
library(shiny)
library(ggplot2)
library(RColorBrewer)
library(plotly)

###########
read.csv("https://github.com/info201b-2021-aut/final-project-vickiekknight/blob/main/data/fish.csv")

###########
introduction <- tabPanel()

interactive_one <- tabPanel()

interactive_two <- tabPanel()

interactive_three <- tabPanel()

Takeaways <- tabPanel(
  
  tags$h3(id = "tabs", "What we have learn from our data"),
  
  tags$body(
    
    tags$header(
      tags$h1(id = "header", "Three Takeaways"),
    ),
    
    tags$hr(),
    
    tags$main(
      
      tags$section(
        tags$h1("Subtitle"),
        tags$p("Main sentence")
      ),
      
      tags$section(
        tags$h1("Subtitle"),
        tags$p("Main sentence")
      ),
      
      tags$section(
        tags$h1("Subtitle"),
        tags$p("Main sentnce")
      )
    )
  )
)

###########
ui <- navbarPage(
    title = NULL,
    introduction,
    interactive_one,
    interactive_two,
    interactive_three,
    Takeaways
  )
