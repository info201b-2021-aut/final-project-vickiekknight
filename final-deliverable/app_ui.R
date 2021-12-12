library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(shinyjs)
library(shiny)
library(png)
library(tidyr) 
library(tidyverse)
library(shinythemes)

#######################
fishdata <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/fish.csv", encoding = "UTF-8")
villagerData <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/villagers.csv")

################################################################################################
Intro <- tabPanel(
  
  tags$h3(id = "tabs", "Introduction"),
  
  tags$body(
    
    img("", src = "https://image-cdn.essentiallysports.com/wp-content/uploads/animal-crossing-new-horizons-8-3.jpg", 
        width = 800),
    
    tags$header(
      tags$h1(id = "header", "Animal Crossing: Analysis of in-game resourses"),
      tags$h2(id = "header", "and in game stock market - The Stalk Market"),
    ),
    
    tags$hr(),
    
    tags$main(
      
      tags$section(
        tags$h3("Part One: In-game resources"),
        tags$p("            "),
        tags$p("When our group was asked to find a data set to analyze for this project, we went on to research various data sets and settled for a game to investigate, the game Animal Crossing: New Horizons. The aspects of the game impressed us. From the early stages of the game, when players try to open up a deserted island, then slowly develop and complete the facilities one by one, as more residents move in, the atmosphere of the island becomes more lively. 
              Besides its enjoyable nature, its recent surge in popularity could provide intriguing trends when categorizing elements within the game. What we were trying to achieve was to analyze data that most college students could easily understand. If a player wants to progress in the game, they would have to collect resources(animals, plants), explore islands, trading with villagers(Non-Playable-Character), etc. Upon diving more profoundly, we decided on three resources for analyzing: essential characteristics(such as location/spawn rate/total catches, etc.) of Fish, insects, and the personal information of the villagers.
              "),
        tags$hr()
      ),
      
      tags$section(
        tags$h3("Part Two: Stalk Market - turnip trading"),
        tags$p("            "),
        tags$p("In the process of constructing the data tables and information about the game animal crossing, one of the dilemmas we have found is based on the in-game item 'turnip' In Animal Crossing: New Horizons, turnips are sold by an NPC(non-playable character) called Daisy-Mae. These vegetables aren't for growing, though, as they're the game's version of a stock market of sorts - aka the stalk market. On Sundays, you buy turnips for one price, and then you 
               aim to sell them before the next Sunday rolls around - hopefully for a higher price than you paid for them. Each day, the shop will offer two different prices for your turnips. The game is to take a gamble on what you think will be the highest price each week and where you can make the most profit. "),
        tags$p("            "),
        tags$p("But in the un-beautiful real world, stock prices are determined by market supply and demand, and it is common to lose money to nothing or make hundreds of thousands of money in a minute. If we can analyze how players in the game should know when to sell turnips to stop losing money/or sell it to make a profit, it would help people stop making the future costs become the suck cost, further preventing the money lost.
        "),
        tags$hr()
      ),
    )
  )
)


################
sorted <- arrange(villagerData, villagerData$Species)


interactive_one <- tabPanel(
  tags$h3(id = "tabs", "Chart1"),
  ui <- fluidPage(
    titlePanel("Trend for Species with Different Personalities"),
    sidebarPanel(
      p("Select two different species in the drop down menu's to compare
         the different amounts of personalites.
      "),
      selectInput(
        inputId = "species_one",
        label = "Species 1",
        choices = sorted$Species,
        selected = sorted[, 1]
      ),
      selectInput(
        inputId = "species_two",
        label = "Species 2",
        choices = sorted$Species,
        selected = sorted[, 1]
      ),
      h4("Question:"),
      p("How are different specie types closely related to real life animals?"),
      h4("Findings"),
      p("By looking at the two comparison graphs to the right, you can see how each animal is closely related to their real life character type. Looking more closely, a bull tends to be quite angry (cranky) towards anything and a rabbit tends to be quite lively and high-spirited (peppy) at times.")
    ),
    mainPanel(
      plotlyOutput("compare_one", height = 300, width = 800),
      plotlyOutput("compare_two", height = 300, width = 800)
    )
  )
)
  

################
interactive_two <- tabPanel(
  tags$h3(id = "tabs", "Chart2"),
  ui <- fluidPage(
    
    #App name
    
    titlePanel("Charting Size of Fish Based on Location"),
    
    useShinyjs(),
    
    selectizeInput("fish", "Fish Based on Location:",
                   choices = list("River_Fish", "Pier_Fish", "Cliff_Fish",
                                  "Mouth_Fish", "Pond_Fish", "Sea_Fish")),
    
    plotlyOutput("fishPlots"),
    
  ),
)

################
interactive_three <- tabPanel(
  tags$h3(id = "tabs", "chart3"),
  ui <- fluidPage(
    
    # Application title
    titlePanel("Turnip Price Trends in the Stock Market"),
    
    # Sidebar with a slider input for type of pattern  
    useShinyjs(),
    
    selectizeInput("pattern", "type of pattern:",
                   choices = list("random",
                                  "large_spike",
                                  "decreasing",
                                  "small_spike")),
    plotlyOutput("turnipPlot")
    
  )
)

################
Takeaways <- tabPanel(
  
  tags$h3(id = "tabs", "What we have learn from our data"),
  
  tags$body(
    
    tags$header(
      tags$h1(id = "header", "Three Takeaways"),
    ),
    
    tags$hr(),
    
    tags$main(
      
      tags$section(
        tags$h3("How are different specie types closely related to real life animals?"),
        tags$p("By looking at the two comparison graphs to the right, you can see how each animal is closely related to their real life character type. Looking more closely, a bull tends to be quite angry (cranky) towards anything and a rabbit tends to be quite lively and high-spirited (peppy) at times."),
        tags$hr()
      ),
      
      tags$section(
        tags$h3("What frequency is about the different type of fish's shadow?"),
        tags$p("By looking at the trend that we have put into the interactive pages. We have know differetn 
               location will cause the fish has different frequency and shadow. The some of the fish like 
               Pier fish and mouth fish has less shadow type than others"),
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



################################################################################################
ui <- navbarPage(
  theme = shinytheme("superhero"),
  title = NULL,
  Intro, 
  interactive_one,
  interactive_two,
  interactive_three,
  Takeaways
)
