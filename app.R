#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    selectInput(inputId = "dataset", label = "Dataset", choices = ls(package:datasets)), 
    verbatimTextOutput("Summary"),
    tableOutput("table")

)

# Define server logic required to draw a histogram
server <- function(input, output, session){
    
    # create reactive expression to fetch dataset
    dataset <- reactive({
        get(input$dataset, "package:datasets")
    })
    
    output$summary <- renderPrint({
        summary(dataset())
    })
    
    output$table <- renderTable({
        dataset()
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
