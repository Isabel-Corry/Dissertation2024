> setwd('R:/s2587604/Biomass_Data/Resample')
> library(raster)
Loading required package: sp
Warning messages:
  1: package ‘raster’ was built under R version 4.2.3 
2: package ‘sp’ was built under R version 4.2.3 
> library(rgdal)
Please note that rgdal will be retired during 2023,
plan transition to sf/stars/terra functions using GDAL and PROJ
at your earliest convenience.
See https://r-spatial.org/r/2022/04/12/evolution.html and https://github.com/r-spatial/evolution
rgdal: version: 1.6-5, (SVN revision 1199)
Geospatial Data Abstraction Library extensions to R successfully loaded
Loaded GDAL runtime: GDAL 3.5.2, released 2022/09/02
Path to GDAL shared files: C:/ProgramData/R422/library/rgdal/gdal
GDAL binary built with GEOS: TRUE 
Loaded PROJ runtime: Rel. 8.2.1, January 1st, 2022, [PJ_VERSION: 821]
Path to PROJ shared files: C:/ProgramData/R422/library/rgdal/proj
PROJ CDN enabled: FALSE
Linking to sp version:1.6-0
To mute warnings of possible GDAL/OSR exportToProj4() degradation,
use options("rgdal_show_exportToProj4_warnings"="none") before loading sp or rgdal.
> library(ggplot2)
Warning message:
  package ‘ggplot2’ was built under R version 4.2.3 
