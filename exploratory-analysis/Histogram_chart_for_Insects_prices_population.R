library(ggplot2)
library(readxl)
library(tidyverse)
library(dplyr)

Insects <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/insects.csv?token=AV5GB6PTJDSSBO4XXHQCXSDBUG3PG", encoding = "UTF-8")


p <- ggplot(Insects, aes(x = Sell)) + 
  geom_histogram(aes(y=..density..), color="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666")

p

p+ geom_vline(aes(xintercept=mean(Insects)),
                   color="red", linetype = "dashed", size = 1)

# plot(Insects_sell_price_density_plot)
