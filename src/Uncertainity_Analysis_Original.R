setwd('R:/s2587604/Biomass_Data/Original_Files')
library(terra)
library(dplyr)
library(ggplot2)
calculate_90_ci <- function(raster_data) {
  values <- values(raster_data, na.rm = TRUE)
  lower_bound <- quantile(values, probs = 0.05, na.rm = TRUE)
  upper_bound <- quantile(values, probs = 0.95, na.rm = TRUE)
  return(c(lower_bound, upper_bound))
}
GEDI <- rast("GEDI_Cornwall.tif")
ESA <- rast("ESA_Extract_Merged.tif")
ICESat2 <- rast("ICESat2_Cornwall_1B.tif")
GEDI_ci <- calculate_90_ci(GEDI)
ESA_ci <- calculate_90_ci(ESA)
ICESat2_ci <- calculate_90_ci(ICESat2)
print(paste("GEDI 90% CI", GEDI_ci[1], "-", GEDI_ci[2]))
print(paste("ESA 90% CI:", ESA_ci[1], "-", ESA_ci[2]))
print(paste("ICESat2 90% CI:", ICESat2_ci[1], "-", ICESat2_ci[2]))
ci_df <- data.frame(
  Dataset = c("GEDI", "ESA", "ICESat2"),
  Lower_Bound = c(GEDI_ci[1], ESA_ci[1], ICESat2_ci[1]),
  upper_Bound = c(GEDI_ci[2], ESA_ci[2], ICESat2_ci[2])
)
print(ci_df)
ci_df$Midpoint <- (ci_df$Lower_Bound + ci_df$upper_Bound) / 2
ggplot(ci_df, aes(x = Dataset, y = Midpoint)) +
  geom_bar(stat = 'identity', fill = 'skyblue') + 
  geom_errorbar(aes(ymin = Lower_Bound, ymax = upper_Bound), width = 0.2) + 
  labs(title = "90th Percentile Confidence Intervals of AGBD", x = "Dataset", y = "Biomass Density") +
  theme_minimal()
