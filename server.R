# Fortune magazine publishes a list of the world's billionaires each year. The 1992 list includes 233 individuals. 
# Their wealth, age, and geographic location (Asia, Europe, Middle East, United States, and Other) are reported.
# Define a server for the Shiny App

library(shiny)
library(faraway)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    
    #Using the fortune database from the faraway library
    attach(fortune)
    
    # renaming the factors in region
    levels(fortune$region) <- c("Asia","Europe","Middle East","Other","United States" )
    
    # selecting the whole data by default
    selectedData <- fortune
    
    # Subset data by region depending on which checkbox is selected
    if(input$asia)
    { selectedData <- subset(fortune, region=='Asia')}
    if(input$europe)
    { selectedData <- subset(fortune, region=='Europe')}
    if(input$middle_east)
    { selectedData <- subset(fortune, region=='Middle East')}
    if(input$other)
    { selectedData <- subset(fortune, region=='Other')}
    if(input$united_states)
    { selectedData <- subset(fortune, region=='United States')}
    
    #Using ggplot to plot selected data
    ggplot(selectedData, aes(age,wealth)) + geom_point(aes(color=region),size=3)
    
          
        
  })
})

