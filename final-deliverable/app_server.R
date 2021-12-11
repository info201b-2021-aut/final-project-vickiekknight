# app_server.R
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(shinyjs)
library(dplyr)



###Graph 1


##########################Graph 2(Fish)

fishdata <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/fish.csv", encoding = "UTF-8")
villagerData <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/villagers.csv")

#Create new DF
main_data <- fishdata %>%
  select("Where.How", "Shadow", "Color.1") %>%
  mutate()

# Sea
sea <- fishdata %>%
  select(Where.How, Shadow, Color.1) %>%
  filter(Where.How == "Sea") %>%
  select(1, 2, 3) %>%
  rename(SeaFish = Where.How)

# Pond

pond <- fishdata %>%
  select(Where.How, Shadow, Color.1) %>%
  filter(Where.How == "Pond") %>%
  select(1, 2, 3) %>%
  rename(PondFish = Where.How)


# River

River <- fishdata %>%
  select(Where.How, Shadow, Color.1) %>%
  filter(Where.How == "River") %>%
  select(1, 2, 3) %>%
  rename(RiverFish = Where.How)


# River (clifftop)

Cliff <- fishdata %>%
  select(Where.How, Shadow, Color.1) %>%
  filter(Where.How == "River (clifftop)" ) %>%
  select(1, 2, 3) %>%
  rename(CliffFish = Where.How)


# Pier

Pier <- fishdata %>%
  select(Where.How, Shadow, Color.1) %>%
  filter(Where.How == "Pier") %>%
  select(1, 2, 3) %>%
  rename(PierFish = Where.How)

# River (mouth)

Mouth <- fishdata %>%
  select(Where.How, Shadow, Color.1) %>%
  filter(Where.How == "River (mouth)") %>%
  rename(MouthFish = Where.How)


# table showing each detail of fish location

CliffFish <- Cliff %>%
  select(1, 2)
SeaFish <- sea %>%
  select(1, 2)
MouthFish <- Mouth %>%
  select(1, 2)
RiverFish <- River %>%
  select(1, 2)
PierFish <- Pier %>%
  select(1, 2)
PondFish <- pond %>%
  select(1, 2)

# Pie Chart of shadow length each fish

#Pier Fish

x <-  c(1, 1)
labels <-  c("X-Large", "XX-Large")

piepercent<- round(100*x/sum(x), 1)

pie(x, labels = piepercent, main = "Pier Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# Pond Fish

x <-  c(4, 3, 4, 1)
labels <-  c("X-Small", "Small", "Large", "X-Large")

piepercent<- round(100*x/sum(x), 1)


pie(x, labels = piepercent, main = "Pond Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Small", "Small", "Large", "X-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# River Fish

x <-  c(5, 5, 4, 3, 2)
labels <-  c("X-Small", "Small", "Medium", "Large", "X-Large")

piepercent<- round(100*x/sum(x), 1)


pie(x, labels = piepercent, main = "River Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Small", "Small", "Medium", "Large", "X-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()



# Mouth Fish

x <-  c(1, 1, 1)
labels <-  c("Large", "X-Large", "XX-Large")

piepercent<- round(100*x/sum(x), 1)


pie(x, labels = piepercent, main = "Mouth Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("Large", "X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# Cliff Fish

x <-  c(3, 1)
labels <-  c("Medium", "X-Large")

piepercent<- round(100*x/sum(x), 1)

pie(x, labels = piepercent, main = "Cliff Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("Medium", "X-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# seafish Create data for the graph.
x <-  c(3, 5, 6, 2, 5, 2, 3, 2)
labels <-  c("X-Small", "Small", "Medium", "Long", "Large W/Fin", "Large", "X-Large", "XX-Large")

piepercent<- round(100*x/sum(x), 1)


pie(x, labels = piepercent, main = "Sea Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Small", "Small", "Medium", "Long", "Large W/Fin", "Large", "X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


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

