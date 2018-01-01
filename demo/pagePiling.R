library(shiny)

options <- list(
  sectionsColor = c(
    "#074F57"
  )
)

ui <- pagePiling(
  opts = options,
  menu = c(
    "Piling" = "intro",
    "Grid" = "grid"
  ),
  pageSection(
    menu = "intro",
    h1("pagePiling.js meets Shiny!")
  ),
  pageSection(
    menu = "grid",
    h1("Grid"),
    pageRow(
      pageColumn(
        h2("Columns")
      ),
      pageColumn()
    )
  )
)

server <- function(input, output){

}

shinyApp(ui, server)
