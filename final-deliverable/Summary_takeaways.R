########### 
library(shiny)
library(ggplot2)
library(plotly)

###########
read.csv("https://github.com/info201b-2021-aut/final-project-vickiekknight/blob/main/data/fish.csv")

###########
Intro <- tabPanel(
  tags$h3(id = "tabs", "example"),
)

interactive_one <- tabPanel(
  tags$h3(id = "tabs", "example2"),
)

interactive_two <- tabPanel(
  tags$h3(id = "tabs", "example3"),
)

interactive_three <- tabPanel(
  tags$h3(id = "tabs", "example4"),
)

Takeaways <- tabPanel(
  
  tags$h3(id = "tabs", "What we have learn from our data"),
  
  tags$body(
    
    tags$header(
      tags$h1(id = "header", "Three Takeaways"),
    ),
    
    tags$hr(),
    
    tags$main(
      
      tags$section(
        tags$h3("Where is the best location to catch your favorites insects in the animal crossing?"),
        tags$p("According to what we have found out there, we have got the trend of what kind 
                of insects are drawn to different places. Other players can use this information
                to learn and find out the best location to catch their favorites insects in the areas. "),
        tags$hr()
      ),
      
      tags$section(
        tags$h3("Where is the best location to find the most valuable fish in the animal crossing?"),
        tags$p("By looking at the trend that we have put into the interactive pages. We have know that the
              (fish) has the most valuable to catach in this game. It can make the player to have the most 
              benfits in this game."),
        tags$hr()
      ),
      
      tags$section(
        tags$h3("What we have learned from the cabbage trading in this game?"),
        tags$p("The pattern of the cabbage selling have helped us figure out what the lowest possible rate
                that the Nook shop will buy from us is. We defined our base price as 100 Bells. Now we follow
                the steps. When following, keep the formula below in mind. Note that percentages are defined 
                as a decimal between 0.0 and 1.0. So 85% would be 0.85. "),
        tags$h4("                      Sell price = base rate * base price"),
        tags$hr()
      )
    )
  )
)

ui <- navbarPage(
  title = NULL,
  Intro, 
  interactive_one,
  interactive_two,
  interactive_three,
  Takeaways
)




###########
server <- function(input, output){
}

shinyApp(ui = ui, server = server)
