##global R

## This script was used to import and convert the shapefiles to binary
## Obtained from NMFS SERO 12-4-2015

# library(rgdal)

# ## Madison Swanson, edges, steamboat lumps
# setwd("X:/Data_John/shiny/reeffishmanagementareas/madswan_steamboat_edges")
# polyMSESL<- readOGR("MadSwan_Steamboat_Edges_po.shp", layer="MadSwan_Steamboat_Edges_po")

# ## Alabama SMZ
# setwd("X:/Data_John/shiny/reeffishmanagementareas/al_smz")
# polyALSMZ<- readOGR("AL_SMZ_po.shp", layer="AL_SMZ_po")

# ## Shallow water grouper closure
# setwd("X:/Data_John/shiny/reeffishmanagementareas/swg")
# lineSWG <- readOGR("SWG_ln.shp", layer="SWG_ln")
# pointSWG <- readOGR("SWG_pt.shp", layer="SWG_pt")
# 
# setwd("X:/Data_John/shiny/reeffishmanagementareas/gulf_reefll_seasonal")
# polyLongLine <- readOGR("Gulf_ReefLL_seasonal_po.shp", layer="Gulf_ReefLL_seasonal_po")
# pointLongLine <- readOGR("Gulf_ReefLL_seasonal_pt.shp", layer="Gulf_ReefLL_seasonal_pt")
# 
# setwd("X:/Data_John/shiny/reeffishmanagementareas/longline_buoy")
# polyLongLineBuoy <- readOGR("longline_buoy_po.shp", layer="longline_buoy_po")
# pointLongLineBuoy <- readOGR("longline_buoy_pt.shp", layer="longline_buoy_pt")
# 
# setwd("X:/Data_John/shiny/reeffishmanagementareas/reef_stressed")
# polyReefStressed <- readOGR("reef_stressed_po.shp", layer="reef_stressed_po")
# pointReefStresssed <- readOGR("reef_stressed_pt.shp", layer="reef_stressed_pt")
# 
# 
# setwd("X:/Data_John/shiny/reeffishmanagementareas/NorthernAndSouthern")
# SWGOpen <- readOGR("NorthernSGrouper.shp", layer="NorthernSGrouper")
# SWGClosed <- readOGR("SouthernSGrouper.shp", layer="SouthernSGrouper")
# 
# library(taRifx.geo)
# polySWG <- rbind(SWGOpen, SWGClosed)
# setwd("X:/Data_John/shiny/reeffishmanagementareas")
# save.image("ReefFishManagement.RData")

############################### install libraries ##################


# This section is provided for convenience to install libraries that are 
# often required in apps.  May require some special set-up on your R install
# strongly recommend using RStudio
##use development version of leaflet to leverage new features 11.3.2015
# Note: this may be necessary:  Rtools 3.1 from http://cran.r-project.org/bin/windows/Rtools/ and then run find_rtools()
# if (!require('devtools')) install.packages('devtools')
# if (!require('shinydashboard')) install.packages('shinydashboard')
# if (!require('rgdal')) install.packages('rgdal')
# if (!require('sp')) install.packages('sp')
# if (!require('DT')) install.packages('DT')
# library(devtools)
# if (!require('leaflet')) devtools::install_github('rstudio/leaflet')

############################### install libraries ##################

#### Set working directory: this needs to be run prior to using the 
## 'Run App' button, but must be commented out prior to publishing
## to the web!

#setwd("X:/Data_John/shiny/reeffishmanagementareas")

########################## load libraries:
## standard R stuff here :)

## load required libraries
library(shiny)
library(shinydashboard)
library(leaflet)
library(rgdal)
# library(DT)
# library(sp)

#############################

## output version info to text file
## this is useful for debugging
sink("sessionInfo.txt")
sessionInfo()
sink()

load("ReefFishManagement.RData")

##split into separate files
Edges <- subset(polyMSESL, LABEL=="Edges")
SteamboatLumps <- subset(polyMSESL, LABEL=="Steamboat Lumps")
MadisonSwanson <- subset(polyMSESL, LABEL=="Madison and Swanson sites")

Date <- format(Sys.Date(), "%A %b %d %Y") 
DateMonth <- as.numeric(format(Sys.Date(), "%m"))
# DateMonth <- 2
# 
# content <- paste(sep = "","<b> <a test </a></b>",
#                  "Welcome to the Gulf Council Reef Fish Management Mapping tool.  This map illustrates spatial management
# tools currently used to manage Gulf reef fisheries.  Today is ", Date, " and the areas initially displayed on the map 
# are subject to management closure for one or more species and/or gear types.  Layers are clickable with links to a full description of the
#                  regulations and associated boundaries.")

content <- paste(sep = " ",
                 "<b><a href='http://www.gulfcouncil.org' target='_blank'>Gulf Council Reef Fish Management</a></b>", "<br/>",
                 "Welcome to the Gulf Council Reef Fish Management Mapping tool.  This map illustrates spatial management
                 tools currently used to manage Gulf reef fisheries.  <b>Today is</b> ", "<b>",Date,"</b>", " and the areas initially displayed on the map 
are subject to management closure for one or more species and/or gear types.  Layers are clickable with links to a full description of the regulations and associated boundaries.")



