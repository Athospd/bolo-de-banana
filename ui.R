
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
## Body content
library(shiny)
library(shinydashboard)

header <- dashboardHeader()

sidebar <- dashboardSidebar(
  sidebarUserPanel("User Name",
                   subtitle = a(href = "#", icon("circle", class = "text-success"), "Online"),
                   # Image file should be in www/ subdir
                   image = "userimage.png"
  ),
  sidebarSearchForm(label = "Enter a number", "searchText", "searchButton"),
  sidebarMenu(
    # Setting id makes input$tabs give the tabName of currently-selected tab
    id = "tabs",
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", icon = icon("th"), tabName = "widgets", badgeLabel = "new",
             badgeColor = "green"),
    menuItem("Charts", icon = icon("bar-chart-o"),
             menuSubItem("Sub-item 1", tabName = "subitem1"),
             menuSubItem("Sub-item 2", tabName = "subitem2")
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem("dashboard",
            div(p("Dashboard tab content"))
    ),
    tabItem("widgets",
            "Widgets tab content"
    ),
    tabItem("subitem1",
            "Sub-item 1 tab content"
    ),
    tabItem("subitem2",
            "Sub-item 2 tab content"
    )
  )
)

dashboardPage(header, sidebar, body)