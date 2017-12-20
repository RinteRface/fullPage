#' Create multi sections
#'
#' Create multi page side.
#'
#' @param ... any element.
#'
#' @details Only use one of each in \code{\link{multiPage}}.
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
