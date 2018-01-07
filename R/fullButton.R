#' Add buttons
#'
#' Add buttons to your \code{\link{fullPage}}, \code{\link{pagePiling}} and \code{\link{multiPage}}.
#'
#' @param outline,clear set outline or clear button.
#' @param ... any other element
#' @param section,slide target section and/or slide.
#' @param fun Javascript function to pass to button.
#'
#' @details See example for \code{*Custom} button.
#'
#' @examples
#' library(shiny)
#'
#' if(interactive()){
#'
#'   ui <- fullPage(
#'
#'     center = TRUE,
#'
#'     fullSection(
#'       center = TRUE,
#'       h1("Buttons")
#'     ),
#'     fullSection(
#'       fullButton("Visit site", href = "https://john-coene.com")
#'     ),
#'     fullSection(
#'       fullButtonDown("Move Down", outline = TRUE)
#'     ),
#'     fullSection(
#'       fullButtonUp("Move up")
#'     ),
#'     fullSection(
#'       fullButtonTo("Move to first section", section = 1)
#'     ),
#'     fullSection(
#'       center = TRUE,
#'       fullSlide(
#'         fullButtonRight("Slide right", clear = TRUE)
#'       ),
#'       fullSlide(
#'         fullButtonLeft("Slide left", clear = TRUE)
#'       )
#'     ),
#'     fullSection(
#'       p("Disables keyboard scrolling"),
#'       fullButtonCustom("Custom button",
#'         fun = "$.fn.fullpage.setKeyboardScrolling(false, 'down, right');")
#'     )
#'   )
#'
#'   server <- function(input, output){}
#'
#'   shinyApp(ui, server)
#' }
#'
#' @rdname button
#' @export
fullButton <- function(..., outline = FALSE, clear = FALSE){

  if(isTRUE(clear) && isTRUE(outline))
    stop("can online set outline or clear, not both", call. = FALSE)

  cl <- "button"
  if(isTRUE(outline)) cl <- paste(cl, "button-outline")
  if(isTRUE(clear)) cl <- paste(cl, "button-clear")

  shiny::tags$a(
    class = cl,
    ...
  )
}

#' @rdname button
#' @export
fullButtonTo <- function(..., section, slide = 0, outline = FALSE, clear = FALSE){

  if(missing(section))
    stop("must pass section", call. = FALSE)

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  if(!inherits(section, "numeric"))
    section <- paste0("'", section, "'")

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.fullpage.moveTo(", section, ", ", slide, ");});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
fullButtonUp <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.fullpage.moveSectionUp();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
fullButtonDown <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.fullpage.moveSectionDown();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
fullButtonRight <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.fullpage.moveSlideRight();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
fullButtonLeft <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.fullpage.moveSlideLeft();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
fullButtonCustom <- function(..., fun, outline = FALSE, clear = FALSE){
  if(missing(fun))
    stop("missing function")


  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){", fun, "});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
pageButton <- fullButton

#' @rdname button
#' @export
multiButton <- fullButton

#' @rdname button
#' @export
pageButtonUp <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.pagepiling.moveSectionUp();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
pageButtonDown <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.pagepiling.moveSectionDown();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
pageButtonTo <- function(..., section, outline = FALSE, clear = FALSE){

  if(missing(section))
    stop("must pass section", call. = FALSE)

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  if(!inherits(section, "numeric"))
    section <- paste0("'", section, "'")

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.pagepiling.moveTo(", section, ");});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
multiButtonUp <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.multiscroll.moveSectionDown();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
multiButtonDown <- function(..., outline = FALSE, clear = FALSE){

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.multiscroll.moveSectionDown();});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}

#' @rdname button
#' @export
multiButtonTo <- function(..., section, outline = FALSE, clear = FALSE){

  if(missing(section))
    stop("must pass section", call. = FALSE)

  id <- rand()

  button <- fullButton(..., id = id, outline = outline, clear = clear)

  if(!inherits(section, "numeric"))
    section <- paste0("'", section, "'")

  JS <- paste0("$(document).on('click', '#", id, "', function(){$.fn.multiscroll.moveTo(", section, ");});")

  shiny::tagList(
    shiny::tags$head(
      shiny::tags$script(
        JS
      )
    ),
    button
  )
}
