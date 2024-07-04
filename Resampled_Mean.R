setwd('R:/s2587604/Biomass_Data/Resample')
library(raster)
library(rgdal)
Resample_Geotiff <- function(input_file, output_file, new_width, new_height) {
  +     raster_data <- raster(input_file)
  +     factor_x <- new_width / res(raster_data)[1]
  +     factor_y <- new_height / res(raster_data)[2]
  +     resampled_raster <- aggregate(raster_data, fact = c(factor_x, factor_y), fun = mean)
  +     writeRaster(resampled_raster, output_file, format="GTiff", overwrite = TRUE)
  + }
main <- function() {
  +     input_file_ESA <- "ESA_Extract_Merged.tif"
  +     input_file_ICESat2 <- "ICESat2_Cornwall_1B.tif"
  +     output_file_ESA <- "ESA_Resampled_Mean.tif"
  +     outout_file_ICESat2 <- "ICESat2_Resampled_Mean.tif"
  +     new_width <- 800
  +     new_height <- 1300 
  +     Resample_Geotiff(input_file_ESA, output_file_ESA, new_width, new_height)
  +     Resample_Geotiff(input_file_ICESat2, output_file_ICESat2, new_width, new_height)
  + }
main()