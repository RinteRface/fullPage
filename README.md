# fullPage <img src="http://rinterface.com/inst/images/fullPage.svg" width="200px" align="right"/>
[![Travis build status](https://travis-ci.org/RinteRface/fullPage.svg?branch=master)](https://travis-ci.org/RinteRface/fullPage) [![CRAN status](https://www.r-pkg.org/badges/version/fullPage)](https://cran.r-project.org/package=fullPage)

> Many of the amazing works of [Álvaro Trigo](https://alvarotrigo.com/) for Shiny!

* [Install](#installation)
* [Demos](#demos)
* [Features](#features)
* [Website](http://fullpage.rinterface.com/)
* [Examples](#demos)
* [Callbacks](#callbacks)

![FullPage](fullPage.gif)

## Installation

``` r
# install.packages("remotes")
remotes::install_github("RinteRface/fullPage")
```

## Features

Includes the following frameworks:

* [fullPage.js](https://github.com/alvarotrigo/fullPage.js/) -- functions starting with `full`.
* [pagePiling.js](https://github.com/alvarotrigo/pagePiling.js/) -- functions starting with `page`.
* [multiScroll.js](https://github.com/alvarotrigo/multiscroll.js) -- functions starting with `multi`.

All ships with:

* [Milligram](https://milligram.io/) *grid, button, typography, and themes.*

## Demos

Online:

* [fullPage.js](https://shiny.john-coene.com/fullPage)
* [pagePiling.js](https://shiny.john-coene.com/pagePiling)
* [multiScroll.js](https://shiny.john-coene.com/multiScroll)


Locally:

```r
demo("fullPage", package = "fullPage")
demo("pagePiling", package = "fullPage")
demo("multiPage", package = "fullPage")
```

## Callbacks

**fullPage**

- `input$slide_origin`: origin slide
- `input$slide_destination`: destination slide
- `input$slide_direction`: scroll direction

**pagePiling & multiScroll**

- `input$slide_anchor`: slide anchor
- `input$slide_index`: slide index

```r
library(shiny)
library(fullPage)

ui <- fullPage(
  fullSection(
    menu = "first",
    center = TRUE,
    h1("Callbacks")
  ),
  fullSection(
    menu = "second",
    center = TRUE,
    h3("Slice"),
    verbatimTextOutput("slide")
  )
)

server <- function(input, output){
  
  output$slide <- renderPrint({
    input$slide_origin # returns menu
  })
  
}

shinyApp(ui, server)
```
