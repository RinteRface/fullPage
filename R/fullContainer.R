#' Add containers
#'
#' Add a container.
#'
#' @details Pass within your grid, sections or slides.
#'
#' @examples
#' if(interactive()){
#'   library(shiny)
#'
#'   ui <- fullPage(
#'     center = TRUE,
#'     fullSection(
#'       h1("Containers")
#'     ),
#'     fullSection(
#'       h1("Without container"),
#'       plotOutput("plot1")
#'     ),
#'     fullSection(
#'       fullContainer(
#'         h1("With container"),
#'         plotOutput("plot2"),
#'         pre(
#'           code(
#'             "fullContainer()"
#'           )
#'         )
#'       )
#'     )
#'   )
#'
#'   server <- function(input, output){
#'     output$plot1 <- renderPlot({
#'       plot(mtcars$wt, mtcars$mpg)
#'     })
#'
#'     output$plot2 <- renderPlot({
#'       plot(mtcars$wt, mtcars$mpg)
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @param ... any element.
#'
#' @rdname container
#' @export
fullContainer <- function(...){
  shiny::tags$div(
    class = "container",
    ...
  )
}

#' @rdname container
#' @export
pageContainer <- fullContainer

#' @rdname container
#' @export
multiContainer <- fullContainer
