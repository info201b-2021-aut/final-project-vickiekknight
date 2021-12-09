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
      tags$h2(id = "header", "Three Takeaways"),
    ),
    
    tags$hr(),
    
    tags$main(
      
      tags$section(
        tags$h1("Where is the best location to catch your favorites insects in the animal crossing?"),
        tags$p("According to what we have found out there, we have got the trend of what kind 
                of insects are drawn to different places. Other players can use this information
                to learn and find out the best location to catch their favorites insects in the areas. ")
      ),
      
      tags$section(
        tags$h1("Where is the best location to find the most valuable fish in the animal crossing?"),
        tags$p("Main sentence")
      ),
      
      tags$section(
        tags$h1("What we have learned from the cabbage trading in this game"),
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
