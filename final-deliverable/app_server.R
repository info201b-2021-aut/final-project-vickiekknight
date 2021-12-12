# app_server.R
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(shinyjs)
library(dplyr)



###Graph 1


##########################Graph 2(Fish)

#Pier Fish

Frequency1 <- c(1, 1, 1, 1)

pieryfish <- PierFish %>%
  mutate(Frequency1)

PIERfish <- ggplot(data=pieryfish, aes(x=Shadow, y=Frequency1, fill=Shadow)) +
  geom_bar(colour="black", stat="identity")

# River Fish

Frequency2 <- c(1, 1, 1, 1, 1, 1, 1, 1, 1,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

riveryfish <- RiverFish %>%
  mutate(Frequency2)

RIVERfish <- ggplot(data=riveryfish, aes(x=Shadow, y=Frequency2, fill=Shadow)) +
  geom_bar(colour="black", stat="identity")

# Sea Fish

Frequency3 <- c(1, 1, 1, 1, 1, 1, 1, 1, 1,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

seayfish <- SeaFish %>%
  mutate(Frequency3)

SEAfish <- ggplot(data=seayfish, aes(x=Shadow, y=Frequency3, fill=Shadow)) +
  geom_bar(colour="black", stat="identity")

# Cliff Fish

Frequency4 <- c(1, 1, 1, 1)

cliffyfish <- CliffFish %>%
  mutate(Frequency4)

CLIFFfish<- ggplot(data=cliffyfish, aes(x=Shadow, y=Frequency4, fill=Shadow)) +
  geom_bar(colour="black", stat="identity")

# Pond Fish

Frequency5 <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

pondyfish <- PondFish %>%
  mutate(Frequency5)

PONDfish <- ggplot(data=pondyfish, aes(x=Shadow, y=Frequency5, fill=Shadow)) +
  geom_bar(colour="black", stat="identity")

# Mouth Fish

Frequency6 <- c(1, 1, 1)

mouthyfish <- MouthFish %>%
  mutate(Frequency6)

MOUTHfish <- ggplot(data= mouthyfish, aes(x=Shadow, y=Frequency6, fill=Shadow)) +
  geom_bar(colour="black", stat="identity")


########################## Graph 3
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


####################### Graph2

# stock market graph information
# random pattern line chart
server <- function(input, output) {
  
  plotex <- reactive({
    if ("River_Fish" %in% input$fish) return(RIVERfish)
    if("Pier_Fish" %in% input$fish) return(PIERfish)
    if("Cliff_Fish" %in% input$fish) return(CLIFFfish)
    if("Mouth_Fish" %in% input$fish) return(MOUTHfish)
    if("Pond_Fish" %in% input$fish) return(PONDfish)
    if("Sea_Fish" %in% input$fish) return(SEAfish)
    
  })
  
  output$fishPlots <- renderPlotly({
    
    dataplots = plotex()
    print(dataplots)
    
  })
}


#######################Graph3
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


#######################Graph4
comparison_chart <- function(df, name) {
  df <- villagerData %>%
    arrange(Species) %>%
    select(Species, Personality) %>%
    filter(Species == name)
  
  chart <- ggplot(df, mapping = aes(
    x = Personality, 
    y = 1, 
    fill = Personality
  )) +
    geom_col(color = "black", size = 1, alpha = 0.4) +
    theme_grey() +
    theme(plot.background = element_rect(fill = "slategray3")) +
    scale_fill_manual(values = c("red", "blue", "green", "yellow", "orange", "purple", "pink", "grey")) +
    ggtitle("Different Personalities for Species Types") +
    xlab("Personality") +
    ylab("Number") 
  ggplotly(chart)
}

server <- function(input, output) {
  output$compare_one <- renderPlotly({
    comparison_chart(villagerData, input$species_one)
  })
  
  output$compare_two <- renderPlotly({
    comparison_chart(villagerData, input$species_two)
  })
}

