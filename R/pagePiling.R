#' Set page piling
#'
#' Create a pilling page.
#'
#' @param ... any element.
#' @param opts list of options, see details.
#' @param sections.color character vector, i.e.: \code{c("blue", "red")}
#' @param menu menu links as named vector.
#' @param center horizontally center all sections.
#'
#' @details
#' \itemize{
#'   \item{\code{direction} - takes \code{vertical} or \code{horizontal}}
#'   \item{\code{verticalCentered} - boolean}
#'   \item{\code{scrollingSpeed} - scrolling transitions in milliseconds, numeric value i.e.: \code{700}}
#'   \item{\code{easing} - character string, \href{jQuery UI}{http://jqueryui.com/} easing, i.e.: \code{easeInQuart}}
#'   \item{\code{loopBottom} - boolean}
#'   \item{\code{loopTop} - boolean}
#'   \item{\code{css3} - boolean}
#'   \item{\code{navigation} - boolean, show navigation bar}
#'   \item{\code{touchSensitivity} - numeric value}
#'   \item{\code{keyboardScrolling} - boolean}
#'   \item{\code{animateAnchor} - boolean, whether to use anchors}
#' }
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' options <- list(
#'   loopBottom = TRUE
#' )
#'
#' ui <- pagePiling(
#'   sections.color = c('#f2f2f2', '#2C3E50', '#39C'),
#'   opts = options,
#'   menu = c("Section 1" = "section1",
#'            "Piling" = "section2",
#'            "Plots" = "section3",
#'            "Layers" = "section4"),
#'   pageSection(
#'     center = TRUE,
#'     menu = "section1",
#'     h1("Page piling")
#'   ),
#'   pageSection(
#'     menu = "section2",
#'     center = TRUE,
#'     h1("Section 2")
#'   ),
#'   pageSectionPlot(
#'     "plot",
#'     center = TRUE,
#'     menu = "section3",
#'     h1("Plot background")
#'   ),
#'   pageSectionPlot(
#'     "plot2",
#'     center = TRUE,
#'     menu = "section4",
#'     pageContainer(
#'       h1("Layer anything"),
#'       sliderInput(
#'         "bins",
#'         "Data Points",
#'         min = 100,
#'         max = 500,
#'         step = 25,
#'         value = 200
#'       )
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'
#'   output$plot <- renderPlot({
#'     par(bg = "grey60")
#'     plot(mtcars$wt, mtcars$mpg)
#'   })
#'
#'   output$plot2 <- renderPlot({
#'     par(bg = "grey80")
#'     hist(rnorm(input$bins, 100, 250))
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @export
pagePiling <- function(..., sections.color, opts = NULL, menu = NULL, center = FALSE){

  if(missing(sections.color))
    stop("must pass sections.color", call. = FALSE)

  # add anchors to JS
  if(!inherits(opts, "list")) opts <- list()

  opts <- append(opts, list(sectionsColor = sections.color))

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

    # add menu anchors
    opts$anchors <- unname(menu)
    opts$menu <- "#tocMenu"

    # build body
    body <- shiny::tags$body(
      ul,
      shiny::tags$div(
        id = "fullpagePilling",
        ...
      )
    )
  } else { # no menu
    body <- shiny::tags$body(
      shiny::tags$div(
        id = "fullpagePilling",
        ...
      )
    )
  }

  if(isTRUE(center))
    body <- shiny::tagAppendAttributes(body, style = "text-align: center;")

  shiny::tags$html(
    shiny::tags$head(
      shiny::includeCSS(
        system.file("css/normalize.min.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/milligram.min.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/styles.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/jquery.pagepiling.min.css", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.pagepiling.min.js", package = "fullPage")
      ),
      shiny::tags$script(
        build_opts_pp(opts)
      )
    ),
    body
  )
}
