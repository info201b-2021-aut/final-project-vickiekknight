# app_server.R
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(shinyjs)
library(dplyr)



###Graph 1

###Graph 2

###Graph 3
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


###########

# stock market graph information
# random pattern line chart
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
