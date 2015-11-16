library(shinydashboard)
library(magrittr)
library(plyr)
library(dplyr)

# Banco de dados para construir o UI do app
bd_ui_tabs <- reactive({
  read.csv2("www/csv/bd_ui_tabs.csv", stringsAsFactors = FALSE)
})
  
# Constrói lista de itens do sidebarMenu
menuItems <- function(bd_ui_tabs) {
  bd_ui_tabs %>%
    plyr::dlply(.(tab_id), function(args) {
      args %$% c(text = ifelse(text %>% is.na, "", text)
               ,icon = if (icon %>% is.na){NULL} else {shiny::icon(icon)}
               ,badgeLabel = ifelse(badgeLabel %>% is.na, NULL, badgeLabel)
               ,badgeColor = ifelse(badgeColor %>% is.na, "green", badgeColor)
               ,tabName = ifelse(tabName %>% is.na, NULL, tabName)
               ,href = ifelse(href %>% is.na, NULL, href)
               ,newtab = ifelse(newtab %>% is.na, NULL, newtab)
               ,selected = ifelse(selected %>% is.na, NULL, selected)) %>% print
      args %$%
        menuItem(text = ifelse(text %>% is.na, "", text)
                ,icon = if (icon %>% is.na){NULL} else {shiny::icon(icon)}
                ,badgeLabel = ifelse(badgeLabel %>% is.na, NULL, badgeLabel)
                ,badgeColor = ifelse(badgeColor %>% is.na, "green", badgeColor)
                ,tabName = ifelse(tabName %>% is.na, NULL, tabName)
                ,href = ifelse(href %>% is.na, NULL, href)
                ,newtab = ifelse(newtab %>% is.na, NULL, newtab)
                ,selected = ifelse(selected %>% is.na, NULL, selected))
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