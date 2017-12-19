#' Add grid elements
#'
#' @param ... any element.
#'
#' @rdname fullGrid
#' @export
fullRow <- function(...){
  shiny::tags$div(
    class = "row",
    ...
  )
}

#' @rdname fullGrid
#' @export
fullColumn <- function(...){
  shiny::tags$div(
    class = "column",
    ...
  )
}
