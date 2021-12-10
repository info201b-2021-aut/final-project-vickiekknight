# app_server.R
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(shinyjs)
library(dplyr)



###Graph (Fish)
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


##Graph
