#' Create multi sections
#'
#' Create multi page sides.
#'
#' @param align text alignement passed to \code{CSS}, takes \code{left}, \code{right} or \code{center}.
#' @param ... any element.
#'
#' @details Only use one of each in \code{\link{multiPage}}.
#'
#' @rdname sides
#' @export
multiLeft <- function(..., align = NULL){
  div <- shiny::tags$div(
    class = "ms-left",
    ...
  )

  if(!is.null(align))
    div <- shiny::tagAppendAttributes(div, style = paste0("text-align: ", align, ";"))

  div
}

#' @rdname sides
#' @export
multiRight <- function(..., align = NULL){
  div <- shiny::tags$div(
    class = "ms-right",
    ...
  )

  if(!is.null(align))
    div <- shiny::tagAppendAttributes(div, style = paste0("text-align: ", align, ";"))

  div
}
