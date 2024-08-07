setwd('P:/Geotiff')
library(raster)
library(ggplot2)
library(dplyr)
library(cowplot)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Resample_Mean.tif"
ICESat2_File <- "ICESat2_Resample_Mean.tif"
GEDI_Raster <- raster(GEDI_File)
ESA_Raster <- raster(ESA_File)
ICESat2_Raster <- raster(ICESat2_File)
dfGEDI <- as.data.frame(GEDI_Raster, xy = TRUE, na.rm = TRUE)
dfESA <- as.data.frame(ESA_Raster, xy = TRUE, na.rm = TRUE)
dfICESat2 <- as.data.frame(ICESat2_Raster, xy = TRUE, na.rm = TRUE)
names(dfGEDI)[3] <- "GEDI Biomass"
names(dfESA)[3] <- "ESA CCI Biomass"
names(dfICESat2)[3] <- "ICESat2 Biomass"
p1 <- ggplot(dfGEDI, aes(x = x, y = y)) +
  geom_point(alpha = 0.3) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", alpha = 0.3) +
  scale_fill_viridis_c() +
  theme_minimal() +
  ggtitle("GEDI Biomass")
p2 <- ggplot(dfESA, aes(x = x, y = y)) +
  geom_point(alpha = 0.3) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", alpha = 0.3) +
  scale_fill_viridis_c() +
  theme_minimal() +
  ggtitle("ESA CCI Biomass")
p3 <- ggplot(dfICESat2, aes(x = x, y = y)) +
  geom_point(alpha = 0.3) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", alpha = 0.3) +
  scale_fill_viridis_c() +
  theme_minimal() +
  ggtitle("ICESat2 Biomass")
combined_plot <- plot_grid(p1, p2, p3, labels = c("A", "B", "C"), ncol =1)
print(combined_plot)
