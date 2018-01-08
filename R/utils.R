build_opts_fp <- function(opts = NULL){
  opts <- p_opts(opts)

  paste0("$(document).ready(function() {$('#fullpageshiny').fullpage(", opts, ");});")
}

build_opts_pp <- function(opts = NULL){
  opts <- p_opts(opts)

  paste0("$(document).ready(function() {$('#fullpagePilling').pagepiling(", opts, ")});")
}

build_opts_mp <- function(opts = NULL){
  opts <- p_opts(opts)

  paste0("$(document).ready(function() {$('#multiscrollshiny').multiscroll(", opts, ");});")
}

p_opts <- function(opts){
  jsonlite::toJSON(opts, auto_unbox = TRUE, force = TRUE)
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

rand <- function(){
  paste0(tolower(sample(c(LETTERS, 1:9), 26 + 9)), collapse = "")
}
