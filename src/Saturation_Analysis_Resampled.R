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
hist_plot <- ggplot(df, aes(x = value, fill = source, color = source)) +
  geom_histogram(binwidth = 10, position = "identity", alpha = 0.5, color = "black") +
  theme_minimal() +
  labs(title = "Histogram of Biomass Values", 
       x = "Pixel Values",
       y = "Frequency") + 
  xlim(0, 150) + 
  scale_y_continuous(labels = scales::percent_format(scale =1)) + 
  scale_fill_manual(values = c("GEDI" = "light blue", "ESA CCI" = "orange", "ICESat2" = "dark blue")) +
  scale_color_manual(values = c("GEDI" = "light blue", "ESA CCI" = "orange", "ICESat2" = "dark blue"))  
print(hist_plot)
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
cdf_plot <- ggplot(cdf_df, aes(x = value, y = cdf_value, color = source)) + 
  stat_ecdf(geom = "step") +
  theme_minimal() + 
  labs(title = "Cumulative Distribution Functions of Biomass", x = "Pixel Values", y = "Cumulative Probability") + 
  scale_color_manual(values = c("GEDI" = "light blue", "ESA CCI" = "orange", "ICESat2" = "dark blue")) + 
  xlim(c(0, 200))
print(cdf_plot)
combined_plot <- grid.arrange(hist_plot, cdf_plot, ncol = 1)
print(combined_plot)
biomass_intervals <- seq(0, 200, by = 10)
calcualte_slope <- function(cdf, intervals) {
  slopes <- numeric(length(intervals) -1)
  for (i in 1:(length(intervals) -1)) {
    x1 <- intervals[i]
    x2 <- intervals[i +1]
    y1 <- cdf(x1) 
    y2 <- cdf(x2)
    slopes[i] <- (y2 - y1) / (x2 - x1)
  }
  return(slopes)
}
slopesGEDI <- calcualte_slope(cdfGEDI, biomass_intervals)
slopesESA <- calcualte_slope(cdfESA, biomass_intervals)
slopesICESat2 <- calcualte_slope(cdfICESat2, biomass_intervals)
slopes_df <- data.frame(
  interval = rep(biomass_intervals[-length(biomass_intervals)], 3), 
  slope = c(slopesGEDI, slopesESA, slopesICESat2), 
  source = rep(c("GEDI", "ESA CCI", "ICESat2"), each = length(slopesGEDI))
)
ggplot(slopes_df, aes(x = interval, y = slope, color = source)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Slope of CDF at Different Biomass Intervals", x = "Biomass Interval", y = "Slope of CDF") + 
  scale_color_manual(values = c("GEDI" = "light blue", "ESA CCI" = "orange", "ICESat2" = "dark blue"))

