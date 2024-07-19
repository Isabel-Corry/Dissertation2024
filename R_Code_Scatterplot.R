setwd('R:/s2587604/Biomass_Data/Resample')
library(raster) 

# Load rasters 

GEDI_Raster <- raster("GEDI_Cornwall.tif") 

ESA_Raster <- raster("ESA_Resample_Mean.tif") 

ICESat2_Raster <- raster("ICESat2_Resample_Mean.tif") 

# Extract non-NA values 

GEDI_Vector <- na.omit(values(GEDI_Raster)) 

ESA_Vector <- na.omit(values(ESA_Raster)) 

ICESat2_Vector <- na.omit(values(ICESat2_Raster)) 

# Ensure all vectors have the same length 

min_length <- min(length(GEDI_Vector), length(ESA_Vector), length(ICESat2_Vector)) 

GEDI_Vector <- GEDI_Vector[1:min_length] 

ESA_Vector <- ESA_Vector[1:min_length] 

ICESat2_Vector <- ICESat2_Vector[1:min_length] 

# Define function to calculate R squared 

calculate_r_squared <- function(x, y) { 
  
  model <- lm(y ~ x) 
  
  summary(model)$r.squared 
  
} 

# Calculate R squared for each pair 

r_squared_gedi_esa <- calculate_r_squared(GEDI_Vector, ESA_Vector) 

r_squared_gedi_icesat2 <- calculate_r_squared(GEDI_Vector, ICESat2_Vector) 

r_squared_esa_icesat2 <- calculate_r_squared(ESA_Vector, ICESat2_Vector) 

# Print R squared values 

print(paste("R squared for GEDI vs ESA:", r_squared_gedi_esa)) 

print(paste("R squared for GEDI vs ICESat2:", r_squared_gedi_icesat2)) 

print(paste("R squared for ESA vs ICESat2:", r_squared_esa_icesat2)) 

# Plotting 

par(mfrow = c(1, 3)) 

plot(GEDI_Vector, ESA_Vector, main = "GEDI vs ESA", xlab = "GEDI", ylab = "ESA", pch = 19, col = rgb(0, 0, 1, 0.5)) 

mtext(paste("R^2:", round(r_squared_gedi_esa, 2)), side = 3) 

plot(GEDI_Vector, ICESat2_Vector, main = "GEDI vs ICESat2", xlab = "GEDI", ylab = "ICESat2", pch = 19, col = rgb(0, 1, 0, 0.5)) 

mtext(paste("R^2:", round(r_squared_gedi_icesat2, 2)), side = 3) 

plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlab = "ESA", ylab = "ICESat2", pch = 19, col = rgb(1, 0, 0, 0.5)) 

mtext(paste("R^2:", round(r_squared_esa_icesat2, 2)), side = 3) 

par(mfrow = c(1, 3)) 

plot(GEDI_Vector, ESA_Vector, main = "GEDI vs ESA", xlim = c(0, 150), xlab = "GEDI", ylim = c(0, 150), ylab = "ESA", pch = 19, col = rgb(0, 0, 1, 0.5)) 

mtext(paste("R^2:", round(r_squared_gedi_esa, 2)), side = 3) 

plot(GEDI_Vector, ICESat2_Vector, main = "GEDI vs ICESat2", xlim = c(0, 150), xlab = "GEDI", ylim = c(0, 150), ylab = "ICESat2", pch = 19, col = rgb(0, 1, 0, 0.5)) 

mtext(paste("R^2:", round(r_squared_gedi_icesat2, 2)), side = 3) 

plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlim = c(0, 150), xlab = "ESA", ylim = c(0, 150), ylab = "ICESat2", pch = 19, col = rgb(1, 0, 0, 0.5)) 

mtext(paste("R^2:", round(r_squared_esa_icesat2, 2)), side = 3) 

