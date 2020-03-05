#' Setup a page.
#'
#' Create a full scrolling page.
#'
#' @param ... any element.
#' @param opts list of options, see details.
#' @param sections.color character vector, i.e.: \code{c("blue", "red")}
#' @param menu menu links as named vector.
#' @param center horizontally center all sections.
#'
#' @details
#' \itemize{
#'   \item{\code{direction} - takes \code{vertical} or \code{horizontal} - defines if the scroll is vertical or horizontal.}
#'   \item{\code{verticalCentered} - boolean.}
#'   \item{\code{scrollingSpeed} - scrolling transitions in milliseconds, numeric value i.e.: \code{700}.}
#'   \item{\code{easing} - character string - takes \code{swing} or \code{linear}.}
#'   \item{\code{loopBottom} - boolean - defines whether scrolling down in the last section should scroll to the first one or not.}
#'   \item{\code{loopTop} - boolean - defines whether scrolling up in the first section should scroll to the last one or not.}
#'   \item{\code{css3} - boolean - defines whether to use JavaScript or CSS3 transforms to scroll within sections. Useful to speed up the movement in tablet and mobile devices with browsers supporting CSS3. If this option is set to true and the browser doesn't support CSS3, a jQuery fallback will be used instead.}
#'   \item{\code{navigation} - boolean - if set, it will show a navigation bar made up of small circles.}
#'   \item{\code{touchSensitivity} - numeric value - defines a percentage of the browsers window width/height, and how far a swipe must measure for navigating to the next section.}
#'   \item{\code{keyboardScrolling} - boolean - defines if the content can be navigated using the keyboard.}
#'   \item{\code{animateAnchor} - boolean - defines whether the load of the site when given an anchor will scroll with animation to its destination or will directly load on the given section.}
#' }
#'
#' @examples
#' if(interactive()){
#' # Run de demo
#' demo("pagePiling", package = "fullPage")
#'
#' # Or
#' library(shiny)
#'
#' options <- list(
#'   loopBottom = TRUE
#' )
#'
#' ui <- pagePiling(
#'   center = TRUE,
#'   sections.color = c('#f2f2f2', '#2C3E50', '#39C'),
#'   opts = options,
#'   menu = c("Section 1" = "section1",
#'            "Piling" = "section2",
#'            "Plots" = "section3",
#'            "Reactive" = "section4",
#'            "Images" = "images"),
#'   pageSection(
#'     menu = "section1",
#'     h1("Page piling")
#'   ),
#'   pageSection(
#'     menu = "section2",
#'     h1("Section 2")
#'   ),
#'   pageSectionPlot(
#'     "plot",
#'     menu = "section3",
#'     h1("Plot background")
#'   ),
#'   pageSectionPlot(
#'     "plot2",
#'     menu = "section4",
#'     pageContainer(
#'       h1("Reactive background"),
#'       sliderInput(
#'         "bins",
#'         "Data Points",
#'         min = 100,
#'         max = 500,
#'         step = 25,
#'         value = 200
#'       )
#'     )
#'   ),
#'   pageSectionImage( # will not show in viewer, open in browser
#'     menu = "image",
#'     img = paste0(
#'       "https://raw.githubusercontent.com/alvarotrigo/",
#'       "fullPage.js/master/examples/imgs/bg2.jpg"),
#'     h1("Image background")
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
#' @author John Coene, \email{jcoenep@@gmail.com}
#'
#' @seealso \href{Official documentation}{https://github.com/alvarotrigo/pagePiling.js/}.
#'
#' @export
pagePiling <- function(..., sections.color, opts = list(), menu = NULL, center = FALSE){

  if(missing(sections.color))
    stop("must pass sections.color", call. = FALSE)

  # add anchors to JS
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
        id = "fp",
        ...
      )
    )
  } else { # no menu
    body <- shiny::tags$body(
      shiny::tags$div(
        id = "fp",
        ...
      )
    )
  }

  if(isTRUE(center))
    body <- shiny::tagAppendAttributes(body, style = "text-align: center;")

  shiny::tags$html(
    shiny::tags$head(
      shiny::bootstrapLib(),
      shiny::includeCSS(
        system.file("css/styles.css", package = "fullPage")
      ),
      shiny::includeCSS(
        system.file("css/jquery.pagepiling.min.css", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("jquery-3.2.1/jquery.min.js", package = "fullPage")
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
