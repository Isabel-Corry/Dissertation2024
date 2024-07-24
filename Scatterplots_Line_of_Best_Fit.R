setwd('P:/Geotiff')
library(raster)
library(rgdal)
library(ggplot2)
GEDI_Biomass <- raster("GEDI_Cornwall.tif")
ESA_Biomass <- raster("ESA_Resample_Mean.tif")
ICESat2_Biomass <- raster("ICESat2_Resample_Mean.tif")
extract_data <- function(raster_layer) {
  +     coords <- xyFromCell(raster_layer, 1:ncell(raster_layer))
  +     values <- getValues(raster_layer)
  +     data.frame(x = coords[, 1], y = coords[, 2], biomass = values)
  + }
GEDI_data <- extract_data(GEDI_Biomass) 
ESA_data <- extract_data(ESA_Biomass)
ICESat2_data <- extract_data(ICESat2_Biomass)
GEDI_data$source <- "GEDI Biomass"
ESA_data$source <- "ESA Biomass"
ICESat2_data$source <- "ICESat2 Biomass"
combined_data <- rbind(GEDI_data, ESA_data, ICESat2_data)
ggplot(combined_data, aes(x = x, y = biomass, color = source)) +
  +     geom_point() +
  +     geom_smooth(method = "lm", se = FALSE) + 
  +     labs(title = "BIomass Scatterplots with Line of Best Fit", x = "X Coordinate", y = "Biomass") + 
  +     theme_minimal()
ggplot(GEDI_data, aes(x = x, y = biomass)) + 
  +     geom_point() +
  +     geom_smooth(method = "lm", se = FALSE) + 
  +     labs(title = "GEDI Biomass", x = "X Coordinate", y = "Biomass") +
  +     theme_minimal()
ggplot(ESA_data, aes(x = x, y = biomass)) + 
  +     geom_point() +
  +     geom_smooth(method = "lm", se = FALSE) + 
  +     labs(title = "ESA Biomass", x = "X Coordinate", y = "Biomass") +
  +     theme_minimal()
ggplot(ICESat2_data, aes(x = x, y = biomass)) + 
  +     geom_point() +
  +     geom_smooth(method = "lm", se = FALSE) + 
  +     labs(title = "ICESat2 Biomass", x = "X Coordinate", y = "Biomass") +
  +     theme_minimal()
