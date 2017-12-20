#' Create multi sections
#'
#' @param ... any element.
#'
#' @rdname sides
#' @export
multiLeft <- function(...){
  shiny::tags$div(
    class = "ms-left",
    ...
  )
}

#' @rdname sides
#' @export
multiRight <- function(...){
  shiny::tags$div(
    class = "ms-right",
    ...
  )
}
