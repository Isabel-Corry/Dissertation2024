setwd('R:/s2587604/Biomass_Data/Resample')
library(raster)
library(ggplot2)
Lidar_Biomass_File <- "Section_Lidar_Resampled.tif"
Lidar_Biomass <- raster(Lidar_Biomass_File)
Lidar <- values(Lidar_Biomass)
Lidar <- Lidar[!is.na(Lidar)]
dfLidar <- data.frame(value = Lidar, source = "Lidar")
ggplot(dfLidar, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     theme_minimal() +
  +     labs(title = "Histogram of Lidar Biomass Values", x = "Pixel Values", y = "Frequency")