> file_paths <- list(
  +     GEDI = 'GEDI_Cornwall.tif'
  +     ESA = 'ESA_Resample_Mean.tif'
  Error: unexpected symbol in:
    "    GEDI = 'GEDI_Cornwall.tif'
    ESA"
  > file_paths <- list(
    +     GEDI = 'GEDI_Cornwall.tif',
    +     ESA = 'ESA_Resample_Mean.tif',
    +     ICESat2 = 'ICESat2_Resample_Mean.tif'
    + )
  > Biomass_Raster <- lapply(file_paths, raster)
  > Saturation_thresholds <- list(
    +     GEDI = 200, 
    +     ESA = 150, 
    +     ICESat2 = 150
    + )
  > find_saturated_pixels <- function(raster_data, thresold) {
    +     raster_data >= thresold
    + }
  > saturated_pixels <- mapply(find_saturated_pixels, Biomass_Raster, Saturation_thresholds, SIMPLIFY = FALSE)
  > Calcualte_Saturation_Statistics <- function(saturated_raster) {
    +     num_saturated_pixels <- sum(value(saturated_raster), na.rm = TRUE)
    +     total_pixels <- ncell(saturated_raster)
    +     percentage_saturation <- (num_saturated_pixels, percentage_saturation = percentage_saturation)
    Error: unexpected ',' in:
      "    total_pixels <- ncell(saturated_raster)
    percentage_saturation <- (num_saturated_pixels,"
    > Calcualte_Saturation_Statistics <- function(saturated_raster) {
      +     num_saturated_pixels <- sum(value(saturated_raster), na.rm = TRUE)
      +     total_pixels <- ncell(saturated_raster)
      +     percentage_saturation <- (num_saturated_pixels / total_pixels) * 100
      +     list(num_saturated_pixels = num_saturated_pixels, percentage_saturation = percentage_saturation)
      + }
    > Saturation_Stats <- lapply(saturated_pixels, Calcualte_Saturation_Statistics)
    Error in value(saturated_raster) : could not find function "value"
    > Saturation_Stats <- lapply(saturated_pixels, Calcualte_Saturation_Statistics)
    Error in value(saturated_raster) : could not find function "value"
    > Calcaulate_Saturation_Statistics <- function(saturated_raster) {
      +     num_saturated_pixels <- sum(getValues(saturated_raster) >= 1, na.rm = TRUE)
      +     total_pixels <- ncell(saturated_raster)
      +     percentage_saturation <- (num_saturated_pixels, percentage_saturation = percentage_saturation)
Error: unexpected ',' in:
"    total_pixels <- ncell(saturated_raster)
  percentage_saturation <- (num_saturated_pixels,"
> Calcaulate_Saturation_Statistics <- function(saturated_raster) {
        +     num_saturated_pixels <- sum(getValues(saturated_raster) >= 1, na.rm = TRUE)
        +     total_pixels <- ncell(saturated_raster)
        +     percentage_saturation <- (num_saturated_pixels / total_pixels) * 100 
        +     list(num_saturated_pixels = num_saturated_pixels, percentage_saturation = percentage_saturation)
        + }
> Saturation_Stats <- lapply(saturated_pixels, Calcaulate_Saturation_Statistics)
> for (name in names(Saturation_Stats)) {
        +     cat(paste0(name, " - Number of saturated pixels:",
                         + Saturation_Stats[[name]]$num_saturated_pixels, 
                         +             ", Percentage: ", round(Saturation_Stats[[name]]
                                                               + $percentage_saturation, 2), "%\n"))
        + }
GEDI - Number of saturated pixels:4, Percentage: 0.02%
ESA - Number of saturated pixels:0, Percentage: 0%
ICESat2 - Number of saturated pixels:0, Percentage: 0%
> raster_to_df <- fucntion(raster_data, name) {
Error: unexpected '{' in "raster_to_df <- fucntion(raster_data, name) {"
> raster_to_df <- function(raster_data, name) {
+     df <- as.data.frame(raster_data, xy = TRUE)
+     colnames(df) <- c("x", "y", "value")
+     df$saturated <- ifelse(ds$value >= Saturation_thresholds[[name]], 
+ "Saturated", "Not Saturated")
+     df$name <- name 
+     df
+ }
> plot_data <- do.call(rbind, mapply(raster_to_df, Biomass_Raster, 
+ names(Biomass_Raster), SIMPLIFY = FALSE))
Error in ifelse(ds$value >= Saturation_thresholds[[name]], "Saturated", : 
  object 'ds' not found 
> raster_to_df <- function(raster_data, name) {
+     df <- as.data.frame(raster_data, xy = TRUE)
+     colnames(df) <- c("x", "y", "value")
+     df$saturated <- ifelse(df$value >= Saturation_thresholds[[name]], 
+ "Saturated", "Not Saturated")
+     df$name <- name 
+     df
+ }
> plot_data <- do.call(rbind, mapply(raster_to_df, Biomass_Raster, 
+ names(Biomass_Raster), SIMPLIFY = FALSE))
> ggplot(plot_data, aes(x= x, y = y, fill = saturated)) +
+     geom_raster() +
+     facet_wrap(~ nanme) +
+     scale_fill_manual(values = c("Saturated = "red", "Not Saturated" = "green")) +
Error: unexpected symbol in:
"   facet_wrap(~ nanme) +
     scale_fill_manual(values = c("Saturated = "red"
> ggplot(plot_data, aes(x= x, y = y, fill = saturated)) +
+     geom_raster() +
+     facet_wrap(~ name) +
+     scale_fill_manual(values = c("Saturated = "red", "Not Saturated" = "green")) +
      Error: unexpected symbol in:
"    facet_wrap(~ name) +
     scale_fill_manual(values = c("Saturated = "red"
> ggplot(plot_data, aes(x= x, y = y, fill = saturated)) +
  +     geom_raster() +
  +     facet_wrap(~ name) +
  +     scale_fill_manual(values = c("Saturated" = "red", "Not Saturated" = "green")) +
  +     theme_minimal() +
  +     labs(title = "Saturated Areas in Biomass Datasets", fill = "Saturation")
Warning messages
1: Raster pixels are placed at uneven horizontal intervals and will be shifted
  ℹ Consider using `geom_tile()` instead. 
2: Raster pixels are placed at uneven horizontal intervals and will be shifted
  ℹ Consider using `geom_tile()` instead. 
> Combined_Saturation <- Reduce('|', saturated_pixels)
Error in f(init, x[[i]]) : 
 Cannot compare Rasters that have different BasicRaster attributes. See compareRaster()
> Align_Raster_Properties <- function(raster_list) {
+     first_raster <- raster_list[[1]]
+     extent <- extent(first_raster)
+     res <- res(first_raster)
+     crs <- CRS(first_raster)
+ }
> Align_Raster_Properties <- function(raster_list) {
+     first_raster <- raster_list[[1]]
+     extent <- extent(first_raster)
+     res <- res(first_raster)
+     crs <- CRS(first_raster)
+     raster_list <- lapply(raster_list, function(r){
+         r <- resample(r, first_raster, method = "bilinear")
+         projection(r) <- projection(first_raster)
+         r
+     })
+     
+     return(raster_list)
+ }
> Biomass_Rasters_Aligned <- Align_Raster_Properties(Biomass_Raster)
Error in !is.na(projargs) && !nzchar(projargs) : 
 invalid 'x' type in 'x && y'
> sapply(Biomass_Raster, function(r){
+     list(exent = extent(r), resoltuion = res(r), projection = projection(r))
+ })
GEDI                                                                                                             
 exent      <S4 class ‘Extent’ [package “raster”] with 4 slots>                                                              
 resoltuion numeric,2                                                                                                        
 projection "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_d" [truncated]
ESA                                                                                                              
 exent      <S4 class ‘Extent’ [package “raster”] with 4 slots>                                                              
 resoltuion numeric,2                                                                                                        
 projection "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_d" [truncated]
ICESat2                                                                                                          
 exent      <S4 class ‘Extent’ [package “raster”] with 4 slots>                                                              
 resoltuion numeric,2                                                                                                        
 projection "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_d" [truncated]
> Align_Raster_Properties <- function(raster_list) {
+     first_raster <- raster_list[[1]]
+     extent <- extent(first_raster)
+     res <- res(first_raster)
+     crs <- CRS(first_raster)
+     raster_list <- lapply(raster_list, function(r) {
+         r <- resample(r, first_raster, method = "bilinear")
+         projection(r) <- projection(first_raster)
+         r
+     })
+     
+     return(raster_list)
+ 
> Biomass_Rasters_Aligned <- Align_Raster_Properties(Biomass_Raster)
Error in !is.na(projargs) && !nzchar(projargs) : 
 invalid 'x' type in 'x && y'