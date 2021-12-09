# Load the shiny
library("shiny")

## Source "app_ui.R" and "app_server.R" files.
source("app_ui.R")
source("app_server.R")

### Create a new shinyApp
shinyApp(ui = ui, server = server)
