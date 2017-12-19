#' Add a container
#'
#' @export
fullContainer <- function(...){
  shiny::tags$div(
    class = "container",
    ...
  )
}
