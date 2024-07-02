setwd('R:/s2587604/Biomass_Data/Resample')
library(raster)
library(sf)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Resample_Mean.tif"
ICESat2_File <- "ICESat2_Resample_Mean.tif"
GEDI_Data <- raster(GEDI_File)
ESA_Data <- raster(ESA_File)
ICESat2_Data <- raster(ICESat2_File)
par(mfrow = c(1,3))
plot(GEDI_Data, main = "GEDI Biomass")
plot(ESA_Data, main = "ESA Biomass")
plot(ICESat2_Data, main = "ICESat2 Biomass")

ESA_Data_Reproject <- projectRaster(ESA_Data, GEDI_Data, method = "bilinear")
ICESat2_Data_Reproject <- projectRaster(ICESat2_Data, GEDI_Data, method = "bilinear")
par(mfrow =(1, 2))
plot(ESA_Data_Reproject, main = "Reproject ESA Biomass")
plot(ICESat2_Data_Reproject, main = "Reprojected ICESat2 Biomass")
Saturation_Threshold <- GEDI_Data >= Saturation_Threshold
Saturation_Threshold <- 100
GEDI_Saturated <- GEDI_Data >= Saturation_Threshold
ESA_Saturated <- ESA_Data_Reproject >= Saturation_Threshold
ICESat_Saturated <- ICESat2_Data_Reproject >= Saturation_Threshold
par(mfrow = c(1,3))
plot(GEDI_Saturated, main = "GEDI Saturated Areas")
plot(ESA_Saturated, main = "ESA Saturated Areas")
plot(ICESat_Saturated, main = "ICESat2 Saturated Areas")
par(mfrow = c(1, 1))
plot(GEDI_Saturated, main = "GEDI Saturated Areas")
plot(ESA_Saturated, main = "ESA Saturated Areas")
plot(ICESat_Saturated, main = "ICESat2 Saturated Areas")
Combined_Saturation <- GEDI_Saturated | ESA_Saturated | ICESat_Saturated
plot(Combined_Saturation, main = "Combined Saturation Areas")