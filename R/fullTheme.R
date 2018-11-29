#' Set theme
#'
#' Set a theme.
#'
#' @param theme theme, see details.
#'
#' @details
#' Valid \code{theme}:
#' \itemize{
#'   \item{\code{aqua}}
#'   \item{\code{black}}
#'   \item{\code{blue}}
#'   \item{\code{dark2}}
#'   \item{\code{fuchsia}}
#'   \item{\code{gray}}
#'   \item{\code{green}}
#'   \item{\code{lime}}
#'   \item{\code{maroon}}
#'   \item{\code{navy}}
#'   \item{\code{olive}}
#'   \item{\code{orange}}
#'   \item{\code{purple}}
#'   \item{\code{red}}
#'   \item{\code{silver}}
#'   \item{\code{teal}}
#'   \item{\code{yellow}}
#' }
#'
#' @examples
#' if(interactive()){
#'
#'   ui <- fullPage(
#'
#'     center = TRUE,
#'
#'     fullTheme("red"), # theme
#'
#'     fullSection(
#'       center = TRUE,
#'       h1("Themes")
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
#'     )
#'   )
#'
#'   server <- function(input, output){}
#'
#'   shinyApp(ui, server)
#' }
#' @author John Coene, \email{jcoenep@@gmail.com}
#'
#' @rdname theme
#' @export
fullTheme <- function(theme){
  if(missing(theme))
    stop("must pass theme.")

  file <- paste0("themes/", theme, ".css")

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeCSS(
          system.file(file, package = "fullPage")
        )
      )
    )
  )
}

#' @rdname theme
#' @export
multiTheme <- fullTheme

#' @rdname theme
#' @export
pageTheme <- fullTheme
