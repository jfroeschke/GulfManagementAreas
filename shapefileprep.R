##Shapefile prep for reef fish management areas

library(rgdal)
## Shallow water grouper closure
setwd("X:/Data_John/shiny/reeffishmanagementareas/swg")
lineSWG <- readOGR("SWG_ln.shp", layer="SWG_ln")
pointSWG <- readOGR("SWG_pt.shp", layer="SWG_pt")

setwd("X:/Data_John/shiny/reeffishmanagementareas/gulf_reefll_seasonal")
polyLongLine <- readOGR("Gulf_ReefLL_seasonal_po.shp", layer="Gulf_ReefLL_seasonal_po")
pointLongLine <- readOGR("Gulf_ReefLL_seasonal_pt.shp", layer="Gulf_ReefLL_seasonal_pt")

setwd("X:/Data_John/shiny/reeffishmanagementareas/longline_buoy")
polyLongLineBuoy <- readOGR("longline_buoy_po.shp", layer="longline_buoy_po")
pointLongLineBuoy <- readOGR("longline_buoy_pt.shp", layer="longline_buoy_pt")

setwd("X:/Data_John/shiny/reeffishmanagementareas/reef_stressed")
polyReefStressed <- readOGR("reef_stressed_po.shp", layer="reef_stressed_po")
pointReefStresssed <- readOGR("reef_stressed_pt.shp", layer="reef_stressed_pt")

setwd("X:/Data_John/shiny/reeffishmanagementareas/NorthernAndSouthern")
SWGOpen <- readOGR("NorthernSGrouper.shp", layer="NorthernSGrouper")
SWGClosed <- readOGR("SouthernSGrouper.shp", layer="SouthernSGrouper")

library(taRifx.geo)
polySWG <- rbind(SWGOpen, SWGClosed)

setwd("X:/Data_John/shiny/reeffishmanagementareas")
save.image("ReefFishManagement.RData")