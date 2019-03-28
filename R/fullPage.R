#' Setup a page.
#'
#' Create a full scrolling page.
#'
#' @param opts a list of options, see details.
#' @param menu named vector of menu links.
#' @param center horizontally center all sections.
#' @param ... any element.
#'
#' @details
#' Valid \code{opts}:
#' \itemize{
#'   \item{\code{lockAnchors} - boolean - whether anchors in the URL will have any effect at all in the library.}
#'   \item{\code{navigation} boolean - show a navigation bar made up of small circles.}
#'   \item{\code{navigationPosition} takes \code{none}, \code{left} or \code{right}.}
#'   \item{\code{showActiveTooltip} - \code{vector} i.e.:\code{c("section 1", "section 2")}.}
#'   \item{\code{slidesNavigation} - boolean - show a navigation bar made up of small circles.}
#'   \item{\code{slidesNavPosition} - takes \code{top} or \code{bottom}.}
#'   \item{\code{scrollingSpeed} - integer - speed in milliseconds for the scrolling transitions.}
#'   \item{\code{autoScrolling} - boolean - set automatic scrolling.}
#'   \item{\code{fitToSection} - boolean}
#'   \item{\code{fitToSectionDelay} - integer}
#'   \item{\code{scrollBar} boolean - whether to show the scroll bar.}
#'   \item{\code{easing} - defines the transition effect to use for the vertical and horizontal scrolling. See jQuery UI  \href{transitions}{http://api.jqueryui.com/easings/} and the \href{toolkit}{https://matthewlein.com/tools/ceaser}.}
#'   \item{\code{easingcss3} - defines the transition effect to use in case of using \code{css3 = TRUE}. See \href{pre-defined ones}{https://www.w3schools.com/cssref/css3_pr_transition-timing-function.asp}.}
#'   \item{\code{css3} - boolean - defines whether to use JavaScript or CSS3 transforms to scroll within sections and slides.}
#'   \item{\code{loopBottom} - boolean - defines whether scrolling down in the last section should scroll to the first one or not.}
#'   \item{\code{loopTop} - boolean - defines whether scrolling up in the first section should scroll to the last one or not.}
#'   \item{\code{loopHorizontal} - boolean - defines whether horizontal sliders will loop after reaching the last or previous slide or not.}
#'   \item{\code{continuousVertical} - boolean - defines whether scrolling down in the last section or should scroll down to the first one and if scrolling up in the first section should scroll up to the last one. Not compatible with \code{loopTop}, \code{loopBottom}, \code{scrollBar = TRUE} and \code{autoScrolling = FALSE}.}
#'   \item{\code{continuousHorizontal} - boolean - defines whether sliding right in the last slide should slide right to the first one or not, and if scrolling left in the first slide should slide left to the last one or not. Not compatible with \code{loopHorizontal}.}
#'   \item{\code{scrollHorizontally} - boolean - defines whether to slide horizontally within sliders by using the mouse wheel or trackpad. Ideal for story telling.}
#'   \item{\code{interlockedSlides} - boolean or vector (i.e.:\code{1, 3, 5} for slides 1, 3, and 5) - determines whether moving one horizontal slider will force the sliding of sliders in other section in the same direction.}
#'   \item{\code{dragAndMove} - boolean - enables or disables the dragging and flicking of sections and slides by using mouse or fingers.}
#'   \item{\code{offsetSections} - provides a way to use non full screen sections based on percentage. Ideal to show visitors there's more content in the site by showing part of the next or previous section.}
#'   \item{\code{resetSliders} - defines whether or not to reset every slider after leaving its section.}
#'   \item{\code{fadingEffect} - defines whether to use a fading effect or not instead of the default scrolling one. Possible values are \code{TRUE}, \code{FALSE}, \code{sections}, \code{slides}.}
#'   \item{\code{scrollOverflow} - defines whether or not to create a scroll for the section/slide in case its content is bigger than the height of it. When set to \code{TRUE}, your content will be wrapped by the plugin. }
#'   \item{\code{scrollOverflowReset} - When set to \code{TRUE} it scrolls up the content of the section/slide with scroll bar when leaving to another vertical section. This way the section/slide will always show the start of its content even when scrolling from a section under it.}
#'   \item{\code{touchSensitivity} - defines a percentage of the browsers window width/height, and how far a swipe must measure for navigating to the next section / slide, defaults to \code{5}.}
#'   \item{\code{normalScrollElementTouchThreshold} - defines the threshold for the number of hops up the html node tree Fullpage will test to see if normalScrollElements is a match to allow scrolling functionality on divs on a touch device. }
#'   \item{\code{bigSectionsDestination} - defines how to scroll to a section which size is bigger than the viewport. By default fullPage.js scrolls to the top if you come from a section above the destination one and to the bottom if you come from a section below the destination one. Possible values are \code{top}, \code{bottom} or, \code{NULL}.}
#'   \item{\code{keyboardScrolling} - defines if the content can be navigated using the keyboard.}
#'   \item{\code{animateAnchor} - defines whether the load of the site when given an anchor will scroll with animation to its destination or will directly load on the given section.}
#'   \item{\code{recordHistory} - defines whether to push the state of the site to the browser's history. When set to true each section/slide of the site will act as a new page and the back and forward buttons of the browser will scroll the sections/slides to reach the previous or next state of the site. When set to \code{FALSE}, the URL will keep changing but will have no effect on the browser's history. This option is automatically turned off when using \code{autoScrolling = FALSE}.}
#'   \item{\code{controlArrows} - determines whether to use control arrows for the slides to move right or left.}
#'   \item{\code{verticalCentered} - vertically centering of the content within sections.}
#'   \item{\code{sectionsColor} - defines sections' background colour.}
#'   \item{\code{paddingTop} - defines the top padding for each section with a numerical value and its measure, i.e.: \code{10em}.}
#'   \item{\code{paddingBottom} - defines the bottom padding for each section with a numerical value and its measure, i.e.: \code{10em}.}
#'   \item{\code{responsiveWidth} - a normal scroll will be used under the defined width in pixels. A class fp-responsive is added to the body tag in case the user wants to use it for his own responsive CSS. For example, if set to 900, whenever the browser's width is less than 900 the plugin will scroll like a normal site.}
#'   \item{\code{responsiveHeight} - a normal scroll will be used under the defined height in pixels. A class fp-responsive is added to the body tag in case the user wants to use it for his own responsive CSS. For example, if set to 900, whenever the browser's height is less than 900 the plugin will scroll like a normal site.}
#'   \item{\code{responsiveSlides} - when set to \code{TRUE} slides will be turned into vertical sections when responsive mode is fired.}
#'   \item{\code{parallax} - defines whether or not to use the parallax backgrounds effects on sections / slides.}
#'   \item{\code{parallaxOptions} - list - allows to configure the parameters for the parallax backgrounds effect, see \href{parallax options}{https://github.com/alvarotrigo/fullPage.js/wiki/Extension---Parallax}}
#'   \item{\code{lazyLoading} -lazy loading is active by default which means it will lazy load any media element containing the attribute data-src.}
#' }
#'
#' @examples
#' \dontrun{
#' # Run de demo
#' demo("fullPage", package = "fullPage")
#'
#' # Or this
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
#'            "Background Slides" = "section5",
#'            "Callbacks" = "section6"),
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
#'          )
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
#'   ),
#'   fullSection(
#'     menu = "section6",
#'     fullContainer(
#'       h3("Callbacks"),
#'       p("Get callbacks on slide origin, destination, derection."),
#'       p("Current slide:", verbatimTextOutput("slide"))
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
#'
#'   output$slide <- renderPrint({
#'     input$slide_origin
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#' @author John Coene, \email{jcoenep@@gmail.com}
#'
#' @seealso \href{Official documentation}{https://github.com/alvarotrigo/fullPage.js/}.
#'
#' @export
fullPage <- function(..., opts = list(), menu = NULL, center = FALSE){

  # add menu anchors
  opts$anchors <- unname(menu)
  opts$menu <- "#tocMenu"

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

    # build body
    body <- shiny::tags$body(
      ul,
      shiny::tags$div(
        id = "fp",
        ...
      ),
      shiny::tags$script(
        build_opts_fp(opts)
      )
    )
  } else { # no menu
    body <- shiny::tags$body(
      shiny::tags$div(
        id = "fp",
        ...
      ),
      shiny::tags$script(
        build_opts_fp(opts)
      )
    )
  }

  if(isTRUE(center))
    body <- shiny::tagAppendAttributes(body, style = "text-align: center;")

  shiny::tags$html(
    shiny::tags$head(
      shiny::tags$link(
        href = "fp-css/bootstrap.min.css",
        rel = "stylesheet",
        type = "text/css"
      ),
      shiny::tags$script(
        src = "fp-js/bootstrap.min.js"
      ),
      shiny::tags$link(
        href = "fp-css/jquery.fullpage.min.css",
        rel = "stylesheet",
        type = "text/css"
      ),
      shiny::tags$link(
        href = "fp-css/normalize.min.css",
        rel = "stylesheet",
        type = "text/css"
      ),
      shiny::tags$link(
        href = "fp-css/milligram.min.css",
        rel = "stylesheet",
        type = "text/css"
      ),
      shiny::tags$link(
        href = "fp-css/styles.css",
        rel = "stylesheet",
        type = "text/css"
      ),
      shiny::tags$script(
        src = "fp-jquery/jquery.min.js"
      ),
      shiny::tags$script(
        src = "fp-jquery/jquery.easing.min.js"
      ),
      shiny::tags$script(
        src = "fp-js/scrolloverflow.min.js"
      ),
      shiny::tags$script(
        src = "fp-js/jquery.fullpage.min.js"
      ),
      shiny::tags$script(
        src = "fp-js/jquery.fullpage.extensions.min.js"
      )
    ),
    body
  )
}

