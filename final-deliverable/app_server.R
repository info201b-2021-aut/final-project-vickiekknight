# app_server.R
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)



###Graph (Fish)

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

png(file = "pierfish_percentage_legends.jpg")

pie(x, labels = piepercent, main = "Pier Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# Pond Fish

x <-  c(4, 3, 4, 1)
labels <-  c("X-Small", "Small", "Large", "X-Large")

piepercent<- round(100*x/sum(x), 1)

png(file = "pondfish_percentage_legends.jpg")

pie(x, labels = piepercent, main = "Pond Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Small", "Small", "Large", "X-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# River Fish

x <-  c(5, 5, 4, 3, 2)
labels <-  c("X-Small", "Small", "Medium", "Large", "X-Large")

piepercent<- round(100*x/sum(x), 1)

png(file = "riverfish_percentage_legends.jpg")

pie(x, labels = piepercent, main = "River Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Small", "Small", "Medium", "Large", "X-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()



# Mouth Fish

x <-  c(1, 1, 1)
labels <-  c("Large", "X-Large", "XX-Large")

piepercent<- round(100*x/sum(x), 1)

png(file = "mouthfish_percentage_legends.jpg")

pie(x, labels = piepercent, main = "Mouth Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("Large", "X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# Cliff Fish

x <-  c(3, 1)
labels <-  c("Medium", "X-Large")

piepercent<- round(100*x/sum(x), 1)

png(file = "clifffish_percentage_legends.jpg")

pie(x, labels = piepercent, main = "Cliff Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("Medium", "X-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()


# seafish Create data for the graph.
x <-  c(3, 5, 6, 2, 5, 2, 3, 2)
labels <-  c("X-Small", "Small", "Medium", "Long", "Large W/Fin", "Large", "X-Large", "XX-Large")

piepercent<- round(100*x/sum(x), 1)

png(file = "seafish.jpg")

pie(x, labels = piepercent, main = "Sea Fish Size pie chart",col = rainbow(length(x)))
legend("topright", c("X-Small", "Small", "Medium", "Long", "Large W/Fin", "Large", "X-Large", "XX-Large"), cex = 0.8,
       fill = rainbow(length(x)))

dev.off()



###Graph


##Graph
