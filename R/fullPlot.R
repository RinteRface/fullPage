#' Use plot as background
#'
#' @param outputId id passed to \code{\link[shiny]{plotOutput}}.
#' @param ... any children element.
#' @param menu menu link.
#' @param center whether to center text horizontally.
#' @param background sets background to overlaying shiny inputs.
#'
#' @examples
#' library(shiny)
#'
#' ui <- fullPage(
#'   opts = list(sectionsColor = c('#4BBFC3', '#7BAABE')),
#'   fullSection(h1("Full section plots"), center = TRUE),
#'   fullSectionPlot(
#'     "myPlot2",
#'     center = TRUE,
#'     fullContainer(
#'       h2("With a title")
#'     )
#'   ),
#'   fullSectionPlot(
#'     "myPlot",
#'     center = TRUE,
#'     fullContainer(
#'       h3("Layer anything you want"),
#'       selectInput(
#'         "select",
#'         "Choose y",
#'         choices = c("mpg", "drat", "wt")
#'       )
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'
#'   output$myPlot <- renderPlot({
#'     plot(1:nrow(mtcars), mtcars[[input$select]])
#'   })
#'
#'   output$myPlot2 <- renderPlot({
#'     plot(1:nrow(mtcars), mtcars[[input$select]])
#'   })
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' @rdname fullPlot
#' @export
fullSectionPlot <- function(outputId, ..., menu = NULL, center = FALSE, background = "rgba(255,255,255,0.5)"){
  section <- fullSection(
    menu = menu,
    center = center,
    shiny::tags$div(
      class = "wrapper",
      plotOutput(outputId, height = "100vh"),
      shiny::tags$div(
        class = "in",
        ...
      )
    )
  )

  if(!is.null(background))
    css <- paste0(".in .shiny-input-container{background:", background,";}")

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          css
        )
      )
    ),
    section
  )
}

#' @rdname fullPlot
#' @export
fullSlidePlot <- function(outputId, ..., menu = NULL, center = FALSE, background = "rgba(255,255,255,0.5)"){
  section <- fullSlide(
    menu = menu,
    center = center,
    shiny::tags$div(
      class = "wrapper",
      plotOutput(outputId, height = "100vh"),
      shiny::tags$div(
        class = "in",
        ...
      )
    )
  )

  if(!is.null(background))
    css <- paste0(".in .shiny-input-container{background:", background,";}")

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          css
        )
      )
    ),
    section
  )
}
