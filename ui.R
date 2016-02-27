# Define the overall UI
shinyUI(bootstrapPage(
  
  #The header panel is defined here
  titlePanel("Billionaires' wealth and age [1992]"),
    
  sidebarPanel("This shiny app will show you the age and wealth of billionaires per region. 
               Select a region from the checkbox below. If no checkbox is selected all regions
               are displayed."),
  
  # Set of check boxes for the user to select the region
  # By default all regions are selected
  checkboxInput(inputId = "asia",
                label = strong("Asia"),
                value = FALSE),
  
  checkboxInput(inputId = "europe",
                label = strong("Europe"),
                value = FALSE),
  
  checkboxInput(inputId = "middle_east",
                label = strong("Middle East"),
                value = FALSE),
  
  checkboxInput(inputId = "united_states",
                label = strong("United States"),
                value = FALSE),
  
  checkboxInput(inputId = "other",
                label = strong("Other"),
                value = FALSE),

   #Rendering the plot
  plotOutput(outputId = "main_plot", height = "300px")
)
)