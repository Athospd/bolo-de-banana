library(shinydashboard)
library(magrittr)
library(plyr)
library(dplyr)

# Banco de dados para construir o UI do app
bd_ui_tabs <- reactive({
  a<-read.csv2("www/csv/bd_ui_tabs.csv", stringsAsFactors = FALSE)
})
  
# Constrói lista de itens do sidebarMenu
menuItems <- function(bd_ui_tabs) {
  bd_ui_tabs %>%
    plyr::dlply(.(tabName), function(args) {
      args %$% {
        if(args$tab_parent_id == 0) {
          function(...) {
            # se ... tiver um elemento, então
            menuItem(text = if(text %>% is.na) {""} else {text}
                    ,icon = if (icon %>% is.na) {NULL} else {shiny::icon(icon)}
                    ,badgeLabel = if(badgeLabel %>% is.na) {NULL} else {badgeLabel}
                    ,badgeColor = if(badgeColor %>% is.na) {"green"} else {badgeColor}
                    ,tabName = if(tabName %>% is.na) {NULL} else {tabName}
                    ,href = if(href %>% is.na) {NULL} else {href}
                    ,newtab = if(newtab %>% is.na) {TRUE} else {newtab}
                    ,selected = if(selected %>% is.na) {NULL} else {selected},
                    ...)
            # se ... tiver uma lista de elementos, então
            # loop menuItem...
          }
        } else {
          menuSubItem(text = if(text %>% is.na) {""} else {text}
                   ,icon = if (icon %>% is.na) {NULL} else {shiny::icon(icon)}
                   ,tabName = if(tabName %>% is.na) {NULL} else {tabName}
                   ,href = if(href %>% is.na) {NULL} else {href}
                   ,newtab = if(newtab %>% is.na) {TRUE} else {newtab}
                   ,selected = if(selected %>% is.na) {NULL} else {selected})
        }
      }
    }) 
}

# Constrói o header das páginas com título e breadcrumb
content_header <- function(title = "", subtitle = "", tabName = "", icon = "question-circle") {
  tags$section(class="content-header",
               h1(title, 
                  tags$small(subtitle)
               ),
               tags$ol(class="breadcrumb",
                       tags$li(a(href="#", icon(icon),"Início")),
                       tags$li(class="active", tabName)
               )
  )
}