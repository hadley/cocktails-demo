library(shiny)
library(yaml)

# Load and parse the YAML data
cocktails <- yaml.load_file("cocktails.yaml")

# Define UI for the application
ui <- fluidPage(
  includeCSS("www/styles.css"),
  titlePanel("Cocktail Selector"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "primary_spirit",
        "Primary Spirit:",
        choices = c("All", unique(sapply(cocktails, function(x) x$`primary-spirit`))),
        selected = "All"
      ),
      checkboxGroupInput(
        "flavour_profile",
        "Flavour Profile:",
        choices = unique(unlist(sapply(cocktails, function(x) x$flavour)))
      )
    ),
    mainPanel(
      uiOutput("cocktail_list")
    )
  )
)

# Define server logic required to filter and display cocktails
server <- function(input, output) {

  selected_cocktails <- reactive({
    # Filter by primary spirit
    filtered <- cocktails
    if (input$primary_spirit != "All") {
      filtered <- filtered[sapply(filtered, function(x) x$`primary-spirit`) == input$primary_spirit]
    }

    # Filter by flavour profile
    if (!is.null(input$flavour_profile) && length(input$flavour_profile) > 0) {
      filtered <- filtered[sapply(filtered, function(x) all(input$flavour_profile %in% x$flavour))]
    }

    # Randomly select 3 cocktails if more than 3 are available
    if (length(filtered) > 3) {
      filtered <- sample(filtered, 3)
    }

    return(filtered)
  })

  output$cocktail_list <- renderUI({
    cocktail_output <- lapply(selected_cocktails(), function(cocktail) {
      fluidRow(
        column(12,
          h3(cocktail$name),
          p(cocktail$description),
          h4("Ingredients:"),
          tags$ul(lapply(cocktail$ingredients, function(ing) {
            tags$li(paste0(ing[[1]], " ", ing[[2]], ", ", paste0(ing[-(1:2)], collapse = ",")))
          })),
          h4("Instructions:"),
          p(paste("Construction method:", cocktail$construction)),
          p(paste("Garnish:", cocktail$garnish)),
          hr()
        )
      )
    })
    do.call(tagList, cocktail_output)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
