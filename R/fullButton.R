#' Add a button
#'
#' @param outline,clear set outline or clear button.
#' @param tag button tag, generally \code{a} or \code{button}.
#' @param ... any other element
#'
#' @export
fullButton <- function(..., outline = FALSE, clear = FALSE, tag = shiny::a()){

  if(isTRUE(clear) && isTRUE(outline))
    stop("can online set outline or clear, not both", call. = FALSE)

  cl <- "button"
  if(isTRUE(outline)) cl <- paste(cl, "button-outline")
  if(isTRUE(clear)) cl <- paste(cl, "button-clear")

  tag(
    class = cl,
    ...
  )
}
