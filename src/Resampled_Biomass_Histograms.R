setwd('P:/Geotiff')
library(raster)
library(ggplot2)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Resample_Mean.tif"
ICESat2_File <- "ICESat2_Resample_Mean.tif"
GEDI_Raster <- raster(GEDI_File)
ESA_Raster <- raster(ESA_File)
ICESat2_Raster <- raster(ICESat2_File)
GEDI <- values(GEDI_Raster)
ESA <- values(ESA_Raster)
ICESat2 <- values(ICESat2_Raster)
GEDI <- GEDI[!is.na(GEDI)]
ESA <- ESA[!is.na(ESA)]
ICESat2 <- ICESat2[!is.na(ICESat2)]
dfGEDI <- data.frame(value = GEDI, source = "GEDI")
dfESA <- data.frame(value =ESA, source = "ESA CCI")
dfICESat2 <- data.frame(value = ICESat2, source = "ICESat2")
df <- rbind(dfGEDI, dfESA, dfICESat2)
ggplot(df, aes(x = value, y = ..count../sum(..count..)*100)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  facet_wrap(~source, scales = "free_x", ncol = 1) + 
  theme_minimal() +
  labs(title = "Histogram of Biomass Values", 
        x = "Pixel Values",
        y = "Frequency") + 
  xlim(0, 150) + 
  scale_y_continuous(labels = scales::percent_format(scale =1))
