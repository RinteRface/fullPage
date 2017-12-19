#' Setup page
#'
#' @examples
#' library(shiny)
#'
#' ui <- fullPage(
#'   fullSection(
#'     tags$h1("fullPage.js meets Shiny")
#'   ),
#'   fullSection(
#'     plotOutput("plot")
#'   ),
#'   fullSection(
#'     fullRow(
#'       fullColumn(
#'         shiny::tags$h1("Column 1")
#'       ),
#'       fullColumn(
#'         plotOutput("hist")
#'       ),
#'       fullColumn(),
#'       fullColumn()
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'   output$plot <- renderPlot({
#'     hist(rnorm(20, 1, 5))
#'   })
#'
#'   output$hist <- renderPlot({
#'     hist(rnorm(20, 1, 5))
#'   })
#' }
#'
#' shinyApp(ui, server)
#'
#' @rdname fp
#' @export
fullPage <- function(...){

  shiny::tags$html(
    shiny::tags$head(
      shiny::includeCSS(
        system.file("css/jquery.fullpage.min.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/normalize.min.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/milligram.min.css", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery-easing.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/scrolloverflow.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.fullpage.extensions.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.fullpage.min.js", package = "fullPage")
      )
    ),
    shiny::tags$body(
      shiny::tags$div(
        id = "fullpageshiny",
        ...
      ),
      shiny::includeScript(
        system.file("js/custom.js", package = "fullPage")
      )
    )
  )
}

#' @rdname fp
#' @export
fullSection <- function(...){
  shiny::tags$div(
    class = "section",
    ...
  )
}

#' @rdname fp
#' @export
fullSlide <- function(...){
  shiny::tags$div(
    class = "slide",
    ...
  )
}


