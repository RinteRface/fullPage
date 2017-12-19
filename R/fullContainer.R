#' Add a container
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
