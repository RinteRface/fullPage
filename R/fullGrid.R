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

#' @rdname fullGrid
#' @export
pageRow <- fullRow

#' @rdname fullGrid
#' @export
pageColumn <- fullColumn

#' @rdname fullGrid
#' @export
multiRow <- fullRow

#' @rdname fullGrid
#' @export
multiColumn <- fullColumn
