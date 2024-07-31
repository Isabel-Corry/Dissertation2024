setwd('R:/s2587604/Biomass_Data/Original_Files')
library(raster)
library(ggplot2)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Extract_Merged.tif"
ICESat2_File <- "ICESat2_Cornwall_1B.tif"
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
ggplot(df, aes(x = value, fill = source, color = source)) +
  geom_histogram(binwidth = 10, position = "identity", alpha = 0.5, color = "black") +
  theme_minimal() +
  labs(title = "Histogram of Biomass Values", 
       x = "Pixel Values",
       y = "Frequency") + 
  xlim(0, 150) + 
  scale_y_continuous(labels = scales::percent_format(scale =1)) + 
  scale_fill_manual(values = c("GEDI" = "light blue", "ESA CCI" = "orange", "ICESat2" = "dark blue")) +
  scale_color_manual(values = c("GEDI" = "light blue", "ESA CCI" = "orange", "ICESat2" = "dark blue"))  
compute_cdf <- function(data) { 
  ecdf(data)
}
cdfGEDI <- compute_cdf(GEDI)
cdfESA <- compute_cdf(ESA)
cdfICESat2 <- compute_cdf(ICESat2)
cdf_df <- data.frame(
  value = c(GEDI, ESA, ICESat2),
  cdf_value = c(cdfGEDI(GEDI), cdfESA(ESA), cdfICESat2(ICESat2)), 
  source = factor(rep(c("GEDI", "ESA CCI", "ICESat2"), times = c(length(GEDI), length(ESA), length(ICESat2))))
)
ggplot(cdf_df, aes(x = value, y = cdf_value, color = source)) + 
  stat_ecdf(geom = "step") +
  theme_minimal() + 
  labs(title = "Cumulative Distribution Functions of Biomass", x = "Pixel Values", y = "Cumulative Probability") + 
  scale_color_manual(values = c("GEDI" = "light blue", "ESA CCI" = "orange", "ICESat2" = "dark blue")) + 
  xlim(c(0, 200))

