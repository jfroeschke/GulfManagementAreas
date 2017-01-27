##   This is intended to serve as a template for future Gulf Council mapping applications.
## ui.R
## November 5, 2015
## version 0.10


ui <- dashboardPage(skin="black",
  dashboardHeader(title = "", disable=TRUE),
 
 ############################ dashboardSidebar###########################################################################
  dashboardSidebar(disable = FALSE,
          sidebarMenu(## List of icons: http://fontawesome.io/icons/
               menuItem("Welcome", tabName = "Welcome", icon = icon("fa fa-info-circle"),badgeLabel = "new", badgeColor = "green"),
               menuItem("Map", tabName = "distribution", icon = icon("fa fa-globe"),selected=TRUE)
                         ), #sidebarMenu

                         div(img(src="CoralViewerSideBar4.png", height=517, width=200), style="text-align: center;"),                 
                         div(tags$a(href="mailto: portal@gulfcouncil.org", h4("Contact us")), align="center"),
                         div(tags$a(href="http://portal.gulfcouncil.org/gulfcoral/gulfcoral.zip", h4("Download data")), align="center")
                    ), #dashboardSidebar
 ############################ dashboardSidebar###########################################################################
 
 ############################ dashboardBody   ########################################################################### 
  dashboardBody(
          tabItems(
               tabItem(tabName = "distribution",
                    fluidRow(
                         column(width = 12,
                              box(width=NULL, solidHeader = TRUE,    
                                   tags$img(src="ReefFishManagementAreasBanner.png",  width="100%"),    
                                   tags$style(type="text/css", "h2 { color: #708090;font-style: normal; }"),
                                        div(tags$p()), ## space between pictures
                                        style= "font-family: 'Lobster', cursive",
                                         style = "color: #708090;",
                                  leafletOutput("map", height=700)
                                        ) ##box,
                                   ) ##column
                              ) ##fluidRow
                         ) ##tabItem
                    ) ##tabItems
               ) ##dashboardBody
 ############################ dashboardBody   ###########################################################################
) ##dashboardPage