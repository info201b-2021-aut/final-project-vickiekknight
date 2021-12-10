library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(shinyjs)
library(dplyr)
#####################################################

#######Graph

## Source "app_ui.R" and "app_server.R" files.
source("app_ui.R")
source("app_server.R")

### Create a new shinyApp
shinyApp(ui = ui, server = server)

## Fish Information/Graphs

x1 <-  c(1, 1)
labels <-  c("X-Large", "XX-Large")

piepercent1 <- round(100*x1/sum(x1), 1)

png(file = "pierfish.jpg")

pierfish <- pie(x1, labels = piepercent1, main = "Pier Fish Size pie chart",col = rainbow(length(x1)))
legend("topright", c("X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x1)))

# Pond Fish

x2 <-  c(4, 3, 4, 1)
labels <-  c("X-Small", "Small", "Large", "X-Large")

piepercent2 <- round(100*x2/sum(x2), 1)

png(file = "pondfish.jpg")

pondfish <- pie(x2, labels = piepercent2, main = "Pond Fish Size pie chart",col = rainbow(length(x2)))
legend("topright", c("X-Small", "Small", "Large", "X-Large"), cex = 0.8,
       fill = rainbow(length(x2)))

# River Fish

x3 <-  c(5, 5, 4, 3, 2)
labels <-  c("X-Small", "Small", "Medium", "Large", "X-Large")

piepercent3 <- round(100*x3/sum(x3), 1)

png(file = "riverfish.jpg")

riverfish <- pie(x3, labels = piepercent3, main = "River Fish Size pie chart",col = rainbow(length(x3)))
legend("topright", c("X-Small", "Small", "Medium", "Large", "X-Large"), cex = 0.8,
       fill = rainbow(length(x3)))

# Mouth Fish

x4 <-  c(1, 1, 1)
labels <-  c("Large", "X-Large", "XX-Large")

piepercent4 <- round(100*x4/sum(x4), 1)

png(file = "mouthfish.jpg")

mouthfish <- pie(x4, labels = piepercent4, main = "Mouth Fish Size pie chart",col = rainbow(length(x4)))
legend("topright", c("Large", "X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x4)))

# Cliff Fish

x5 <-  c(3, 1)
labels <-  c("Medium", "X-Large")

piepercent5 <- round(100*x5/sum(x5), 1)

png(file = "clifffish.jpg")

clifffish <- pie(x5, labels = piepercent5, main = "Cliff Fish Size pie chart",col = rainbow(length(x5)))
legend("topright", c("Medium", "X-Large"), cex = 0.8,
       fill = rainbow(length(x5)))

# seafish Create data for the graph.

x6 <-  c(3, 5, 6, 2, 5, 2, 3, 2)
labels <-  c("X-Small", "Small", "Medium", "Long", "Large W/Fin", "Large", "X-Large", "XX-Large")

piepercent6 <- round(100*x6/sum(x6), 1)

png(file = "seafish.jpg")

seafish <- pie(x6, labels = piepercent6, main = "Sea Fish Size pie chart",col = rainbow(length(x6)))
legend("topright", c("X-Small", "Small", "Medium", "Long", "Large W/Fin", "Large", "X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x6)))

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
interactive_one <- tabPanel(
  tags$h3(id = "tabs", "example2"),
)

################
interactive_two <- tabPanel(
  tags$h3(id = "tabs", "example3"),
  ui = fluidPage(
    
    #App name
    titlePanel("Charting Size of Fish Based on Location"),
    
    useShinyjs(),
    
    selectInput("fish", "Fish Based on Location:",
                choices = list("River_Fish", "Pier_Fish", "Cliff_Fish",
                               "Mouth_Fish", "Pond_Fish", "Sea_Fish"),
                
                plotlyOutput("fishPlot")
                
    ),
  )
)

################
interactive_three <- tabPanel(
  tags$h3(id = "tabs", "example4"),
  
  # stock market graph information
# random pattern line chart
rday <- c(1, 2, 3, 4, 5, 6)
rprice <- c(90, 126, 60, 50, 99, 88)
random <- data.frame(rday, rprice)

random_plot <- ggplot(random, aes(x=rday, y=rprice)) +
  geom_line() + 
  ylab("price") +
  xlab("day")

# large spike pattern line chart
day <- c(1, 2, 3, 4, 5, 6)
price <- c(99, 154, 220, 154, 99, 90)
large_spike <- data.frame(day, price)

large_spike_plot <- ggplot(large_spike, aes(x=day, y=price)) +
  geom_line()

# decreasing pattern line chart
dday <- c(1, 2, 3, 4, 5, 6)
dprice <- c(40, 41.2, 90, 140, 600, 140)
decreasing <- data.frame(dday, dprice)

decreasing_plot <- ggplot(large_spike, aes(x=dday, y=dprice)) +
  geom_line() +
  ylab("price") +
  xlab("day")

# small spike pattern line chart 
sday <- c(1, 2, 3, 4, 5, 6)
sprice <- c(40, 44, 90, 140, 200, 140)
small_spike <- data.frame(sday, sprice)

small_spike_plot <- ggplot(large_spike, aes(x=sday, y=sprice)) +
  geom_line() +
  ylab("price") +
  xlab("day")
  
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
