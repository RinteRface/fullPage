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
#' @author John Coene, \email{jcoenep@@gmail.com}
#'
#' @rdname theme
#' @export
fullTheme <- function(theme){
  .Deprecated("shinytheme", "shinythemes")
}

#' @rdname theme
#' @export
multiTheme <- fullTheme

#' @rdname theme
#' @export
pageTheme <- fullTheme
