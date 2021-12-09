# Load libraries to make them available
library("shiny")

# Source 'app_ui.R' and 'app_server.R' files.
source("app_ui.R")
source("app_server.R")

# Creating shinyApp
shinyApp(ui = ui, server = server)
