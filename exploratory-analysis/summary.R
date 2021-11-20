# Summary Information about the Animal Crossing Villagers

villagers <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vickiekknight/main/data/villagers.csv?token=ARNLJ2W2CFCUMHVSEHBDSIDBUGAYG")


# number of different species 
species <- villagers[, 2]
diff_species <- unique(species)
num_diff_species <- length(diff_species)
  # There are 35 different kind of villager species.

# number of different personality traits
personality <- villagers[, 4]
diff_personality <- unique(personality)
num_diff_personality <- length(diff_personality)
  # 8 different kinds of personality traits.

# how many villagers there are in total
num_villagers <- nrow(villagers)
  # There are 391 villagers in total.

# most common favorite song of the villagers
fav_song <- villagers[, 8]
max_fav_song <- max(fav_song)
  # The most common favorite song is "Wandering."

# least common hobby of the villagers
hobby <- villagers[, 5]
min_hobby <- min(hobby)
  # Least common hobby is "Education."

# stores all summary information into a list 
summary_info <- list()
summary_info$num_diff_species <- length(diff_species)
summary_info$num_diff_personality <- length(diff_personality)
summary_info$num_villagers <- nrow(villagers)
summary_info$max_fav_song <- max(fav_song)
summary_info$min_hobby <- min(hobby)
