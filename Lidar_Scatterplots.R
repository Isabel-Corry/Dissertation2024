setwd('R:/s2587604/Biomass_Data/Resample')
library(raster)
library(ggplot2)
GEDI_Raster <- raster("GEDI_Cornwall.tif")
ESA_Raster <- raster("ESA_Resample_Mean.tif")
ICESat2_Raster <- raster("ICESat2_Resample_Mean.tif")
Lidar_Biomass_RAster <- raster("Section_Lidar_Resampled.tif")
GEDI_Vector <- na.omit(values(GEDI_Raster))
ESA_Vector <- na.omit(values(ESA_Raster))
ICESat2_Vector <- na.omit(values(ICESat2_Raster))
Lidar_Vector <- na.omit(values(Lidar_Biomass_RAster))
min_length <- min(length(GEDI_Vector), length(ESA_Vector), length(ICESat2_Vector), length(Lidar_Vector))
GEDI_Vector <- GEDI_Vector[1:min_length]
ESA_Vector <- ESA_Vector[1:min_length]
ICESat2_Vector <- ICESat2_Vector[1:min_length]
Lidar_Vector <- Lidar_Vector[1:min_length]
par(mfrow = c(1,3))
plot(GEDI_Vector, Lidar_Vector, main = "GEDI vs Lidar", xlab = "GEDI", xlim = c(0, 150), ylab = "Lidar", pch=19, col=rgb(0, 0, 1, 0.5))
plot(ESA_Vector, Lidar_Vector, main = "ESA vs Lidar", xlab = "ESA", xlim = c(0, 150), ylab = "Lidar", pch=19, col=rgb(0, 1, 0, 0.5))
plot(ICESat2_Vector, Lidar_Vector, main = "ICESat2 vs Lidar", xlab = "ICESat2", xlim =c(0, 150), ylab = "Lidar", pch=19, col=rgb(1, 0, 0, 0.5))