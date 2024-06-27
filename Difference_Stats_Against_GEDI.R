> setwd('R:/s2587604/Biomass_Data/Resample')
Not all of the characters in R:/s2587604/Biomass_Data/Resample/code_test2706.r could be encoded using ASCII. To save using a different encoding, choose "File | Save with Encoding..." from the main menu.
> library(raster)
Loading required package: sp
Warning messages:
  1: package ‘raster’ was built under R version 4.2.3 
2: package ‘sp’ was built under R version 4.2.3 
> library(terra)
terra 1.7.71
Warning message:
  package ‘terra’ was built under R version 4.2.3 
> ESA_Geotiff <- raster('ESA_Resample_Mean.tif')
> ICEsat2_Geotiff <- raster('ICESat2_Resample_Mean.tif')
> GEDI_Geotiff <- raster('GEDI_Cornwall_BNG.tif')
> Difference_ESA_GEDI <- ESA_Geotiff - GEDI_Geotiff
Error in compareRaster(e1, e2, extent = FALSE, rowcol = FALSE, crs = TRUE,  : 
                         different origin
> ESA_Resample <- resample(ESA_Geotiff, GEDI_Geotiff)
> ICESat2_Resample <- resample(ICEsat2_Geotiff, GEDI_Geotiff)
> Difference_ESA <- ESA_Resample - GEDI_Geotiff
> Difference_ICESat2 <- ICESat2_Resample - GEDI_Geotiff
> writeRaster(ESA_Resample, "ESA_Resampled_GEDI.tif", format = "GTiff")
> writeRaster(ICESat2_Resample, "ICESat2_Resampled_GEDI.tif", format = "GTiff")
> #RMSE function 
> rmse <- function(diff) {sqrt}
> rmse <- function(diff) {
+     sqrt(cellStats(diff^2, stat = 'mean'))
+     }
> #Bias function
> Bias <- function(diff) {
+     cellStats(diff, stat = 'mean')
+ }
> #R-sqaured function 
> r_squared <- function(model, reference) {
+     ssr <- cellStats((model - reference)^2, stat = 'sum')
+     tss <- cellStats((reference - mean(reference))^2, stat =  'sum')
+     r2 <- 1 - (ssr / tss)
+     return(r2)
+     }
> #Calculate RMSE 
> rmse_ESA <- rmse(Difference_ESA)
> rmse_ICESat2 <- rmse(Difference_ICESat2)
> #Calculate Bias
> Bias_ESA <- bias(Difference_ESA)
Error in bias(Difference_ESA) : could not find function "bias"
> Bias_ESA <- Bias(Difference_ESA)
> Bias_ICESat2 <- Bias(Difference_ICESat2)
> #Calculate R-squared 
> r2_ESA <- r_squared(ESA_Geotiff, GEDI_Geotiff)
Error in h(simpleError(msg, call)) : 
 error in evaluating the argument 'x' in selecting a method for function 'cellStats': different origin 
> r2_ESA <- r_squared(ESA_Resample, GEDI_Geotiff)
> r2_ICESat2 <- r_squared(ICESat2_Resample, GEDI_Geotiff)
> results <- data.frame(
+     Dataset = c("ESA", "ICESat2"),
+     RMSE = c(rmse_ESA. rmse_ICESat2),
Error: unexpected symbol in:
"    Dataset = c("ESA", "ICESat2"),
      RMSE = c(rmse_ESA. rmse_ICESat2"
> results <- data.frame(
+     Dataset = c("ESA", "ICESat2"),
+     RMSE = c(rmse_ESA, rmse_ICESat2),
+     Bias = c(Bias_ESA, Bias_ICESat2)
+     r_squared = c(r2_ESA, r2_ICESat2)
+ )
> print(results)
  Dataset     RMSE       Bias r_squared
1     ESA 25.79153 -16.488541      -Inf
2 ICESat2 21.46633  -7.638694      -Inf
                           > 