#' Add grid elements
#'
#' Add rows and columns.
#'
#' @param ... any element.
#' @param width Width of column.
#'
#' @details Wrap columns in row function, see examples.
#'
#' @examples
#' if(interactive()){
#'   library(shiny)
#'
#'   ui <- pagePiling(
#'     center = TRUE,
#'     sections.color = c("#f3f3f3", "#f4f4f4"),
#'     pageSection(
#'       h1("Grid")
#'     ),
#'     pageSection(
#'       h1("Columns"),
#'       pageRow(
#'         pageColumn(
#'           h2("First Column"),
#'           p("Resize your screen to see columns in action.")
#'         ),
#'         pageColumn(
#'           h2("Second Column"),
#'           numericInput("obs", "observations", value = 20)
#'         ),
#'         pageColumn(
#'           h2("Thirs Column"),
#'           plotOutput("plot")
#'         )
#'       )
#'     )
#'   )
#'
#'   server <- function(input, output){
#'     output$plot <- renderPlot({
#'       par(bg = "#f4f4f4")
#'       hist(rnorm(input$obs, 10, 3))
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @author John Coene, \email{jcoenep@@gmail.com}
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
fullColumn <- function(..., width = 6){
  shiny::tags$div(
    class = paste0("col-md-", width),
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
