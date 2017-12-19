#' Add a button
#'
#' @param outine if \code{TRUE} builds button outline.
#' @param clear if \code{TRUE} builds clear button.
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
