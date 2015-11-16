
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
library(shiny)
library(shinydashboard)

shinyServer(function(input, output) {
  
  output$tab <- renderText({input$tabs})
  
  output$menu <- renderMenu({
    sidebarMenu(.list = menuItems)
  })
  
  output$content_header <- renderUI({
    active_tab_info <- bd_ui_tabs() %>% filter(tabName %in% input$tabs)
    content_header(title = active_tab_info$text
                   ,subtitle = active_tab_info$desc
                   ,tabName = active_tab_info$tabName
                   ,icon = active_tab_info$icon)
  })
}) 