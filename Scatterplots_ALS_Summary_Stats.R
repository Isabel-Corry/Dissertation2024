setwd('P:/Geotiff')
library(raster)
library(ggplot2)
library(gridExtra)
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
par(mfrow =c(1,3))
plot(GEDI_Vector, ALS_Vector, main = "GEDI vs ASL", xlab = "GEDI Biomass", ylab = "ALS Biomass", pch=19, col=rgb(173/255, 216/255, 230/255))
plot(ESA_Vector, ALS_Vector, main = "ESA vs ALS", xlab = "ESA Biomass", ylab = "ALS Biomass", pch=19, col=rgb(255/255, 165/255, 0/255))
plot(ICESat2_Vector, ALS_Vector, main = "ICESat2 vs ALS", xlab = "ICESat2 Biomass", ylab = "ALS Biomass", pch=19, col=rgb(0/255, 0/255, 139/255))
add_summary_stats <- function(x, y, color, main_title, x_label, y_label) {
  model <- lm(y ~ x)
  plot(x, y, pch = 19, col = color, main = main_title, xlab = x_label, ylab = y_label, xlim = c(0, 400))
  abline(model, col = "red")
  mean_x <- mean(x)
  mean_y <- mean(y)
  abline(h = mean_y, col = "grey", lty = 2)
  abline(v = mean_x, col = "green", lty = 2)
  text(mean_x, max(y), labels = paste("Slope:", round(coef(model)[2], 2)), pos = 4, col = "pink")
  text(mean_x, max(y) * 0.95, labels = paste("Intercept:", round(coef(model)[1], 2)), pos = 4, col = "pink")
}
add_summary_stats(GEDI_Vector, ALS_Vector, rgb(173/255, 216/255, 230/255), "GEDI vs ALS", "GEDI Biomass", "ALS Biomass")
add_summary_stats(ESA_Vector, ALS_Vector, rgb(255/255, 165/255, 0/255), "ESA vs ALS", "ESA Biomass", "ALS Biomass")
add_summary_stats(ICESat2_Vector, ALS_Vector, rgb(0/255, 0/255, 139/255), "ICESat2 vs ALS", "ICESat2 Biomass", "ALS Biomass")

