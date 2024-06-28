> setwd('R:/s2587604/Biomass_Data/Resample')
> library(raster)
Loading required package: sp
Warning messages:
  1: package ‘raster’ was built under R version 4.2.3 
2: package ‘sp’ was built under R version 4.2.3 
> library(ggplot2)
Warning message:
  package ‘ggplot2’ was built under R version 4.2.3 
> GEDI_File <- "GEDI_Cornwall.tif"
> ESA_File <- "ESA_Extract_Merged.tif"
> ICESat2_File <- "ICESat2_Resample_Mean.tif"
> ESA_File <- "ESA_Resample_Mean.tif"
> read_and_clean_raster <- function(file) {
  +     raster_data <- raster(file)
  +     data <- values(raster_data)
  +     data <- data[!is.na(data)]
  +     return(data)
  + }
> GEDI <- read_and_clean_raster(GEDI_File)
> ESA <- read_and_clean_raster(ESA_File)
> ICESat2 <- read_and_clean_raster(ICESat2_File)
> dfGEDI < data.frame(value = GEDI, source = "GEDI")
Error: object 'dfGEDI' not found
> dfGEDI <_ data.frame(value = GEDI, source = "GEDI")
Error: unexpected symbol in "dfGEDI <_ data.frame"
> dfGEDI <- data.frame(value = GEDI, source = "GEDI")
> dfESA <- data.frame(value = ESA, source = "ESA")
> dfICESat2 <- data.frame(value = ICESat2, source = "ICESat2")
> plot_histogram <- function(data, title) {
  +     ggplot(data, aes(x = value)) + 
    +         geom_histogram(binwidth = 10, fill = "light green", colr = "black", alpha = 0.7) +
    +         theme_minimal() + 
    +         labs(title = title, 
                   +              x = "Pixel Value", 
                   +              y = "Frequency") 
  + }
> plot_histogram(dfGEDI, "Histogram of GEDI")
Warning message:
 In geom_histogram(binwidth = 10, fill = "light green", colr = "black",  :
 Ignoring unknown parameters: `colr`
> plot_histogram <- function(data, title) {
+     ggplot(data, aes(x = value)) + 
+         geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
+         theme_minimal() + 
+         labs(title = title, 
+              x = "Pixel Value", 
+              y = "Frequency") 
+ }
> plot_histogram(dfGEDI, "Histogram of GEDI")
> plot_histogram(dfESA, "Histogram of ESA")
> plot_histogram(dfICESat2, "Histogram of ICESat2"
> plot_histogram <- function(data, title) {
+     ggplot(data, aes(x = value)) + 
+         geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
+         theme_minimal() + 
+         labs(title = title, 
+              x = "Pixel Value", 
+              y = "Frequency") +
+         xlim(0, 100)
+ }
> plot_histogram(dfGEDI, "Histogram of GEDI")
  Warning messages:
  1: Removed 43 rows containing non-finite outside the scale range (`stat_bin()`). 
  2: Removed 2 rows containing missing values or values outside the scale range (`geom_bar()`). 
> plot_histogram(dfESA, "Histogram of ESA")
  Warning messages:
  1: Removed 12 rows containing non-finite outside the scale range (`stat_bin()`). 
  2: Removed 2 rows containing missing values or values outside the scale range (`geom_bar()`). 
> plot_histogram(dfICESat2, "Histogram of ICESat2")
  Warning messages:
  1: Removed 4 rows containing non-finite outside the scale range (`stat_bin()`). 
  2: Removed 2 rows containing missing values or values outside the scale range (`geom_bar()`).