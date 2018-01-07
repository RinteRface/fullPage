#' Create multi sections
#'
#' Create multi page sides; left and right.
#'
#' @param align text alignment passed to \code{CSS}, takes \code{left}, \code{right} or \code{center}.
#' @param ... any element.
#'
#' @details Only use one of each in \code{\link{multiPage}}.
#'
#' @examples
#' if(interactive()){
#'   library(shiny)
#'
#'   ui <- multiPage(
#'     multiLeft(
#'       multiSection(
#'         h1("Left")
#'       ),
#'       multiSection(
#'         h1("Left Again")
#'       )
#'     ),
#'     multiRight(
#'       multiSection(
#'         h1("Right")
#'       ),
#'       multiSection(
#'         h1("Right again")
#'       )
#'     )
#'   )
#'
#'   server <- function(input, output){}
#'
#'   shinyApp(ui, server)
#' }
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
