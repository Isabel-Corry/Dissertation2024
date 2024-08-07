setwd('P:/Geotiff')
library(raster)
library(ggplot2)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Resample_Mean.tif"
ICESat2_File <- "ICESat2_Resample_Mean.tif"
ALS_File <- "ALS_Biomass_Extract_Resampled.tif"
GEDI_Raster <- raster(GEDI_File)
ESA_Raster <- raster(ESA_File)
ICESat2_Raster <- raster(ICESat2_File)
ALS_Raster <- raster(ALS_File)
GEDI <- values(GEDI_Raster)
ESA <- values(ESA_Raster)
ICESat2 <- values(ICESat2_Raster)
ALS<- values(ALS_Raster)
GEDI <- GEDI[!is.na(GEDI)]
ESA <- ESA[!is.na(ESA)]
ICESat2 <- ICESat2[!is.na(ICESat2)]
ALS <- ALS[!is.na(ALS)]
dfGEDI <- data.frame(value = GEDI, source = "GEDI")
dfESA <- data.frame(value =ESA, source = "ESA")
dfICESat2 <- data.frame(value = ICESat2, source = "ICESat2")
dfALS <- data.frame(value = ALS, source = "ALS")
df <- rbind(dfGEDI, dfESA, dfICESat2, dfALS)
ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 2) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") + 
  +     xlim(0, 100) +
        ylim(0, 2000)
