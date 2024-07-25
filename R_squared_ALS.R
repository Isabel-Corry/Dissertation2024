setwd('R:/s2587604/Biomass_Data/Resample')
library(raster)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Resample_Mean.tif"
ICESat2_File <- "ICESat2_Resample_Mean.tif"
ALS_File <- "ALS_Biomass_Extract_Resampled.tif"
GEDI_Raster <- raster(GEDI_File)
ESA_Raster <- raster(ESA_File)
ICESat2_Raster <- raster(ICESat2_File)
ALS_Raster <- raster(ALS_File)
GEDI_Vector <- na.omit(values(GEDI_Raster))
ESA_Vector <- na.omit(values(ESA_Raster))
ICESat2_Vector <- na.omit(values(ICESat2_Raster))
ALS_Vector <- na.omit(values(ALS_Raster))
min_length <- min(length(GEDI_Vector), length(ESA_Vector), length(ICESat2_Vector), length(ALS_Vector))
GEDI_Vector <- GEDI_Vector[1:min_length]
ESA_Vector <- ESA_Vector[1:min_length]
ICESat2_Vector <- ICESat2_Vector[1:min_length]
ALS_Vector <- ALS_Vector[1:min_length]
calculate_r_squared <- function(x, y) {
  +     model <- lm(y ~ x)
  +     summary(model)$r.squared
  + }
r_squared_ALS_GEDI <- calculate_r_squared(ALS_Vector, GEDI_Vector)
r_squared_ALS_ESA <- calculate_r_squared(ALS_Vector, ESA_Vector)
r_squared_ALS_ICESat2 <- calculate_r_squared(ALS_Vector, ICESat2_Vector)
print(paste("R sqaured for ALS vs GEDI:", r_squared_ALS_GEDI))
print(paste("R squared for ALS vs ESA:", r_squared_ALS_ESA))
print(paste("R squared for ALS vs ICESat2:", r_squared_ALS_ICESat2))
