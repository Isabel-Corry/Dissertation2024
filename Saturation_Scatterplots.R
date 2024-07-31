setwd('P:/Geotiff')
library(raster)
library(ggplot2)
library(gridExtra)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Resample_Mean.tif"
ICESat2_File <- "ICESat2_Resample_Mean.tif"
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
data <- data.frame(GEDI = GEDI_Vector, ESA = ESA_Vector, ICESat2 = ICESat2_Vector)
p1 <- ggplot(data, aes(x = GEDI, y = ESA)) + 
  geom_hex(bins = 30) + 
  scale_fill_viridis_c() + 
  labs(title = "GEDI vs ESA CCI", x = "GEDI Biomass", y = "ESA CCI Biomass") + 
  theme_minimal()
p2 <- ggplot(data, aes(x = GEDI, y = ICESat2)) + 
  geom_hex(bins = 30) + 
  scale_fill_viridis_c() + 
  labs(title = "GEDI vs ICESat2", x = "GEDI Biomass", y = "ICESat2 Biomass") + 
  theme_minimal()
p3 <- ggplot(data, aes(x = ESA, y = ICESat2)) + 
  geom_hex(bins = 30) + 
  scale_fill_viridis_c() + 
  labs(title = "ESA CCI vs ICESat2", x = "ESA CCI Biomass", y = "ICESat2 Biomass") + 
  theme_minimal()
grid.arrange(p1, p2, p3, ncol = 3)
