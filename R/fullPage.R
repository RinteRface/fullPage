#' Setup fullPage
#'
#' Create a fullpage.
#'
#' @param opts a list of options, see details.
#' @param menu named vector of menu links.
#' @param ... any element.
#'
#' @details
#' Valid \code{opts}:
#' \itemize{
#'   \item{\code{lockAnchors}}
#'   \item{\code{navigation}}
#'   \item{\code{navigationPosition}}
#'   \item{\code{showActiveTooltip}}
#'   \item{\code{slidesNavigation}}
#'   \item{\code{slidesNavPosition}}
#'   \item{\code{scrollingSpeed}}
#'   \item{\code{autoScrolling}}
#'   \item{\code{fitToSection}}
#'   \item{\code{fitToSectionDelay}}
#'   \item{\code{scrollBar}}
#'   \item{\code{easing}}
#'   \item{\code{easingcss3}}
#'   \item{\code{css3}}
#'   \item{\code{loopBottom}}
#'   \item{\code{loopTop}}
#'   \item{\code{loopHorizontal}}
#'   \item{\code{continuousVertical}}
#'   \item{\code{continuousHorizontal}}
#'   \item{\code{scrollHorizontally}}
#'   \item{\code{interlockedSlides}}
#'   \item{\code{dragAndMove}}
#'   \item{\code{offsetSections}}
#'   \item{\code{resetSliders}}
#'   \item{\code{fadingEffect}}
#'   \item{\code{normalScrollElements}}
#'   \item{\code{scrollOverflow}}
#'   \item{\code{scrollOverflowReset}}
#'   \item{\code{scrollOverflowOptions}}
#'   \item{\code{touchSensitivity}}
#'   \item{\code{normalScrollElementTouchThreshold}}
#'   \item{\code{bigSectionsDestination}}
#'   \item{\code{keyboardScrolling}}
#'   \item{\code{animateAnchor}}
#'   \item{\code{recordHistory}}
#'   \item{\code{controlArrows}}
#'   \item{\code{verticalCentered}}
#'   \item{\code{sectionsColor}}
#'   \item{\code{paddingTop}}
#'   \item{\code{paddingBottom}}
#'   \item{\code{responsiveWidth}}
#'   \item{\code{responsiveHeight}}
#'   \item{\code{responsiveSlides}}
#'   \item{\code{parallax}}
#'   \item{\code{parallaxOptions}}
#'   \item{\code{lazyLoading}}
#' }
#'
#' @examples
#' \dontrun{
#' library(shiny)
#'
#' options <- list(
#'   sectionsColor = c('#f2f2f2', '#4BBFC3', '#7BAABE'),
#'   parallax = TRUE
#' )
#'
#' ui <- fullPage(
#'   menu = c("Full Page" = "link1",
#'            "Sections" = "link2",
#'            "Slides" = "section3",
#'            "backgrounds" = "section4",
#'            "Background Slides" = "section5"),
#'   opts = options,
#'   fullSection(
#'     center = TRUE,
#'     menu = "link1",
#'     tags$h1("fullPage.js meets Shiny")
#'   ),
#'   fullSection(
#'     menu = "link2",
#'       fullRow(
#'         fullColumn(
#'           h3("Column 1"),
#'           selectInput(
#'           "dd",
#'           "data points",
#'           choices = c(10, 20, 30)
#'           )
#'         ),
#'         fullColumn(
#'           plotOutput("hist")
#'         ),
#'         fullColumn(
#'           plotOutput("plot")
#'         )
#'       )
#'   ),
#'   fullSection(
#'     menu = "section3",
#'     fullSlide(
#'       fullContainer(
#'         center = TRUE,
#'         h3("With container"),
#'         plotOutput("slideplot2"),
#'         shiny::verbatimTextOutput("containerCode")
#'       )
#'     ),
#'     fullSlide(
#'       center = TRUE,
#'       h3("Without container"),
#'       plotOutput("slideplot1")
#'     )
#'   ),
#'   fullSectionPlot(
#'     menu = "section4",
#'     center = TRUE,
#'     "fp",
#'     h3("Background plots"),
#'     fullContainer(
#'       sliderInput(
#'         "fpInput",
#'         label = "Input",
#'         min = 10,
#'         max = 100,
#'         value = 74
#'       )
#'     )
#'   ),
#'   fullSection(
#'     menu = "section5",
#'     fullSlidePlot(
#'       "slideSectionPlot1",
#'       center = TRUE,
#'       h1("Slide background plot")
#'     ),
#'     fullSlidePlot(
#'       "slideSectionPlot2"
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'
#'   output$plot <- renderPlot({
#'     hist(rnorm(input$dd, 1, 10))
#'   })
#'
#'   output$hist <- renderPlot({
#'     hist(rnorm(input$dd, 1, 10))
#'   })
#'
#'   output$slideplot1 <- renderPlot({
#'     plot(mtcars$mpg, mtcars$drat)
#'   })
#'
#'   output$slideplot2 <- renderPlot({
#'     plot(mtcars$wt, mtcars$mpg)
#'   })
#'
#'   output$fp <- renderPlot({
#'     par(bg = "lightgray")
#'     hist(rnorm(input$fpInput, 1, 10))
#'   })
#'
#'   output$containerCode <- renderText({
#'     "fullSlide(
#'       fullContainer(...)
#'     )"
#'   })
#'
#'   output$slideSectionPlot1 <- renderPlot({
#'     par(bg = "lightblue")
#'     hist(rnorm(50, 1, 20))
#'   })
#'
#'   output$slideSectionPlot2 <- renderPlot({
#'     par(bg = "gray50")
#'     hist(rnorm(50, 1, 25))
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @export
fullPage <- function(..., opts = NULL, menu = NULL){

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
        id = "fullpageshiny",
        ...
      ),
      shiny::tags$script(
        build_opts_fp(opts)
      )
    )
  } else { # no menu
    body <- shiny::tags$body(
      shiny::tags$div(
        id = "fullpageshiny",
        ...
      ),
      shiny::tags$script(
        build_opts_fp(opts)
      )
    )
  }

  shiny::tags$html(
    shiny::tags$head(
      shiny::includeCSS(
        system.file("css/jquery.fullpage.min.css", package = "fullPage")
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
        system.file("js/scrolloverflow.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.fullpage.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("js/jquery.fullpage.extensions.min.js", package = "fullPage")
      )
    ),
    body
  )
}

#' Sections and Slides
#'
#' @param menu menu link.
#' @param center whether to center text horizontally.
#' @param ... any element.
#'
#' @examples
#' if(interactive()){
#'
#' library(shiny)
#'
#' ui <- fullPage(
#'   opts = list(sectionsColor = c('#4BBFC3', '#7BAABE')),
#'   fullSection(h3("First"), center = TRUE),
#'   fullSection(
#'     center = TRUE,
#'     fullSlide(h3("Slide 1")),
#'     fullSlide(h3("Slide 2"))
#'   )
#' )
#'
#' server <- function(input, output){}
#'
#' shinyApp(ui, server)
#' }
#'
#' @rdname fp
#' @export
fullSection <- function(..., menu = NULL, center = FALSE){
  div <- shiny::tags$div(
    class = "section",
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(isTRUE(center))
    div <- shiny::tagAppendAttributes(div, style = "text-align: center;")

  div
}

#' @rdname fp
#' @export
fullSlide <- function(..., menu = NULL, center = FALSE){
  div <- shiny::tags$div(
    class = "slide",
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(isTRUE(center))
    div <- shiny::tagAppendAttributes(div, style = "text-align: center;")

  div
}

#' @rdname fp
#' @export
pageSection <- fullSection