#' Sections and Slides
#'
#' Add sections and slides.
#'
#' @param menu menu link.
#' @param center whether to center text horizontally.
#' @param img path to image.
#' @param class A CSS class.
#' @param ... any element.
#'
#' @examples
#' if(interactive()){
#'
#' library(shiny)
#'
#' ui <- fullPage(
#'   center = TRUE,
#'   opts = list(
#'     sectionsColor = c("#f3f3f3", "#4BBFC3")
#'   ),
#'   fullSection(h1("First section"), center = TRUE),
#'   fullSection(
#'     menu = "captureThisSection"
#'   ),
#'   fullSection(
#'     fullSlide(h2("Slide 1")),
#'     fullSlideImage(
#'       img = paste0(
#'         "https://raw.githubusercontent.com/alvarotrigo/",
#'         "fullPage.js/master/examples/imgs/bg5.jpg"),
#'       h2("Image background")
#'     )
#'   ),
#'   fullSectionImage( # will not show in viewer, open in browser
#'     img = paste0(
#'       "https://raw.githubusercontent.com/alvarotrigo/",
#'       "fullPage.js/master/examples/imgs/bg2.jpg"),
#'     h1("Image background")
#'   )
#' )
#'
#' server <- function(input, output){
#'   observeEvent(input$captureThisSectionInput, {
#'     print("Section # 2 loaded")
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @author John Coene, \email{jcoenep@@gmail.com}
#' @details \code{fullSectionImage} and \code{fullSlideImage} do not work in RStudio viewer, open in browser.
#'
#' @rdname fp
#' @export
fullSection <- function(..., menu = NULL, center = FALSE, class = ""){

  if(is.null(menu)){
    id <- rand()
  } else {
    id <- paste0(menu, "Input")
  }

  div <- shiny::tags$div(
    class = paste("section fullPageBinding", class),
    id = id,
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
fullSectionImage <- function(..., img, menu = NULL, center = FALSE){

  if(missing(img))
    stop("must pass path to image", call. = FALSE)

  if(is.null(menu)){
    id <- rand()
  } else {
    id <- paste0(menu, "ShinyId")
  }

  # image css
  style <- paste0(
    '#', id, '{
      background-image: url(', img, ');
      height: 100%;
      background-position: center;
      background-repeat: no-repeat;
      background-size: cover;
    }'
  )

  div <- shiny::tags$div(
    class = "section",
    id = id,
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(isTRUE(center))
    div <- shiny::tagAppendAttributes(div, style = "text-align: center;")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$style(
        style
      )
    ),
    div
  )
}

#' @rdname fp
#' @export
fullSlideImage <- function(..., img, menu = NULL, center = FALSE){

  if(missing(img))
    stop("must pass path to image", call. = FALSE)

  if(is.null(menu)){
    id <- rand()
  } else {
    id <- paste0(menu, "ShinyId")
  }

  # image css
  style <- paste0(
    '#', id, '{
      background-image: url(', img, ');
      height: 100%;
      background-position: center;
      background-repeat: no-repeat;
      background-size: cover;
    }'
  )

  div <- shiny::tags$div(
    class = "slide",
    id = id,
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(isTRUE(center))
    div <- shiny::tagAppendAttributes(div, style = "text-align: center;")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$style(
        style
      )
    ),
    div
  )
}

#' @rdname fp
#' @export
pageSection <- fullSection

#' @rdname fp
#' @export
pageSectionImage <- fullSectionImage
