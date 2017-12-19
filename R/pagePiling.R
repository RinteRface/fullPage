#' Set page piling
#'
#' @examples
#' if(interactive()){
#' ui <- pagePiling(
#'   opts = list('white', '#ee005a', '#2C3E50', '#39C'),
#'   menu = c("Section 1" = "section1",
#'            "Section 2" = "section2",
#'            "Section 3" = "section3"),
#'   pageSection(
#'     menu = "section1",
#'     h1("Page piling")
#'   ),
#'   pageSection(
#'     menu = "section2",
#'     h1("Section 2")
#'   ),
#'   pageSection(
#'     menu = "section3",
#'     h1("Section 3")
#'   )
#' )
#'
#' server <- function(input, output){}
#'
#' shinyApp(ui, server)
#' }
#'
#' @export
pagePiling <- function(..., opts = NULL, menu = NULL){

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
