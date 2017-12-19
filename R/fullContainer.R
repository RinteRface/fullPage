#' Add a container
#'
#' @param ... any element.
#'
#' @export
fullContainer <- function(...){
  shiny::tags$div(
    class = "container",
    ...
  )
}
