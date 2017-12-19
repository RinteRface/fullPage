#' Add a card
#'
#' Created a card
#'
#' @param ... your cards, see \code{\link{fullCard}}.
#'
#' @rdname fc
#' @export
fullCards <- function(...){
  shiny::tags$div(
    class = "cards",
    ...
  )
}

#' @rdname fc
#' @export
fullCard <- function(..., header = NULL, footer = NULL){

  if(!is.null(header)){
    header <- shiny::tags$h5(
      class = "card-header",
      header
    )
  }

  body <- shiny::div(
    class = "card-content",
    ...
  )

  if(!is.null(header)){
    footer <- shiny::tags$h5(
      class = "card-footer center text-center",
      footer
    )
  }

  shiny::tags$div(
    class = "card",
    header,
    body,
    footer
  )
}
