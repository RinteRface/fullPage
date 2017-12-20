#' Setup a multiscroll page
#'
#' @inheritParams fullPage
#'
#' @details use the \code{menu} parameter on one "side" (\code{multiLeft} or \code{multiRight}) only;
#' No need to specify it twice, it would breaks things as it is a \code{CSS} id, see examples.
#'
#' Valid \code{opts}:
#' \itemize{
#'   \item{\code{verticalCentered} - boolean}
#'   \item{\code{scrollingSpeed} - numeric}
#'   \item{\code{easing} - character string, \href{jQuery UI}{http://jqueryui.com/} easing, i.e.: \code{easeInQuart}}
#'   \item{\code{sectionsColor} - character vector, i.e.: \code{c("blue", "red")}}
#'   \item{\code{navigation} - boolean}
#'   \item{\code{navigationPosition} - character string, takes \code{none}, \code{left}, or \code{right}}
#'   \item{\code{navigationColor} - character string, i.e.:"black"}
#'   \item{\code{navigationTooltips} - character vector, i.e.: \code{c("Tooltip 1", "Tooltip 2")}}
#'   \item{\code{loopBottom} - boolean}
#'   \item{\code{loopTop} - boolean}
#'   \item{\code{css3} - boolnean}
#'   \item{\code{paddingTop} - numeric, i.e.: 0}
#'   \item{\code{paddingBottom} - numeric, i.e.: 0}
#'   \item{\code{keyboardScrolling} boolean}
#'   \item{\code{touchSensitivity} - numeric, i.e.: 5}
#'   \item{\code{responsiveWidth} - numeric, i.e.: 0}
#'   \item{\code{responsiveHeight} - numeric, i.e.: 0}
#'   \item{\code{responsiveExpand} - boolean}
#' }
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' options <- list(
#'   sectionsColor = c("#4BBFC3", "#7BAABE", "lightgray")
#' )
#'
#' ui <- multiPage(
#'   opts = options,
#'   menu = c("Multi Scroll" = "multiscroll",
#'            "Plots" = "plots",
#'            "Full Section plots" = "fullplots"),
#'   multiLeft(
#'     multiSection(
#'       center = TRUE,
#'       menu = "multiscroll",
#'       h1("Multiple")
#'     ),
#'     multiSection(
#'       menu = "plots",
#'       multiContainer(
#'         h1("Plot ->"),
#'         numericInput(
#'           "max",
#'           "Maximum",
#'           min = 50,
#'           max = 250,
#'           value = 10
#'         )
#'       )
#'     ),
#'     multiSectionPlot(
#'       menu = "fullplots",
#'       "fullPlot"
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
#'     ),
#'     multiSection(
#'       multiContainer(
#'         center = TRUE,
#'         h1("<- Full Section plot"),
#'         sliderInput(
#'           "number",
#'           "Data points",
#'           min = 50,
#'           max = 250,
#'           value = 10
#'         )
#'       )
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'
#'   output$plot <- renderPlot({
#'     hist(rnorm(100, 20, input$max))
#'   })
#'
#'   output$fullPlot <- renderPlot({
#'     par(bg = "gray")
#'     hist(rnorm(input$number, 20, 250))
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
