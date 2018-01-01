library(fullPage)
library(shiny)

ui <- pagePiling(
  center = TRUE,
  sections.color = c(
    "#4B97D2",
    "#FFE6F4",
    "#FFBDE1",
    "#AEFFAC",
    "#C490F4",
    "#4B97D2"
  ),
  pageTheme("gray"),
  menu = c(
    "Piling" = "intro",
    "Grid" = "grid",
    "Backgrounds" = "backgrounds",
    "Themes" = "themes",
    "Buttons" = "buttons",
    "sisters" = "sisters"
  ),
  pageSection(
    menu = "intro",
    h1("pagePiling.js meets Shiny!", style = "color:#f3f3f3;")
  ),
  pageSection(
    menu = "grid",
    h1("Grid"),
    pageRow(
      pageColumn(
        h2("Columns")
      ),
      pageColumn(
        plotOutput("plot1")
      )
    )
  ),
  pageSectionPlot(
    "plot2",
    h1("Background Plot")
  ),
  pageSection(
    menu = "themes",
    h1("16 themes"),
    verbatimTextOutput("themes")
  ),
  pageSection(
    h1("Buttons"),
    pageButtonDown("Next Section")
  ),
  fullSection(
    menu = "sisters",
    h1("Sister functions"),
    verbatimTextOutput("sisters")
  )
)

server <- function(input, output){

  output$plot1 <- renderPlot({
    par(bg = "#FFE6F4")
    plot(mtcars$wt, mtcars$mpg)
  })

  output$plot2 <- renderPlot({
    par(bg = "#FFBDE1")
    hist(rnorm(100, mean = 25, sd = 5))
  })

  output$plot3 <- renderPlot({
    par(bg = "#FFADB2")
    plot(1:nrow(mtcars), mtcars$drat, type = "l")
  })

  output$sisters <- renderText({
    '# See those
    demo("fullPage", package = "fullPage")
    demo("multiPage", package = "fullPage")'
  })

  output$themes <- renderText({
    'pageTheme()'
  })
}

shinyApp(ui, server)
