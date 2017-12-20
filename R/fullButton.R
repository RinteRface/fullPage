#' Add a button
#'
#' @param outline,clear set outline or clear button.
#' @param ... any other element
#'
#' @examples
#' fullButton("button", href = "https://john-coene.com")
#'
#' @rdname button
#' @export
fullButton <- function(..., outline = FALSE, clear = FALSE){

  if(isTRUE(clear) && isTRUE(outline))
    stop("can online set outline or clear, not both", call. = FALSE)

  cl <- "button"
  if(isTRUE(outline)) cl <- paste(cl, "button-outline")
  if(isTRUE(clear)) cl <- paste(cl, "button-clear")

  shiny::tags$a(
    class = cl,
    ...
  )
}

#' @rdname button
#' @export
pageButton <- fullButton

#' @rdname button
#' @export
multiButton <- fullButton
