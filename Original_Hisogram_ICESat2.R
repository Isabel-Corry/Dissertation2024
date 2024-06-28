> setwd('R:/s2587604/Biomass_Data/Original_Files')
> library(raster)
Loading required package: sp
Warning messages:
  1: package ‘raster’ was built under R version 4.2.3 
2: package ‘sp’ was built under R version 4.2.3 
> library(ggplot2)
Warning message:
  package ‘ggplot2’ was built under R version 4.2.3 
> ICESat2_File <- "ICESat2_Cornwall_1B.tif"
> read_and_clean_raster <- function(file) {
  +     raster_data <- raster(file)
  +     data <- values(raster_data)
  +     data <- data[!is.na(data)]
  +     return(data)
  + }
> GEDI <- read_and_clean_raster(ICESat2_File)
> ICESat2 <- read_and_clean_raster(ICESat2_File)
> dfICESat2 <- data.frame((value = ICESat2, source = "ICESat2"))
Error: unexpected ',' in "dfICESat2 <- data.frame((value = ICESat2,"
> dfICESat2 <- data.frame(value = ICESat2, source = "ICESat2")
> plot_histogram <- function(data, title) {
  +     dev.new()
  +     ggplot(data, aes(x = value)) + 
    +         geom_histogram(binwidth = 10, fill = "light green", colr = "black", alpha = 0.7) + 
    +         theme_minimal() +
    +         labs(title = title, 
                   +              x = "Pixel Values", 
                   +              y = "Frequency")
  + }
> plot_histogram(dfICESat2, "Histogram of ICESat2")
Warning message:
  In geom_histogram(binwidth = 10, fill = "light green", colr = "black",  :
  Ignoring unknown parameters: `colr`
> plot_histogram <- function(data, title) {
  +     dev.new()
  +     ggplot(data, aes(x = value)) + 
  +         geom_histogram(binwidth = 10, fill = "light green", colr = "black", alpha = 0.7) + 
  +         theme_minimal() +
  +         labs(title = title, 
  +              x = "Pixel Values", 
  +              y = "Frequency") + 
  +         xlim(0, 200)
  + }
> plot_histogram(dfICESat2, "Histogram of ICESat2")
  Warning messages:
  1: In geom_histogram(binwidth = 10, fill = "light green", colr = "black",  :
    Ignoring unknown parameters: `colr`
  2: Removed 3703 rows containing non-finite outside the scale range (`stat_bin()`). 
  3: Removed 2 rows containing missing values or values outside the scale range (`geom_bar()`). 
> plot_histogram <- function(data, title) {
+     ggplot(data, aes(x = value)) + 
+         geom_histogram(binwidth = 10, fill = "light green", colr = "black", alpha = 0.7) + 
+         theme_minimal() +
+         labs(title = title, 
+              x = "Pixel Values", 
+              y = "Frequency") + 
+         xlim(0, 200)
+ }
> plot_histogram(dfICESat2, "Histogram of ICESat2")
  Warning messages:
  1: In geom_histogram(binwidth = 10, fill = "light green", colr = "black",  :
   Ignoring unknown parameters: `colr`
  2: Removed 3703 rows containing non-finite outside the scale range (`stat_bin()`). 
  3: Removed 2 rows containing missing values or values outside the scale range (`geom_bar()`). 
> plot_histogram <- function(data, title) {
+     ggplot(data, aes(x = value)) +
+         geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) + 
+         theme_minimal() +
+         labs(title = title, 
+              x = "Pixel Values", 
+              y = "Frequency") + 
+         xlim(0, 200)
+ }
> plot_histogram(dfICESat2, "Histogram of ICESat2")