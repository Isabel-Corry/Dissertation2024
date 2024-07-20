setwd('R:/s2587604/Biomass_Data/Resample')
library(raster)
calculate_r_squared <- function(x, y) {
  +     model <- lm(y ~ x)
  +     summary(model)$r.squared
  + }
r_squared_gdi_lidar <- calculate_r_squared(GEDI_Vector, Lidar_Vector)
r_squared_esa_lidar <- calculate_r_squared(ESA_Vector, Lidar_Vector)
r_squared_icesat2_lidar <- calculate_r_squared(ICESat2_Vector, Lidar_Vector)
print(paste("R sqaured for GEDI vs Lidar:", r_squared_gdi_lidar))
print(paste("R squared for ESA vs Lidar:", r_squared_esa_lidar))
print(paste("R squared for ICESat2 vs Lidar:", r_squared_icesat2_lidar))