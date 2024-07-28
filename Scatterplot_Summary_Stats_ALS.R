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
plot(ALS_Vector, GEDI_Vector, main = "ALS vs GEDI", xlab = "ALS Biomass", ylab = "GEDI Biomass", pch=19, col=rgb(173/255, 216/255, 230/255))
plot(ALS_Vector, ESA_Vector, main = "ALS vs ESA", xlab = "ALS Biomass", ylab = "ESA Biomass", pch=19, col=rgb(255/255, 165/255, 0/255))
plot(ALS_Vector, ICESat2_Vector, main = "ALS vs ESA", xlab = "ALS Biomass", ylab = "ICESat2 Biomass", pch=19, col=rgb(0/255, 0/255, 139/255))
add_summary_stats <- function(x, y, color, main_title, x_label, y_label) {
  +     model <- lm(y ~ x)
  +     plot(x, y, pch = 19, col = color, main = main_title, xlab = x_label, ylab = y_label, ylim = c(0, 150))
  +     abline(model, col = "red")
  +     mean_x <- mean(x)
  +     mean_y <- mean(y)
  +     abline(h = mean_y, col = "yellow", lty = 2)
  +     abline(v = mean_x, col = "green", lty = 2)
  +     text(mean_x, 150, labels = paste("Slope:", round(coef(model)[2], 2)), pos = 4, col = "dark grey")
  +     text(mean_x, 145, labels = paste("Intercept:", round(coef(model)[1], 2)), pos = 4, col = "dark grey")
  + }
add_summary_stats(ALS_Vector, GEDI_Vector, rgb(173/255, 216/255, 230/255), "ALS vs GEDI", "ALS Biomass", "GEDI Biomass")
add_summary_stats(ALS_Vector, ESA_Vector, rgb(255/255, 165/255, 0/255), "ALS vs ESA", "ALS Biomass", "ESA Biomass")
add_summary_stats(ALS_Vector, ICESat2_Vector, rgb(0/255, 0/255, 139/255), "ALS vs ICESat2", "ALS Biomass", "ICESat2 Biomass")
