build_opts_fp <- function(opts = NULL){

  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("
         var options = ", opts, ";
         $.extend(options, {'afterLoad': function(origin, destination, direction){
            Shiny.setInputValue('fp_origin', origin, {priority: 'event'});
            Shiny.setInputValue('fp_destination', destination, {priority: 'event'});
            Shiny.setInputValue('fp_direction', direction, {priority: 'event'});
         }});
          $(document).on('shiny:connected', function(event) {$('#fp').fullpage(options);});
        ")
}

build_opts_pp <- function(opts = NULL){

  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("
         var options = ", opts, ";
         $.extend(options, {'afterLoad': function(anchorLink, index){
            Shiny.setInputValue('fp_anchor', anchorLink, {priority: 'event'});
            Shiny.setInputValue('fp_index', index, {priority: 'event'});
         }});
         $(document).on('shiny:connected', function(event) {$('#fp').pagepiling(options)});
        ")
}

build_opts_mp <- function(opts = NULL){
  opts <- jsonlite::toJSON(opts, auto_unbox = T)

  paste0("
         var options = ", opts, ";
         $.extend(options, {'afterLoad': function(anchorLink, index){
          $(document).on('shiny:connected', function(event) {
            Shiny.onInputChange('fp_anchor', anchorLink);
            Shiny.onInputChange('fp_index', index);
          });
         }});
         $(document).ready(function() {$('#fp').multiscroll(options);});
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
  rand_id <- paste0(tolower(sample(c(LETTERS, 1:9), 26 + 9)), collapse = "")
  paste0(sample(letters,1),rand_id)
}
