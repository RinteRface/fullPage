#' Use plot as background
#'
#' @export
fullPlot <- function(outputId, ..., menu = NULL, center = FALSE, background = "rgba(255,255,255,0.5)"){
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
    css <- paste0(".shiny-input-container{background:", background,";}")

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
