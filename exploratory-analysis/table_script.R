# Libraries
library(tidyverse)
library(dplyr)

# Data set
villagers <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/villagers.csv?token=AV4NGSAV4QVAYKS6XWJDRITBUG3VA")
# View(villagers)

# Function `summary_table` that takes in a parameter(name of dataset) and
# returns a new dataset, sorted in a neat way and eliminating unnecessary 
# columns and values
summary_table <- function(dataset) {
  summary_dataset <- dataset %>%
    group_by(Species) %>%
    rename("Color" = "Color.1") %>%
    select(Species, Name, Gender, Personality, Hobby, Birthday, Favorite.Song) %>%
    mutate(Character.type = paste(Personality, Hobby, sep = ", "))
  return(summary_dataset)
}

villagers <- summary_table(villagers)
# View(villagers)