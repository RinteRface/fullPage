#' Setup a multiscroll page
#'
#' @inheritParams fullPage
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' ui <- multiPage(
#'   multiLeft(
#'     multiSection(
#'       center = TRUE,
#'       h1("Multiple")
#'     ),
#'     multiSection(
#'       numericInput(
#'         "max",
#'         "Maximum",
#'         min = 50,
#'         max = 250,
#'         value = 10
#'       )
#'     )
#'   ),
#'   multiRight(
#'     multiSection(
#'       center = TRUE,
#'       h1("scroll")
#'     ),
#'     multiSection(
#'       center = TRUE,
#'       plotOutput("plot")
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'   output$plot <- renderPlot({
#'     hist(rnorm(100, 20, input$max))
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @rdname mp
#' @export
multiPage <- function(..., opts = NULL, menu = NULL){

  # build menu
  if(!is.null(menu)){

    # unordered list ot append to
    ul <- shiny::tags$ul(
      id = "tocMenu"
    )

    # loop through items add list
    for(i in 1:length(menu)){

      if(!length(names(menu)))
        stop("Menu must be a named vector", call. = FALSE)

      li <- shiny::tags$li(
        `data-menuanchor` = unname(menu[i]),
        shiny::tags$a(
          href = paste0("#", unname(menu[i])),
          names(menu)[i]
        )
      )

      # append to unordered list
      ul <- shiny::tagAppendChild(ul, li)
    }

    # add anchors to JS
    if(!inherits(opts, "list")) opts <- list()

    # add menu anchors
    opts$anchors <- unname(menu)
    opts$menu <- "#tocMenu"

    # build body
    body <- shiny::tags$body(
      ul,
      shiny::tags$div(
        id = "multiscrollshiny",
        ...
      ),
      shiny::tags$script(
        build_opts_mp(opts)
      )
    )
  } else { # no menu
    body <- shiny::tags$body(
      shiny::tags$div(
        id = "multiscrollshiny",
        ...
      ),
      shiny::tags$script(
        build_opts_mp(opts)
      )
    )
  }

  shiny::tags$html(
    shiny::tags$head(
      shiny::includeCSS(
        system.file("css/jquery.multiscroll.min.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/normalize.min.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/milligram.min.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/styles.css", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.easing.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.multiscroll.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.multiscroll.extensions.min.js", package = "fullPage")
      )
    ),
    body
  )
}

#' @rdname mp
#' @export
multiSection <- function(..., menu = NULL, center = FALSE){
  div <- shiny::tags$div(
    class = "ms-section",
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(isTRUE(center))
    div <- shiny::tagAppendAttributes(div, style = "text-align: center;")

  div
}
