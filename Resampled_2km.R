#Resample to 2km 
> setwd('R:/s2587604/Biomass_Data/Resample')
>Resample_Geotiff <- function(input_file, output_file, new_width, new_height) {
  +     raster_data <- raster(input_file)
  +     factor_x <- new_width / res(raster_data)[1]
  +     factor_y <- new_height / res(raster_data)[2]
  +     resampled_raster <- aggregate(raster_data, fact = c(factor_x, factor_y), fun = mean)
  +     writeRaster(resampled_raster, output_file, format = "GTiff", overwrote = TRUE)
  + }
> main <- function() {
  +     input_ESA <- "ESA_Extract_Merged.tif"
  +     input_ICESat2 <- "ICESat2_Cornwall_1B.tif"
  +     output_ESA <- "ESA_Resampled_2km.tif"
  +     output_ICESat2 <- "ICESat2_Resampled_2km.tif"
  +     new_width <- 2000
  +     new_height <- 2000
  +     Resample_Geotiff(input_ESA, output_ESA, new_width, new_height)
  +     Resample_Geotiff(input_ICESat2, output_ICESat2, new_width, new_height)
  + }
> main()
> resample_geotiff <- function(input_file, output_file, new_width, new_height) {
  +     raster_data <- raster(input_file)
  +     factor_x <- new_width / res(raster_data)[1]
  +     factor_y <- new_height / res(raster_data)[2]
  +     resampled_raster <- aggregate(raster_data, fact = c(factor_x, factor_y), fun = mean)
  +     writeRaster(resampled_raster, output_file, format = "GTiff", overwrite = TRUE)
  + }
> main <- function() {
  +     input_GEDI <- "GEDI_Cornwall_BNG.tif"
  +     output_GEDI <- "GEDI_Resampled_2km.tif"
  +     new_height <- 2000
  +     new_width <- 2000
  +     resample_geotiff(input_GEDI, output_GEDI, new_width, new_height)
  + }
> main()