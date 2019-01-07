library(shiny)
library(fullPage)
library(rvest)
library(htmltools)
library(purrr)
library(httr)
library(parallel)

base_url <- "https://shiny.rstudio.com/"

shinyapps_url <- "https://gallery.shinyapps.io/"

# get all apps
apps <- read_html(paste0(base_url, "gallery/")) %>%
  html_nodes(css = ".gallery-app-item") %>%
  html_children() %>%
  html_nodes(css = "a") %>%
  html_attr("href")

# only recover the app name
appNames <- map(apps, gsub, pattern = "/gallery/", replacement = "")
appNames <- map(appNames, gsub, pattern = ".html", replacement = "")

# build urls
urls <- lapply(seq_along(apps), FUN = function(i) {
  paste0(shinyapps_url, appNames[[i]])
})

# test for 404 error or other tp select only good urls (do it in parallel)
# since httr::GET is very slow
test_url <- mclapply(urls, GET, mc.cores = detectCores())
good_url_index <- unlist(
  lapply(seq_along(test_url), FUN = function(i) {
    if (test_url[[i]]$status_code == 200) i else NULL
  })
)
good_urls <- urls[good_url_index]


# unleash the daemon
ui <- fullPage(
  lapply(
    X = seq_along(good_urls),
    FUN = function(i) {
      fullSection(
        menu = i,
        tags$iframe(src = good_urls[[i]], width = "100%", height = "100%")
      )
    }
  )
)

server <- function(input, output){}

shinyApp(ui, server)
