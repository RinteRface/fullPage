build_opts_fp <- function(opts = NULL){

  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("
         var options = ", opts, ";
         $.extend(options, {'afterLoad': function(origin, destination, direction){
            Shiny.onInputChange('slide_origin', origin);
            Shiny.onInputChange('slide_destination', destination);
            Shiny.onInputChange('slide_direction', direction);
         }});
         $(document).ready(function() {$('#fullpageshiny').fullpage(options);});
        ")
}

build_opts_pp <- function(opts = NULL){

  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("
         var options = ", opts, ";
         console.log(options);
         $.extend(options, {'afterLoad': function(anchorLink, index){
            Shiny.onInputChange('slide_anchor', anchorLink);
            Shiny.onInputChange('slide_index', index);
         }});
         $(document).ready(function() {$('#fullpagePilling').pagepiling(options)});
        ")
}

build_opts_mp <- function(opts = NULL){
  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("
         var options = ", opts, ";
         console.log(options);
         $.extend(options, {'afterLoad': function(anchorLink, index){
            Shiny.onInputChange('slide_anchor', anchorLink);
            Shiny.onInputChange('slide_index', index);
         }});
         $(document).ready(function() {$('#multiscrollshiny').multiscroll(options);});
        ")
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
