library(fullPage)
library(shiny)

options <- list(
  sectionsColor = c("#E0FFFA", "#CEFFF2", "#C0F9F0", "#90F9EA", "#394C54", "#E0FFFA")
)

ui <- multiPage(
  opts = options,
  multiTheme('aqua'),
  menu = c(
    "multiPage" = "multipage",
    "Split" = "split",
    "Grid" = "grid",
    "Plot" = "plot",
    "Buttons" = "buttons",
    "Sisters" = "sisters"
  ),
  multiLeft(
    align = "right",
    multiSection(
      menu = "multipage",
      h1("multiScroll.js")
    ),
    multiSection(
      menu = "split",
      center = TRUE,
      h1("Split")
    ),
    multiSection(
      center = TRUE,
      menu = "grid",
      multiRow(
        multiColumn("First Column"),
        multiColumn("Second Column")
      )
    ),
    multiSection(
      menu = "plot",
      center = TRUE,
      multiContainer(
        h1("Full Section Plot"),
        selectInput(
          "obs",
          "Select",
          c(10, 20 ,50 ,100 , 150)
        )
      )
    ),
    multiSection(
      menu = "buttons",
      center = TRUE,
      h1("Add buttons", style = "color: white;")
    ),
    multiSection(
      menu = "sisters",
      h1("More like this ->")
    )
  ),
  multiRight(
    align = "left",
    multiSection(
      h1("-Shiny")
    ),
    multiSection(
      plotOutput("plot1")
    ),
    multiSection(
      h1("<- Grid")
    ),
    multiSectionPlot("plot2"),
    multiSection(
      center = TRUE,
      multiButtonDown("Next section", outline = TRUE)
    ),
    multiSection(
      center = TRUE,
      verbatimTextOutput("sistersDemo")
    )
  )
)

server <- function(input, output){
  output$plot1 <- renderPlot({
    par(bg = "#CEFFF2")
    plot(mtcars$mpg, mtcars$wt)
  })

  output$plot2 <- renderPlot({
    par(bg = "#C0F9F0")
    hist(rnorm(input$obs, 10, 5))
  })

  output$sistersDemo <- renderText({
    '# See those
    demo("fullPage", package = "fullPage")
    demo("multiPage", package = "fullPage")'
  })
}

shinyApp(ui, server)
