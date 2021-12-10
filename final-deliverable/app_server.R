# app_server.R
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(shinyjs)
library(dplyr)



###Graph (Fish)
server <- function(input, output) {
  
  plotex <- reactive({
    
    if ("River_Fish" %in% input$fish) return(riverfish)
    if ("Pier_Fish" %in% input$fish) return(pierfish)
    if("Cliff_Fish" %in% input$fish) return(clifffish)
    if("Mouth_Fish" %in% input$fish) return(mouthfish)
    if("Pond_Fish" %in% input$fish) return(pondfish)
    if("Sea_Fish" %in% input$fish) return(seafish)
    
  })
  output$fishplot <- renderImage({
    
    dataplots = plotex()
    print(dataplots)
    
  })
}


###Graph
server <- function(input, output) {
  
    plottest <- reactive({
      if ("random" %in% input$pattern) return(random_plot)
      if ("large_spike" %in% input$pattern) return(large_spike_plot)
      if ("decreasing" %in% input$pattern) return(decreasing_plot)
      if ("small_spike" %in% input$pattern) return(small_spike_plot)
    })
    
    output$turnipPlot <- renderPlotly({
        dataplots = plottest()
        print(dataplots)
    })
}


#######Graph

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
