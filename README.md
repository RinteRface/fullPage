[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/fullPage.svg?branch=master)](https://travis-ci.org/JohnCoene/fullPage)

# fullPage

![FullPage](http://john-coene.com/img/fullPage.gif)

Many of the amazing works of [Álvaro Trigo](https://alvarotrigo.com/) for Shiny!

* [Install](#install)
* [Demos](http://john-coene.com/packages/fullPage/)
* [Features](#features)
* [Examples](#examples)
    * [fullPage](#fullPage-1)
    * [pagePiling](#pagePiling)
    * [multiScroll](#multiScroll)

## Installation
``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/fullPage")
```

## Features

* [fullPage.js](https://github.com/alvarotrigo/fullPage.js/) -- functions starting with `full`.
* [pagePiling.js](https://github.com/alvarotrigo/pagePiling.js/) -- functions starting with `page`.
* [multiScroll.js](https://github.com/alvarotrigo/multiscroll.js) -- functions starting with `multi`.

**OR**

```r
demo("fullPage", package = "fullPage")
demo("pagePiling", package = "fullPage")
demo("multiPage", package = "fullPage")
```

All ship with:

* [Milligram](https://milligram.io/) *grid, button, typography*

## Examples

### fullPage

fullpage.js Example, functions start with `full`.

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

### pagePiling

pagePiling.js example, functions start with `page`.

```r
library(shiny)

options <- list(
  loopBottom = TRUE
)

ui <- pagePiling(
  sections.color = c('#f2f2f2', '#2C3E50', '#39C'),
  opts = options,
  menu = c("Section 1" = "section1",
           "Piling" = "section2",
           "Plots" = "section3",
           "Layers" = "section4"),
  pageSection(
    center = TRUE,
    menu = "section1",
    h1("Page piling")
  ),
  pageSection(
    menu = "section2",
    center = TRUE,
    h1("Section 2")
  ),
  pageSectionPlot(
    "plot",
    center = TRUE,
    menu = "section3",
    h1("Plot background")
  ),
  pageSectionPlot(
    "plot2",
    center = TRUE,
    menu = "section4",
    pageContainer(
      h1("Layer anything"),
      sliderInput(
        "bins",
        "Data Points",
        min = 100,
        max = 500,
        step = 25,
        value = 200
      )
    )
  )
)

server <- function(input, output){

  output$plot <- renderPlot({
    par(bg = "grey60")
    plot(mtcars$wt, mtcars$mpg)
  })

  output$plot2 <- renderPlot({
    par(bg = "grey80")
    hist(rnorm(input$bins, 100, 250))
  })
}

shinyApp(ui, server)
```

### multiScroll

multiscroll.js example, functions start with `multi`.

```r
library(shiny)

options <- list(
  sectionsColor = c("#4BBFC3", "#7BAABE", "lightgray")
)

ui <- multiPage(
  opts = options,
  menu = c("Multi Scroll" = "multiscroll",
           "Plots" = "plots",
           "Full Section plots" = "fullplots"),
  multiLeft(
    multiSection(
      center = TRUE,
      menu = "multiscroll",
      h1("Multiple")
    ),
    multiSection(
      menu = "plots",
      multiContainer(
        h1("Plot ->"),
        numericInput(
          "max",
          "Maximum",
          min = 50,
          max = 250,
          value = 10
        )
      )
    ),
    multiSectionPlot(
      menu = "fullplots",
      "fullPlot"
    )
  ),
  multiRight(
    multiSection(
      center = TRUE,
      h1("scroll")
    ),
    multiSection(
      center = TRUE,
      plotOutput("plot")
    ),
    multiSection(
      multiContainer(
        center = TRUE,
        h1("<- Full Section plot"),
        sliderInput(
          "number",
          "Data points",
          min = 50,
          max = 250,
          value = 10
        )
      )
    )
  )
)

server <- function(input, output){

  output$plot <- renderPlot({
    hist(rnorm(100, 20, input$max))
  })

  output$fullPlot <- renderPlot({
    par(bg = "gray")
    hist(rnorm(input$number, 20, 250))
  })
}

shinyApp(ui, server)
```
