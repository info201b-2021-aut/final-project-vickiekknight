library(shiny)
library(ggplot2)
library(plotly)


################################################################################################
Intro <- tabPanel(
  
  tags$h3(id = "tabs", "Introduction"),
  
  tags$body(
    
    tags$header(
      tags$h1(id = "header", "Animal Crossing: Analysis of in-game resourses"),
      tags$h2(id = "header", "and in game stock market - The Stalk Market"),
    ),
    
    tags$hr(),
    
    tags$main(
      
      tags$section(
        tags$h3("Part One: In-game resources"),
        tags$p("When our group was asked to find a data set to analyze for this project, we went on to research various data sets and settled for a game to investigate, the game Animal Crossing: New Horizons. The aspects of the game impressed us. From the early stages of the game, when players try to open up a deserted island, then slowly develop and complete the facilities one by one, as more residents move in, the atmosphere of the island becomes more lively. 
              Besides its enjoyable nature, its recent surge in popularity could provide intriguing trends when categorizing elements within the game. What we were trying to achieve was to analyze data that most college students could easily understand. If a player wants to progress in the game, they would have to collect resources(animals, plants), explore islands, trading with villagers(Non-Playable-Character), etc. Upon diving more profoundly, we decided on three resources for analyzing: essential characteristics(such as location/spawn rate/total catches, etc.) of Fish, insects, and the personal information of the villagers.
              "),
        tags$hr()
      ),
      
      tags$section(
        tags$h3("Part Two: Stalk Market - turnip trading"),
        tags$p("In the process of constructing the data tables and information about the game animal crossing, one of the dilemmas we have found is based on the in-game item 'turnip' In Animal Crossing: New Horizons, turnips are sold by an NPC(non-playable character) called Daisy-Mae. These vegetables aren't for growing, though, as they're the game's version of a stock market of sorts - aka the stalk market. On Sundays, you buy turnips for one price, and then you 
               aim to sell them before the next Sunday rolls around - hopefully for a higher price than you paid for them. Each day, the shop will offer two different prices for your turnips. The game is to take a gamble on what you think will be the highest price each week and where you can make the most profit. "),
        tags$hr()
        tags$p("But in the un-beautiful real world, stock prices are determined by market supply and demand, and it is common to lose money to nothing or make hundreds of thousands of money in a minute. If we can analyze how players in the game should know when to sell turnips to stop losing money/or sell it to make a profit, it would help people stop making the future costs become the suck cost, further preventing the money lost.
        "),
        tags$hr()
      ),
    )
  )
)


################
interactive_one <- tabPanel(
  tags$h3(id = "tabs", "example2"),
)

################
interactive_two <- tabPanel(
  tags$h3(id = "tabs", "example3"),
)

################
interactive_three <- tabPanel(
  tags$h3(id = "tabs", "example4"),
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



################################################################################################
ui <- navbarPage(
  title = NULL,
  Intro, 
  interactive_one,
  interactive_two,
  interactive_three,
  Takeaways
)
