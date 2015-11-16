
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
## Body content
library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "Bolo de Banana")

sidebar <- dashboardSidebar(
  sidebarMenuOutput("menu")
)

body <- dashboardBody(
  uiOutput("content_header"),
  tabItems(
    tabItem("bd",
            "Banco de dados"
    ),
    tabItem("descritiva",
            "Descritiva"
    )
  )
)

dashboardPage(header, sidebar, body, skin = "purple")