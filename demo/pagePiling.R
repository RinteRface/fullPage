library(fullPage)
library(shiny)

ui <- pagePiling(
  center = TRUE,
  sections.color = c(
    "#4B97D2",
    "#FFE6F4",
    "#FFBDE1",
    "#FFBDE1",
    "#AEFFAC",
    "#C490F4",
    "#4B97D2"
  ),
  pageTheme("maroon"),
  menu = c(
    "Piling" = "intro",
    "Grid" = "grid",
    "Plots" = "backgrounds",
    "Images" = "image",
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
        h2("Columns"),
        p("plot on the right on larger screens"),
        p("And on below on mobile.")
      ),
      pageColumn(
        plotOutput("plot1")
      )
    )
  ),
  pageSectionPlot(
    "plot2",
    menu = "backgrounds",
    pageContainer(
      pageRow(
        pageColumn(),
        pageColumn(
          h1("Background Plot"),
          sliderInput(
            "slider",
            "Overlay input",
            min = 50,
            max = 250,
            value = 100
          )
        ),
        pageColumn()
      )
    )
  ),
  pageSectionImage( # will not show in viewer, open in browser
    menu = "image",
    img = paste0(
      "https://raw.githubusercontent.com/alvarotrigo/",
      "fullPage.js/master/examples/imgs/bg2.jpg"),
    h1("Image background")
  ),
  pageSection(
    menu = "themes",
    pageContainer(
      h1("16 themes"),
      verbatimTextOutput("themes")
    )
  ),
  pageSection(
    h1("Buttons", style = "color:#f3f3f3;"),
    pageButtonDown("Next Section")
  ),
  pageSection(
    menu = "sisters",
    pageContainer(
      h1("Sister functions", style = "color:#f3f3f3;"),
      verbatimTextOutput("sisters")
    )
  )
)

server <- function(input, output){

  output$plot1 <- renderPlot({
    par(bg = "#FFE6F4")
    plot(mtcars$wt, mtcars$mpg)
  })

  output$plot2 <- renderPlot({
    par(bg = "#FFBDE1")
    hist(rnorm(input$slider, mean = 25, sd = 5))
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
