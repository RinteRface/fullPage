library(fullPage)
library(shiny)

options <- list(
  sectionsColor = c(
    "#C3F3EC",
    "#FE9199",
    "#FFADB2",
    "#FFCAB1",
    "#C3F3EC",
    "#FE9199",
    "#FFADB2"
  )
)

ui <- fullPage(
  center = TRUE,
  opts = options,
  menu = c(
    "FullPage" = "intro",
    "Slides" = "slides",
    "Grid" = "grid",
    "Plots bg" = "plotbg",
    "Slides bg" = "slidebg",
    "Buttons" = "buttons",
    "Sisters" = "sisters"
  ),
  fullSection(
    menu = "intro",
    h1("fullPage.js meets Shiny.")
  ),
  fullSection(
    menu = "slides",
    fullSlide(
      h1("Slide 1")
    ),
    fullSlide(
      h1("Slide 2")
    )
  ),
  fullSection(
    menu = "grid",
    fullContainer(
      h1("Grid System"),
      fullRow(
        fullColumn(
          h2("Use Columns")
        ),
        fullColumn(
          plotOutput("plot1")
        )
      ),
      p("from Miligram*")
    )
  ),
  fullSectionPlot(
    "plot2",
    menu = "plotbg",
    fullContainer(
      h2("Background plots"),
      sliderInput(
        "input1",
        "Obs",
        min = 10,
        max = 500,
        step = 10,
        value = 250
      )
    )
  ),
  fullSection(
    menu = "slidebg",
    fullSlide(
      h2("Slide is here ->")
    ),
    fullSlidePlot(
      "plot3"
    )
  ),
  fullSection(
    menu = "buttons",
    fullContainer(
      h1("Include buttons"),
      fullButtonDown("Next Section", outline = TRUE)
    )
  ),
  fullSection(
    menu = "sisters",
    h1("Sister functions"),
    verbatimTextOutput("sistersDemo")
  )
)

server <- function(input, output){

  output$plot1 <- renderPlot({
    par(bg = "#FFADB2")
    plot(mtcars$wt, mtcars$mpg)
  })

  output$plot2 <- renderPlot({
    par(bg = "#F3F3F3")
    hist(rnorm(input$input1, mean = 25, sd = 5))
  })

  output$plot3 <- renderPlot({
    par(bg = "#FFADB2")
    plot(1:nrow(mtcars), mtcars$drat, type = "l")
  })

  output$sistersDemo <- renderText({
    '# See those
    demo("pagePiling", package = "fullPage")
    demo("multiPage", package = "fullPage")'
  })
}

shinyApp(ui, server)
