setwd('R:/s2587604/Biomass_Data/Resample/Differences')
library(raster)
library(ggplot2)
library(dplyr)
raster_to_dataframe <- function(raster_file) {
  r <- raster(raster_file)
  values <- getValues(r)
  data <- data.frame(Value = values, Raster = basename(raster_file))
  data <- data[!is.na(data$Value),]
  return(data)
}
raster_files <- list.files(pattern = "\\.tif$", full.names = TRUE)
all_data <- do.call(rbind, lapply(raster_files, raster_to_dataframe))
summary_stats <- all_data %>% 
  group_by(Raster) %>%
  summarise(
    Mean = mean(Value, na.rm = TRUE),
    Median = median(Value, na.rm = TRUE), 
    StdDev = sd(Value, na.rm = TRUE), 
    Min = min(Value, na.rm = TRUE), 
    Max = max(Value, na.rm = TRUE), 
    IQR = IQR(Value, na.rm = TRUE)
  )
print(summary_stats)
csv_file <- "Differences_Summary_Stats.csv"
write.csv(summary_stats, file = csv_file, row.names = FALSE)
cat("Differences Summary Stats saved to", csv_file, "\n")
