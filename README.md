[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/fullPage.svg?branch=master)](https://travis-ci.org/JohnCoene/fullPage)

# fullPage

[fullPage.js](https://github.com/alvarotrigo/fullPage.js) for Shiny.

## Installation

You can install fullPage from github with:

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/fullPage")
```

## Info

Includes:

* [fullPage.js](https://github.com/alvarotrigo/fullPage.js/)
* [pagePiling.js](https://github.com/alvarotrigo/pagePiling.js/)
* [Milligram](https://milligram.io/)

## Example

Full Example

``` r
library(shiny)

options <- list(
  sectionsColor = c('#f2f2f2', '#4BBFC3', '#7BAABE'),
  parallax = TRUE
)

ui <- fullPage(
  menu = c("Full Page" = "link1",
           "Sections" = "link2",
           "Slides" = "section3",
           "backgrounds" = "section4",
           "Background Slides" = "section5"),
  opts = options,
  fullSection(
    center = TRUE,
    menu = "link1",
    tags$h1("fullPage.js meets Shiny")
  ),
  fullSection(
    menu = "link2",
    fullContainer(
      fullRow(
        fullColumn(
          h3("Column 1"),
          selectInput(
          "dd",
          "data points",
          choices = c(10, 20, 30)
          )
        ),
        fullColumn(
          plotOutput("hist")
        ),
        fullColumn(
          plotOutput("plot")
        )
      )
    )
  ),
  fullSection(
    menu = "section3",
    fullSlide(
      fullContainer(
        center = TRUE,
        h3("With container"),
        plotOutput("slideplot2"),
        shiny::verbatimTextOutput("containerCode")
      )
    ),
    fullSlide(
      center = TRUE,
      h3("Without container"),
      plotOutput("slideplot1")
    )
  ),
  fullSectionPlot(
    menu = "section4",
    center = TRUE,
    "fp",
    h3("Background plots"),
    fullContainer(
      sliderInput(
        "fpInput",
        label = "Input",
        min = 10,
        max = 100,
        value = 74
      )
    )
  ),
  fullSection(
    menu = "section5",
    fullSlidePlot(
      "slideSectionPlot1",
      center = TRUE,
      h1("Slide background plot")
    ),
    fullSlidePlot(
      "slideSectionPlot2"
    )
  )
)

server <- function(input, output){

  output$plot <- renderPlot({
    hist(rnorm(input$dd, 1, 10))
  })

  output$hist <- renderPlot({
    hist(rnorm(input$dd, 1, 10))
  })

  output$slideplot1 <- renderPlot({
    plot(mtcars$mpg, mtcars$drat)
  })

  output$slideplot2 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })

  output$fp <- renderPlot({
    par(bg="gray")
    hist(rnorm(input$fpInput, 1, 10))
  })

  output$containerCode <- renderText({
    "fullSlide(
      fullContainer(...)
    )"
  })

  output$slideSectionPlot1 <- renderPlot({
    par(bg="gray")
    hist(rnorm(50, 1, 20))
  })

  output$slideSectionPlot2 <- renderPlot({
    par(bg="gray")
    hist(rnorm(50, 1, 25))
  })
}

shinyApp(ui, server)
```
