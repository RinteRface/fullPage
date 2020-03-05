.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "fp-css",
    system.file("css", package = "fullPage")
  )
  shiny::addResourcePath(
    "fp-jquery",
    system.file("jquery-3.2.1", package = "fullPage")
  )
  shiny::addResourcePath(
    "fp-js",
    system.file("js", package = "fullPage")
  )
}