[![Travis build status](https://travis-ci.org/RinteRface/fullPage.svg?branch=master)](https://travis-ci.org/RinteRface/fullPage)

# fullPage

![](http://rinterface.com/inst/images/shinybulma.svg)

Many of the amazing works of [Álvaro Trigo](https://alvarotrigo.com/) for Shiny!

* [Install](#install)
* [Demos](#examples)
* [Features](#features)
* [Examples](#examples)
    * [fullPage](#fullPage-1)
    * [pagePiling](#pagePiling)
    * [multiScroll](#multiScroll)
* [Callbacks](#callbacks)

![FullPage](fullPage.gif)

## Installation

``` r
# install.packages("remotes")
remotes::install_github("JohnCoene/fullPage")
```

## Features

* [fullPage.js](https://github.com/alvarotrigo/fullPage.js/) -- functions starting with `full`.
* [pagePiling.js](https://github.com/alvarotrigo/pagePiling.js/) -- functions starting with `page`.
* [multiScroll.js](https://github.com/alvarotrigo/multiscroll.js) -- functions starting with `multi`.

All ship with:

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
