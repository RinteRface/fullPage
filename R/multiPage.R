#' Setup a page
#'
#' Create a full scrolling page.
#'
#' @inheritParams fullPage
#'
#' @details use the \code{menu} parameter on one "side" (\code{\link{multiLeft}} or \code{\link{multiRight}}) only;
#' No need to specify it twice, it would breaks things as it is a \code{CSS} id, see examples.
#'
#' Valid \code{opts}:
#' \itemize{
#'   \item{\code{verticalCentered} - boolean - vertically centering of the content within sections.}
#'   \item{\code{scrollingSpeed} - numeric - speed in milliseconds for the scrolling transitions.}
#'   \item{\code{easing} - character string, \href{jQuery UI}{http://jqueryui.com/} easing, i.e.: \code{easeInQuart}}
#'   \item{\code{sectionsColor} - character vector, i.e.: \code{c("blue", "red")}}
#'   \item{\code{navigation} - boolean - if set, it will show a navigation bar made up of small circles.}
#'   \item{\code{navigationPosition} - character string, takes \code{none}, \code{left}, or \code{right}}
#'   \item{\code{navigationColor} - character string, i.e.:"black"}
#'   \item{\code{navigationTooltips} - character vector, i.e.: \code{c("Tooltip 1", "Tooltip 2")}}
#'   \item{\code{loopBottom} - boolean - defines whether scrolling down in the last section should scroll to the first one or not.}
#'   \item{\code{loopTop} - boolean - defines whether scrolling up in the first section should scroll to the last one or not.}
#'   \item{\code{css3} - boolean - defines whether to use JavaScript or CSS3 transforms to scroll within sections. Useful to speed up the movement in tablet and mobile devices with browsers supporting CSS3. If this option is set to true and the browser doesn't support CSS3, a jQuery fallback will be used instead.}
#'   \item{\code{paddingTop} - defines the top padding for each section with a numerical value and its measure, i.e.: \code{5em}}
#'   \item{\code{paddingBottom} - defines the bottom padding for each section with a numerical value and its measure , i.e.: \code{10px}}
#'   \item{\code{keyboardScrolling} boolean - defines if the content can be navigated using the keyboard}
#'   \item{\code{touchSensitivity} - numeric - defines a percentage of the browsers window width/height, and how far a swipe must measure for navigating to the next section, i.e.: \code{5}}
#'   \item{\code{responsiveWidth} - a class \code{ms-responsive} is added to the body tag in case the user wants to use it for his own responsive CSS. For example, if set to 900, whenever the browser's width is less than 900 the plugin will scroll like a normal site.}
#'   \item{\code{responsiveHeight} - a class \code{ms-responsive} is added to the body tag in case the user wants to use it for his own responsive CSS. For example, if set to 900, whenever the browser's height is less than 900 the plugin will scroll like a normal site.}
#'   \item{\code{responsiveExpand} - boolean - when responsive mode is fired (by using the \code{responsiveWidth} or \code{responsiveHeight} options) it turns auto scrolling off and expands each left and right side into a full-width section placing one after another. Then the page can be scrolled normally. \href{Read more about how to use the Responsive Expand option.}{https://github.com/alvarotrigo/multiscroll.js/wiki/Responsive-Expand-Extension}}
#' }
#'
#' @examples
#' if(interactive()){
#' # Run de demo
#' demo("muliPage", package = "fullPage")
#'
#' # OR
#' library(shiny)
#'
#' options <- list(
#'   sectionsColor = c("#4BBFC3", "#7BAABE", "#d3d3d3", "#000")
#' )
#'
#' ui <- multiPage(
#'   opts = options,
#'   menu = c("Multi Scroll" = "multiscroll",
#'            "Plots" = "plots",
#'            "Full Section plots" = "fullplots",
#'            "Images" = "images"),
#'   multiLeft(
#'     align = "right",
#'     multiSection(
#'       menu = "multiscroll",
#'       h1("Multi")
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
#'     ),
#'     multiSection(
#'       menu = "images",
#'       h1("Image ")
#'     )
#'   ),
#'   multiRight(
#'     align = "left",
#'     multiSection(
#'       h1("Page()")
#'     ),
#'     multiSection(
#'       plotOutput("plot")
#'     ),
#'     multiSection(
#'       multiContainer(
#'         h1("<- Full Section plot"),
#'         sliderInput(
#'           "number",
#'           "Data points",
#'           min = 50,
#'           max = 250,
#'           value = 10
#'         )
#'       )
#'     ),
#'     multiSectionImage(
#'       img = "https://alvarotrigo.com/multiScroll/imgs/tiger.jpg",
#'       side = "right",
#'       h1("Background")
#'     )
#'   )
#' )
#'
#' server <- function(input, output){
#'
#'   output$plot <- renderPlot({
#'     par(bg = "#7BAABE")
#'     hist(rnorm(100, 20, input$max))
#'   })
#'
#'   output$fullPlot <- renderPlot({
#'     par(bg = "#d3d3d3")
#'     hist(rnorm(input$number, 20, 250))
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @seealso \href{Official documentation}{https://github.com/alvarotrigo/multiscroll.js}.
#'
#' @export
multiPage <- function(..., opts = list(), menu = NULL){

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
        system.file("jquery-3.2.1/jquery.min.js", package = "fullPage")
      ),
      shiny::includeScript(
        system.file("jquery-3.2.1/jquery.easing.min.js", package = "fullPage")
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

#' Create multi sections
#'
#' Create multi sections.
#'
#' @inheritParams fullPage
#' @param align text alignment, takes \code{left}, \code{right} or, \code{center}, defaults to \code{none}.
#' @param img path to image.
#' @param side image side.
#'
#' @examples
#' if(interactive()){
#'   library(shiny)
#'
#'   options <- list(
#'     sectionsColor = c("#f3f3f3", "#d3d3d3", "#000")
#'   )
#'
#'   ui <- multiPage(
#'     opts = options,
#'     multiLeft(
#'       align = "right",
#'       multiSection(
#'         h1("multi")
#'       ),
#'       multiSection(
#'         h2("Section ")
#'       ),
#'       multiSection(
#'         h2("Image ")
#'       )
#'     ),
#'     multiRight(
#'       align = "left",
#'       multiSection(
#'         h1("page()")
#'       ),
#'       multiSection(
#'         h2(" 2")
#'       ),
#'       multiSectionImage(
#'         img = "https://alvarotrigo.com/multiScroll/imgs/tiger.jpg",
#'         side = "right",
#'         h2("Background")
#'       )
#'     )
#'   )
#'
#'   server <- function(input, output){}
#'
#'   shinyApp(ui, server)
#' }
#'
#' @rdname mp
#' @export
multiSection <- function(..., menu = NULL, align = "none"){

  if(!align %in% c("none", "left", "right", "center"))
    stop("Incorrect alignment, must be one of none, left, right or, center.", call. = FALSE)

  div <- shiny::tags$div(
    class = "ms-section",
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(align != "none")
    div <- shiny::tagAppendAttributes(div, style = paste0("text-align: ", align, ";"))

  div
}

#' @rdname mp
#' @export
multiSectionImage <- function(..., img, side, menu = NULL, align = "none"){

  if(missing(img))
    stop("must pass path to image", call. = FALSE)

  if(missing(side))
    stop("must pass side", call. = FALSE)

  if(!align %in% c("none", "left", "right", "center"))
    stop("Incorrect alignment, must be one of none, left, right or, center.", call. = FALSE)

  id <- rand()

  # image css
  style <- paste0(
    '.ms-', side, ' .', id, '{
      background-image: url("', img, '");
      background-repeat: no-repeat;
      background-position: ', side, ';
      background-size: auto 100%;
    }'
  )

  div <- shiny::tags$div(
    class = paste("ms-section", id),
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(align != "none")
    div <- shiny::tagAppendAttributes(div, style = paste0("text-align: ", align, ";"))

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$style(
        style
      )
    ),
    div
  )
}
