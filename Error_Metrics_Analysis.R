setwd('R:/s2587604/Biomass_Data/Resample')
install.packages("Metrics")
library(raster)
library(terra)
library(dplyr)
library(Metrics)
GEDI_Biomass <- raster("GEDI_Cornwall.tif")
ESA_Biomass <- raster("ESA_Resample_Mean.tif")
ICESat2_Biomass <- raster("ICESat2_Resample_Mean.tif")
ESA_Resampled <- resample(ESA_Biomass, GEDI_Biomass)
ICESat2_Resampled <- resample(ICESat2_Biomass, GEDI_Biomass)
GEDI_Values <- getValues(GEDI_Biomass)
ESA_Values <- getValues(ESA_Resampled)
ICESat2_Values <- getValues(ICESat2_Resampled)
Valid_Mask <- !is.na(GEDI_Values) & !is.na(ESA_Values) & !is.na(ICESat2_Values)
GEDI_Valid <- GEDI_Values[Valid_Mask]
ESA_Valid <- ESA_Values[Valid_Mask]
ICESat2_Valid <- ICESat2_Values[Valid_Mask]
RMSE_ESA <- rmse(GEDI_Valid, ESA_Valid)
MAR_ESA <- mae(GEDI_Valid, ESA_Valid)
Bias_ESA <- mean(ESA_Valid - GEDI_Valid)
RMSE_ICESat2 <- rmse(GEDI_Valid, ICESat2_Valid)
MAR_ICESat2 <- mae(GEDI_Valid, ICESat2_Valid)
Bias_ICESat2 <- mean(ICESat2_Valid - GEDI_Valid)
print(paste("ESA - RMSE:", RMSE_ESA, "MAR:", MAR_ESA, "Bias:", Bias_ESA))
[1] "ESA - RMSE: 26.4481082163603 MAR: 19.8755541489644 Bias: -17.0297001380037"
print(paste("ICESat2 - RMSE:", RMSE_ICESat2, "MAR:", MAR_ICESat2, "Bias:", Bias_ICESat2))
[1] "ICESat2 - RMSE: 21.6903311780713 MAR: 14.6325875189745 Bias: -8.4599941300351"
