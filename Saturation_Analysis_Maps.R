>setwd('R:/s2587604/Biomass_Data/Resample')
>library(raster)
>library(rgdal)
>File_Paths <- list(
 GEDI = "GEDI_Cornwall.tif",
 ESA = "ESA_Resample_Mean.tif",
 ICESat2 = "ICESat2_Resample_Mean.tif"
 )
>Biomass_Rasters <- lapply(File_Paths, raster)
>Raster_Properties <- lapply(Biomass_Rasters, function(r) {
 list(extent = extent(r), resolution = res(r), projection = projection(r))
 })
>print(Raster_Properties)
>Common_Extent <- Reduce(function(x, y) union(x, y), lapply(Biomass_Rasters, extent))
>Align_Raster_Properties <- function(raster_list, Common_Extent) {
 first_raster <- raster_list[[1]]
 res_first <- res(first_raster)
 crs_first <- crs(first_raster)
>raster_list_aligned <- lapply(raster_list, function(r) {
  if (!!compareRaster(r, first_raster, extent = FALSE, rowcol = FALSE, crs = FALSE, res = FALSE, stopiffalse = FALSE)){
  if (!compareRaster(r, first_raster, crs = TRUE, stopiffalse = FALSE)) {
  r <- projectRaster(r, crs = crs_first)
  
>}
> Biomass_Rasters_Aligned <- Align_Raster_Properties(Biomass_Rasters, Common_Extent)
> Aligned_Properties <- lapply(Biomass_Rasters_Aligned, function(r) {
+     list(extent = extent(r), resolution = res(r), projection = projection(r))
+ })
> print(Aligned_Properties)
  $GEDI
  $GEDI$extent
  class      : Extent 
  xmin       : 82902.01 
  xmax       : 246952.2 
  ymin       : 4297.918 
  ymax       : 117530.8 
    
  $GEDI$resolution
  [1] 1058.388 1058.252
    
  $GEDI$projection
  [1] "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs"
  $ESA
  $ESA$extent
  class      : Extent 
  xmin       : 82902.01 
  xmax       : 246952.2 
  ymin       : 4297.918 
  ymax       : 117530.8 
    
  $ESA$resolution
  [1] 1058.388 1058.252
    
  $ESA$projection
  [1] "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs"
    
    
  $ICESat2
  $ICESat2$extent
  class      : Extent 
  xmin       : 82902.01 
  xmax       : 246952.2 
  ymin       : 4297.918 
  ymax       : 117530.8 
    
  $ICESat2$resolution
  [1] 1058.388 1058.252
    
  $ICESat2$projection
  [1] "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs"
    
    
> Saturation_Threshholds <- list(
+     GEDI = 200, 
+     ESA = 100, 
+     ICESat2 = 100,
+ )
Error in list(GEDI = 200, ESA = 100, ICESat2 = 100, ) : 
 argument 4 is empty
> Saturation_Threshholds <- list(
+     GEDI = 200, 
+     ESA = 100, 
+     ICESat2 = 100
+ )
> Find_Saturated_Pixels <- function(raster_data, threshold) {
+     raster_data >= threshold
+ }
> Saturated_Pixels <- mapply(Find_Saturated_Pixels, Biomass_Rasters_Aligned, Saturation_Threshholds, SIMPLIFY = FALSE)
> Combined_Saturation <- Reduce(' | ', Saturated_Pixels)
Error in get(as.character(FUN), mode = "function", envir = envir) : 
 object ' | ' of mode 'function' was not found
> Combined_Saturation <- Reduce('|', Saturated_Pixels)
> plot(Combined_Saturation, main = "Combined Saturated Areas across All Datasets", col = c("blue", "red"))
> plot(Combined_Saturation, main = "Combined Saturated Areas across All Datasets", col = c("green", "red"))
> plot(Combined_Saturation, main = "Combined Saturated Areas across All Datasets", col = c("light green", "red"))
> Plot_Saturation <- function(saturation_Raster, title) {
+     plot(saturation_Raster, main = title, col = c("light green", "red"), legend = FALSE) 
+ }
> Plot_Saturation(Saturated_Pixels[[1]], "GEDI Saturation")
> Plot_Saturation(Saturated_Pixels[[2]], "ESA Saturation")
> Plot_Saturation(Saturated_Pixels[[3]], "ICESat2 Saturation")
> Saturation_Threshholds <- list(
+     GEDI = 200, 
+     ESA = 100, 
+     ICESat2 = 50
+ )
> Plot_Saturation <- function(saturation_Raster, title) {
+     plot(saturation_Raster, main = title, col = c("light green", "red")) 
+ }
> Plot_Saturation(Saturated_Pixels[[1]], "GEDI Saturation")
> Plot_Saturation(Saturated_Pixels[[2]], "ESA Saturation")
> Plot_Saturation(Saturated_Pixels[[3]], "ICESat2 Saturation")
> print(Saturated_Pixels[[1]])
  class      : RasterLayer 
  dimensions : 107, 155, 16585  (nrow, ncol, ncell)
  resolution : 1058.388, 1058.252  (x, y)
  extent     : 82902.01, 246952.2, 4297.918, 117530.8  (xmin, xmax, ymin, ymax)
  crs        : +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs 
  source     : memory
  names      : layer 
  values     : 0, 1  (min, max)
> print(Saturated_Pixels[[2]]])
    Error: unexpected ']' in "print(Saturated_Pixels[[2]]]"
> print(Saturated_Pixels[[2]])
  class      : RasterLayer 
  dimensions : 107, 155, 16585  (nrow, ncol, ncell)
  resolution : 1058.388, 1058.252  (x, y)
  extent     : 82902.01, 246952.2, 4297.918, 117530.8  (xmin, xmax, ymin, ymax)
  crs        : +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs 
  source     : memory
  names      : layer 
  values     : 0, 1  (min, max)
    
> print(Saturated_Pixels[[3]])
  class      : RasterLayer 
  dimensions : 107, 155, 16585  (nrow, ncol, ncell)
  resolution : 1058.388, 1058.252  (x, y)
  extent     : 82902.01, 246952.2, 4297.918, 117530.8  (xmin, xmax, ymin, ymax)
  crs        : +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs 
  source     : memory
  names      : layer 
  values     : 0, 0  (min, max)
> print(values(Saturated_Pixels[[1]]))
> print(values(Saturated_Pixels[[2]]))
> Saturation_Threshholds <- list(
+     GEDI = 200, 
+     ESA = 100, 
+     ICESat2 = 100
+ )
> Plot_Saturation <- function(saturation_Raster, title) {
+     plot(saturation_Raster, main = title, col = c("light green", "red")) 
+ }
> Plot_Saturation(Saturated_Pixels[[3]], "ICESat2 Saturation")
> Saturated_Pixels <- mapply(Find_Saturated_Pixels, Biomass_Rasters_Aligned, Saturation_Threshholds)
> Plot_Saturation(Saturated_Pixels[[1]], "GEDI Saturation")
> Plot_Saturation(Saturated_Pixels[[2]], "ESA Saturation")
> Plot_Saturation(Saturated_Pixels[[3]], "ICESat2 Saturation")
> print(Saturated_Pixels[[1]])
  class      : RasterLayer 
  dimensions : 107, 155, 16585  (nrow, ncol, ncell)
  resolution : 1058.388, 1058.252  (x, y)
  extent     : 82902.01, 246952.2, 4297.918, 117530.8  (xmin, xmax, ymin, ymax)
  crs        : +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs 
  source     : memory
  names      : layer 
  values     : 0, 1  (min, max)
> print(values(Saturated_Pixels[[1]])
> Saturated_Pixels <- mapply(Find_Saturated_Pixels, Biomass_Rasters_Aligned, Saturation_Threshholds, SIMPLIFY = FALSE)
> Extract_Saturation_Values <- function(raster_data, saturation_mask) {
+     raster_data[saturation_mask]
+ }
> Saturation_Values <- lapply(1:length(Biomass_Rasters), function(i) {
+     Extract_Saturation_Values(Biomass_Rasters[[i]], Saturated_Pixels[[i]])
+ })
> names(Saturation_Values) <- c("GEDI", "ESA", "ICESat2")
> lapply(names(Saturation_Values), function(name) {
  +     cat(paste0(name, "Saturation Values:\n"))
  +     print(Saturation_Values[[name]])
  +     cat("\n")
  + })
> Extrction_Saturation_Values <- function(raster_data, saturation_mask) {
  +     na.omit(raster_data[saturation_mask])
  + }
> Saturation_Values <- lapply(1:length(Biomass_Rasters), function(i) {
  +     Extract_Saturation_Values(Biomass_Rasters[[i]], Saturated_Pixels[[i]])
  + })
> names(Saturation_Values) <- c("GEDI", "ESA", "ICESat2")
> lapply(names(Saturation_Values), function(name) {
  +     cat(paste0(name, "Saturation Values (without NAs) :\n"))
  +     cat("\n")
  + })