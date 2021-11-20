read.csv("https://github.com/info201b-2021-aut/final-project-vickiekknight/blob/main/data/fish.csv")
read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/fish.csv?token=AV5HVQNHAIBXMFXL5OXYBT3BUGF7E")
fishdata <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/fish.csv?token=AV5HVQNHAIBXMFXL5OXYBT3BUGF7E")
villagerdata <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/villagers.csv?token=AV5HVQPCCX4BN6YQ6PXVXYLBUGGDG")
insectdata <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/insects.csv?token=AV5HVQLGIXWZMQKG3OBCXOTBUGGFO")

# Does the place where fish are caught effect the selling price of the fish ?
library(ggplot2)
library(dplyr)

#River Fish

riverFish <- fishdata %>%
  select(Sell, Where.How) %>%
  filter(Where.How == "River") %>%
  arrange(Sell) %>%
  mutate(riverFish, River = Sell) %>%
  select(River) %>%
  sum(riverFish)
  
#Pond Fish

pondFish <- fishdata %>%
  select(Sell, Where.How) %>%
  filter(Where.How == "Pond") %>%
  arrange(Sell) %>%
  mutate(pondFish, Pond = Sell) %>%
  select(Pond) %>%
  sum(pondFish)

#Sea Fish

seaFish <- fishdata %>%
  select(Sell, Where.How) %>%
  filter(Where.How == "Sea") %>%
  arrange(Sell) %>%
  mutate(seaFish, Sea = Sell) %>%
  select(Sea) %>%
  sum(seaFish)

PriceAll = seaFish + pondFish + riverFish

pondFish / PriceAll
riverFish / PriceAll
seaFish / PriceAll

pie(riverFisPriceAllpie(riverFish, pondFish, seaFish)

prices <- c(48840, 137860, 232900)
lbls <- c("Pond Fish", "River Fish", "Sea Fish")
pct <- round(prices/sum(prices)*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "%", sep="")
pie(prices,labels = lbls,
    col = rainbow(length(lbls)),
    main="Chart of Fish Price Diversification")

