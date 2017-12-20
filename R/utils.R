build_opts_fp <- function(opts = NULL){
  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("$(document).ready(function() {$('#fullpageshiny').fullpage(", opts, ");});")
}

build_opts_pp <- function(opts = NULL){

  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("$(document).ready(function() {$('#fullpagePilling').pagepiling(", opts, ")});")
}

build_opts_mp <- function(opts = NULL){
  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("$(document).ready(function() {$('#multiscrollshiny').multiscroll(", opts, ");});")
}


build_section <- function(menu = NULL, center = FALSE, class, ...){
  div <- shiny::tags$div(
    class = class,
    ...
  )

  if(!is.null(menu))
    div <- shiny::tagAppendAttributes(div, `data-anchor` = menu)

  if(isTRUE(center))
    div <- shiny::tagAppendAttributes(div, style = "text-align: center;")

  div
}
