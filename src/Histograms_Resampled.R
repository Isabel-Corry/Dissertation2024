setwd('P:/Geotiff')
library(raster)
library(ggplot2)
library(reshape2)
read_geotiff <- function(file_path) {
  +     raster_data <- raster(file_path)
  +     data <- as.data.frame(raster_data, xy = TRUE)
  +     return(data)
  + }
file_paths <- c('GEDI_Cornwall.tif', 'ESA_Resample_Mean.tif', 'ICESat2_Resample_Mean.tif', 'ALS_Biomass_Extract_Resampled.tif' )
datasets <- lapply(file_paths, read_geotiff)
biomass_values <- lapply(datasets, function(df){
  +     na.omit(df[, 3])
  + }) 
biomass_data <- data.frame(
  +     value = unlist(biomass_values), 
  +     dataset = rep(c('GEDI Biomass','ESA Biomass', 'ICESat2 Biomass', 'ALS Biomass'), times = sapply(biomass_values, length))
  + )
ggplot(biomass_data, aes(x = value)) +
  +     geom_histogram(bins = 5, fill = "blue", color = "black", alpha = 0.5) + 
  +     facet_wrap(~ dataset, scales = "free") +
  +     labs(x = "Pixel Values", y = "Frequency", title = "Histograms of Biomass Datasets", xlim) +
  +     theme_minimal()
