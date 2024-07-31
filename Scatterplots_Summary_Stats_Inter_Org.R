setwd('R:/s2587604/Biomass_Data/Original_Files')
library(raster)
library(ggplot2)
library(gridExtra)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Extract_Merged.tif"
ICESat2_File <- "ICESat2_Cornwall_1B.tif"
GEDI_Raster <- raster(GEDI_File)
ESA_Raster <- raster(ESA_File)
ICESat2_Raster <- raster(ICESat2_File)
GEDI_Vector <- na.omit(values(GEDI_Raster))
ESA_Vector <- na.omit(values(ESA_Raster))
ICESat2_Vector <- na.omit(values(ICESat2_Raster))
min_length <- min(length(GEDI_Vector), length(ESA_Vector), length(ICESat2_Vector))
GEDI_Vector <- GEDI_Vector[1:min_length]
ESA_Vector <- ESA_Vector[1:min_length]
ICESat2_Vector <- ICESat2_Vector[1:min_length]
par(mfrow=c(1, 3), pty="s")
plot(GEDI_Vector, ESA_Vector, main = "GEDI vs ESA", xlab = "GEDI Biomass", ylab = "ESA Biomass", pch=19, col=rgb(173/255, 216/255, 230/255))
plot(GEDI_Vector, ICESat2_Vector, main = "GEDI vs ICESat2", xlab = "GEDI Biomass", ylab = "ICESat2 Biomass", pch=19, col=rgb(255/255, 165/255, 0/255))
plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlab = "ESA Biomass", ylab = "ICESat2 Biomass", pch=19, col=rgb(0/255, 0/255, 139/255))
add_summary_stats <- function(x, y, color, main_title, x_label, y_label) {
  model <- lm(y ~ x)
  plot(x, y, pch = 19, col = color, main = main_title, xlab = x_label, ylab = y_label, xlim = c(0, 200), ylim = c(0, 200))
  abline(model, col = "red")
  mean_x <- mean(x)
  mean_y <- mean(y)
  abline(h = mean_y, col = "yellow", lty = 2)
  abline(v = mean_x, col = "green", lty = 2)
  text(mean_x, 200, labels = paste("Slope:", round(coef(model)[2], 2)), pos = 4, col = "grey")
  text(mean_x, 185, labels = paste("Intercept:", round(coef(model)[1], 2)), pos = 4, col = "grey")
}
add_summary_stats(GEDI_Vector, ESA_Vector, rgb(173/255, 216/255, 230/255), "GEDI vs ESA", "GEDI Biomass", "ESA Biomass")
add_summary_stats(GEDI_Vector, ICESat2_Vector, rgb(255/255, 165/255, 0/255), "GEDI vs ICESat2", "GEDI Biomass", "ICEsat2 Biomass")
add_summary_stats(ESA_Vector, ICESat2_Vector, rgb(0/255, 0/255, 139/255), "ESA vs ICESat2", "ESA Biomass", "ICESat2 Biomass")

