## server.R
## Modified 10-8-2015
## Modified 9-11-2015
##Version 0.22
## leaflet version leaflet_1.0.0




server <- function(input, output, session) {
  output$map <- renderLeaflet({  
    leaflet() %>%
      #addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
             #  options = providerTileOptions(noWrap = TRUE), group="World Imagery") %>%
      #addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/Mapserver/tile/{z}/{y}/{x}',
          #     options = providerTileOptions(noWrap = TRUE),group="Labels") %>%
             addTiles('http://services.arcgisonline.com/ArcGIS/rest/services/Ocean_Basemap/MapServer/tile/{z}/{y}/{x}',
                      options = providerTileOptions(noWrap = TRUE),group="Oceans") %>%
      setView(-90.2, 27.75, zoom = 6) %>%
    addScaleBar(position=c("bottomleft")) %>%
      
      

#       
# addCircleMarkers(data=pointLongLine,
#                  # addCircleMarkers(data=BlackCoral[ which(BlackCoral$depth>-200), ],            
#                  #addCircleMarkers(data=BlackCoral[which(BlackCoral$depth>=input$integer[1] & BlackCoral$depth<=input$integer[2])]),  
#                  #addCircleMarkers(data=(BlackCoral[which(BlackCoral$depth>=input$integer[1]),]),     
#                  radius = ~3, 
#                  #color="FFFF00",
#                  fillColor = "#a6d854",
#                  #stroke = FALSE, fillOpacity = 0.8, 
#                  stroke = TRUE, fillOpacity = 0.8, color="gray", weight=1,
#                  group="Point LongLine", 
#                  popup =~ '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/seasonal_prohib_longline.txt">Federal regulations</a>'
#                  #                      popup = ~paste(" <b>Depth (m): </b>",  Depth, "<br/>",
#                  #                                     "<b>Common name: </b>", Name, sep = " ")
# ) %>%  

##Madison and Swanson sites and Steamboat Lumps, and the Edges
# addPolygons(data=polyMSESL, fillOpacity=0.5, stroke=FALSE, 
#             fillColor='#66c2a5', 
#             popup= ~ paste("Madison and Swanson sites and Steamboat Lumps, and the Edges,",
#                            "seasonal and area closures designed to protect Gulf reef fish", 
#                            '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/madswan_steam_edges.txt">Federal regulations</a>', 
#                            sep="<br/>"),
#             group="Northern Gulf seasonal closure")  %>% 
  
addPolygons(data=MadisonSwanson, fillOpacity=0.75, stroke=FALSE, 
            fillColor='#66c2a5', 
            popup= ~ paste("<a><b>Madison and Swanson</a></b>",
                           "Seasonal area closures implemented to protect Gulf reef fish", 
                           '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/madswan_steam_edges.txt" target="_blank">Federal regulations</a>', 
                           #'<iframe src="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/madswan_steam_edges.txt"></iframe>',
                           '<iframe src="madswan_steam_edges.txt" height="300" seamless></iframe>',
                           sep="<br/>"),
            group="Madison and Swanson")  %>% 

  addPolygons(data=Edges, fillOpacity=0.75, stroke=FALSE, 
              fillColor='#fc8d62', 
              popup= ~ paste("<a><b>The Edges</a></b>",
                             "seasonal and area closures designed to protect Gulf reef fish", 
                             '<a href="madswan_steam_edges.txt" target="_blank">Federal regulations</a>', 
                             '<iframe id="iframe1" src="madswan_steam_edges.txt" height="300" seamless></iframe>',
                             sep="<br/>"),
              group="The Edges")  %>% 
  
  addPolygons(data=SteamboatLumps, fillOpacity=0.75, stroke=FALSE, 
              fillColor='#8da0cb', 
              popup= ~ paste("<a><b>Steamboat Lumps</a></b>",
                             "seasonal area closures implemented to protect Gulf reef fish", 
                             '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/madswan_steam_edges.txt" target="_blank">Federal regulations</a>', 
                             '<iframe id="iframe1" src="madswan_steam_edges.txt" height="300" seamless></iframe>',
                             sep="<br/>"),
              group="Steamboat lumps")  %>% 

  addPolygons(data=SWGClosed, fillOpacity=0.75, stroke=FALSE, 
              fillColor='#e78ac3', 
              popup= ~ paste("<a><b>Shallow water grouper (SWG) seasonal closure</a></b>", 
                             '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/swg.txt" target="_blank">Federal regulations</a>', 
                             '<iframe id="iframe1" src="swg.txt" height="300" seamless></iframe>',
                             sep="<br/>"),
              group="Shallow-water grouper (SWG) seasonal closure")  %>%  
  
  addPolygons(data=polyReefStressed, fillOpacity=0.75, stroke=FALSE, 
              fillColor='#a6d854', 
              popup= ~ paste("<a><b>REef fish stressed area</a></b>", 
                             '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/reef_stressed.txt" target="_blank">Federal regulations</a>', 
                             '<iframe id="iframe1" src="reef_stressed.txt" height="300" seamless></iframe>',
                             sep="<br/>"),
              group="Reef fish stressed area")  %>% 
  
  ##Add polyline: 
  addPolygons(data=polyLongLine, fillOpacity=0.75, stroke=FALSE, 
              fillColor='#ffd92f', 
              popup= ~ paste("<a><b>Seasonal long line closure area</a></b>",
                             "closed June through August each year", 
                             '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/seasonal_prohib_longline.txt" target="_blank">Federal regulations</a>', 
                             '<iframe id="iframe1" src="seasonal_prohib_longline.txt" height="300" seamless></iframe>',
                             sep="<br/>"),
              group="Bottom longline seasonal closure")  %>% 


addPolygons(data=polyLongLineBuoy, fillOpacity=0.75, stroke=FALSE, 
            fillColor='#e5c494', 
            popup= ~ paste("<a><b>Reef fish longline and buoy gear restricted area</a></b>",
                           
                           '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/longlinebuoy.txt" target="_blank" >Federal regulations</a>', 
                           '<iframe id="iframe1" src="longlinebuoy.txt" height="300" seamless></iframe>',
                           sep="<br/>"),
            group="Longline and buoy gear restricted area")  %>% 
  
  
  ##Alabama SMZ
  addPolygons(data=polyALSMZ, fillOpacity=0.75, stroke=FALSE, 
              fillColor='#b3b3b3', #green
              popup= ~ paste("<a><b>Alabama special management zone (SMZ)</a></b>",
                             "gear restricted area", 
                             '<a href="http://sero.nmfs.noaa.gov/maps_gis_data/fisheries/gom/documents/alabamasmz.txt" target="_blank">Federal regulations</a>', 
                             '<iframe id="iframe1" src="alabamasmz.txt" height="300" seamless></iframe>',
                             sep="<br/>"),
              group="Alabama SMZ")  %>% 
  
  addControl(  html=
                 '<table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #66c2a5; stroke: #66c2a5; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Madison and Swanson</td></tr></table>
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #fc8d62; stroke: #fc8d62; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">The Edges</td></tr></table>
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #8da0cb; stroke: #8da0cb; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Steamboat lumps</td></tr></table>
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #e78ac3; stroke: #e78ac3; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Shallow-water grouper (SWG) seasonal closure</td></tr></table>
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #a6d854; stroke: #a6d854; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Reef fish stressed area</td></tr></table>
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #ffd92f; stroke: #ffd92f; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Bottom longline seasonal closure</td></tr></table>
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #e5c494; stroke: #e5c494; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Longline and buoy gear restricted area</td></tr></table>
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #b3b3b3; stroke: #b3b3b3; fill-opacity: 0.75; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Alabama SMZ</td></tr></table>',
               position=c("bottomleft")
  ) %>%
  
  ##add show/hide layers
  addLayersControl(
    overlayGroups = c( "Madison and Swanson",
                       "The Edges",
                       "Steamboat lumps",
                       "Shallow-water grouper (SWG) seasonal closure",
                       "Reef fish stressed area",
                       "Bottom longline seasonal closure",
                       "Longline and buoy gear restricted area",
                       "Alabama SMZ"),
    options = layersControlOptions(collapsed = FALSE),
    position="bottomright"
  ) %>%
  
  ##Reorder grouops on load
  hideGroup("Shallow-water grouper (SWG) seasonal closure") %>%
  hideGroup("Madison and Swanson") %>%
  hideGroup("Steamboat lumps") %>%
  hideGroup("The Edges") %>%
#   hideGroup("Reef fish stressed area") %>%
  hideGroup("Bottom longline seasonal closure") %>%
#   hideGroup("Longline and buoy gear restricted area") %>%
#   hideGroup("Alabama SMZ") %>%
  
  
  showGroup(ifelse(sum(ifelse(DateMonth==(c(1,2,3,4,11,12)), 1,0))>=1, "Madison and Swanson","")) %>%
  showGroup(ifelse(sum(ifelse(DateMonth==(c(1,2,3,4)), 1,0))>=1, "The Edges","")) %>%
  showGroup(ifelse(sum(ifelse(DateMonth==(c(1,2,3,4,11,12)), 1,0))>=1, "Steamboat lumps","")) %>%
  showGroup(ifelse(sum(ifelse(DateMonth==(c(2,3)), 1,0))>=1, "Shallow-water grouper (SWG) seasonal closure","")) %>%
#   showGroup("Bottom longline seasonal closure")%>%
  showGroup(ifelse(sum(ifelse(DateMonth==(c(6,7,8)), 1,0))>=1, "Bottom longline seasonal closure","")) %>%
#   showGroup("Longline and buoy gear restricted area")%>%
  showGroup("Reef fish stressed area")%>%
#   showGroup("Northern Gulf seasonal closure")%>%
  showGroup("Alabama SMZ") %>%
  
  #showGroup(ifelse(Date=="2015-12-08", "Alabama SMZ","")) %>% testing only

  addPopups(-90, 32, content,
            options = popupOptions(closeButton = TRUE)
            )
  })

}