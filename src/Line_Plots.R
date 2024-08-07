setwd('P:/Geotiff')
library(raster)
library(ggplot2)
library(terra)
GEDI_Raster <- raster("GEDI_Cornwall.tif")
ESA_Raster <- raster("ESA_Resample_Mean.tif")
ICESat2_Raster <- raster("ICESat2_Resample_Mean.tif")
extract_data_with_index <- function(raster_data, dataset_name) {
  df <- as.data.frame(raster::rasterToPoints(raster_data))
  names(df) <- c("X", "Y", "Value")
  df$Index <- 1:nrow(df)
  df$Dataset <- dataset_name
  return(df)
}
GEDI_Data <- extract_data(GEDI_Raster, "GEDI Dataset")
ESA_Data <- extract_data(ESA_Raster, "ESA Dataset")
ICESat2_Data <- extract_data(ICESat2_Raster, "ICESat2 Dataset")
GEDI_Data$Dataset <- "GEDI"
ESA_Data$Dataset <- "ESA CCI"
ICESat2_Data$Dataset <- "ICESat2"
combined_data <- rbind(GEDI_Data, ESA_Data, ICESat2_Data)
ggplot(combined_data, aes(x = X, y = Value, color = Dataset)) +
  geom_line() + 
  labs(title = 'Biomass Density', x = 'Pixel Index', y = 'Biomass') + 
  theme_minimal()
