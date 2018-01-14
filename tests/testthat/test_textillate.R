library(shiny)
library(fullPage)
library(billboard)

ui <- fullPage(
  fullSection(
    menu = "Section1",
    class = "active",
    h1("FullPage meets textillate")
  ),
  fullSection(
    menu = "billboardSection",
    billboardOutput("bb")
  ),
  fullSection(
    menu = "section3",
    h1("See pagePiling and multiScroll")
  )
)

server <- function(input, output){
  output$bb <- renderBillboard({
    mtcars %>%
      b_board() %>%
      b_line(drat)
  })
}

shinyApp(ui, server)
