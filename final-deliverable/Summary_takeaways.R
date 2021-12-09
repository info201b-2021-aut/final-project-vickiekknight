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
        tags$p("The pattern of the cabbage selling have helped us figure out what the lowest possible rate
                that the Nook shop will buy from us is. We defined our base price as 100 Bells. Now we follow
                the steps. When following, keep the formula below in mind. Note that percentages are defined 
                as a decimal between 0.0 and 1.0. So 85% would be 0.85. ")
        tags$h1("sell price = base rate * base price")
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
