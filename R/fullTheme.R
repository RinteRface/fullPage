#' Set theme
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
