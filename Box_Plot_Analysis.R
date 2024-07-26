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
all_data$Raster <- gsub("\\.tif$", "", all_data$Raster)
all_data$Raster <- as.factor(all_data$Raster)
ggplot(all_data, aes(x = Raster, y = Value, fill = Raster)) +
  geom_boxplot() +
  scale_fill_manual(values = c("skyblue", "steelblue", "lightblue", "darkblue", "lightcoral", "coral", "red", "orange", "darkorange")) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  labs(title = "Box Plot of Raster Values for Differences between Datasets", x = 'Raster File', y = 'Value')
