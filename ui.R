
# This is the user-interface definition of a Shiny web application.


shinyUI(navbarPage("",
                   # "Analysis" Tab
                   tabPanel(p(strong("Analysis"), style = "color:black"),
                            titlePanel(p(span("Type and amount of the leading causes of death worldwide"), style = "color:blue")),
                            sidebarLayout(
                              # Input Panel
                              sidebarPanel(
                                img(src = "http://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/World_Map_Blank.svg/320px-World_Map_Blank.svg.png",
                                    height = 180, width = 230),
                                selectInput("country", "Country:", 
                                            choices=unique(as.character(country$Country)),
                                            multiple = TRUE,  selectize=TRUE 
                                ), 
                                selectInput("cause", "Cause:", 
                                            choices=unique(as.character(cause$Cause)), selectize=TRUE 
                                ),
                                hr(),
                                helpText("Choose countries and the cause of death  for analyzes them.")
                              ),
                              
                              
                              # Output panel
                              mainPanel(
                                tags$head(
                                  tags$style("body {background-color: #F2F5A9; }")
                                ),
                                h4(p(strong("Graph"), style = "color:black")),
                                # Line Gragh
                                plotOutput("distPlot"),
                                h4(p(strong("Boxplot"), style = "color:black")),
                                # Bocplot Graph
                                plotOutput("distBoxplot"),
                                h4(p(strong("Table"), style = "color:black")),
                                # Table
                                tableOutput("view"),
                                tags$head(tags$style("#view table {background-color: white; }", media="screen", type="text/css"))
                                
                              )
                            )
                   ),
                   # "Documentation" Tab 
                   tabPanel(p(strong("Documentation"), style = "color:black"),
                            fluidRow(
                              column(8,
                                     includeMarkdown("help.Rmd")
                              ),
                              column(3,
                                     img(src=paste0("http://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/World_Map_Blank.svg/320px-World_Map_Blank.svg.png")),
                                     tags$small(
                                       "Source: By Moyogo (From Image:World map pol 2005 v02.svg) [Public domain], via Wikimedia Commons"
                                     )
                              )
                            )
                   ),
                   # "About" Tab 
                   tabPanel(p(strong("About"), style = "color:black"),
                            fluidRow(
                              column(6,
                                     includeMarkdown("about.Rmd")
                              ),
                              column(3,
                                     img(src=paste0("http://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/World_Map_Blank.svg/320px-World_Map_Blank.svg.png")),
                                     tags$small(
                                       "Source: By Moyogo (From Image:World map pol 2005 v02.svg) [Public domain], via Wikimedia Commons"
                                     )
                              )
                            )
                   )
)
)