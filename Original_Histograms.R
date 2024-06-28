> setwd('R:/s2587604/Biomass_Data/Original_Files')
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
> ICESat2_File <- "ICESat2_Cornwall_1B.tif"
> GEDI_Biomass <- raster(GEDI_File)
> ESA_Biomass <- raster(ESA_File)
> ICESat2_Biomass <- raster(ICESat2_File)
> GEDI <- values(GEDI_Biomass)
> ESA <- values(ESA_Biomass)
> ICESat2 <- values(ICESat2_Biomass)
> GEDI <- GEDI[!is.an(GEDI)]
Error in is.an(GEDI) : could not find function "is.an"
> GEDI <- GEDI[!is.na(GEDI)]
> ESA <- ESA[!is.na(ESA)]
> ICESat2 <- ICESat2[!is.na(ICESat2)]
> dfGEDI <- data.frame(value = GEDI, source = "GEDI")
> dfESA <- data.frame(value = ESA, source = "ESA")
> dfICESat2 <- data.frame(values = ICESat2, source = "ICESat2")
> df <- rbind(dfGEDI, dfESA, dfICESat2)
Error in match.names(clabs, names(xi)) : 
  names do not match previous names
> df <- rbind(dfGEDI, dfESA, dfICESat2)
Error in match.names(clabs, names(xi)) : 
  names do not match previous names
> str(dfGEDI)
'data.frame':	3187 obs. of  2 variables:
  $ value : num  47.1 66.3 44.4 71.4 41.3 ...
$ source: chr  "GEDI" "GEDI" "GEDI" "GEDI" ...
> str(dfESA)
'data.frame':	532853 obs. of  2 variables:
  $ value : num  0 0 0 0 0 0 0 0 0 0 ...
$ source: chr  "ESA" "ESA" "ESA" "ESA" ...
> str(dfICESat2)
'data.frame':	5123163 obs. of  2 variables:
  $ values: num  5.56 4.31 4.12 3.69 4.67 ...
$ source: chr  "ICESat2" "ICESat2" "ICESat2" "ICESat2" ...
> df <- rbind(dfGEDI, dfESA, dfICESat2)
Error in match.names(clabs, names(xi)) : 
  names do not match previous names
> ggplot(dfGEDI, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  + ggplot(dfGEDI, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of GEDI Values", 
             +          x = "Pixel Values"
             +          y = "Frequency") 
Error: unexpected symbol in:
  "         x = "Pixel Values"
         y"
> ggplot(dfGEDI, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of GEDI Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") 
> ggplot(dfGEDI, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of GEDI Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") 
> ggplot(dfGEDI, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of GEDI Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") + 
  +     ylim(0, 200)
Warning message:
  Removed 5 rows containing missing values or values outside the scale range (`geom_bar()`). 
> ggplot(dfGEDI, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of GEDI Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") + 
  +     ylim(0, 200)
Warning message:
  Removed 5 rows containing missing values or values outside the scale range (`geom_bar()`). 
> ggplot(dfGEDI, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of GEDI Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") + 
  +     xlim(0, 200)
Warning messages:
  1: Removed 4 rows containing non-finite outside the scale range (`stat_bin()`). 
2: Removed 2 rows containing missing values or values outside the scale range (`geom_bar()`). 
> ggplot(dfESA, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of ESA Values", 
             +          x = "Pixel Values",
             +          y = "Frequency")
> ggplot(dfESA, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of ESA Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") + 
  +     xlim(0, 200)
Warning messages:
  1: Removed 43 rows containing non-finite outside the scale range (`stat_bin()`). 
2: Removed 2 rows containing missing values or values outside the scale range (`geom_bar()`). 
> ggplot(dfESA, aes(x = value)) + 
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() + 
  +     labs(title = "Histogram of ESA Values", 
             +          x = "Pixel Values",
             +          y = "Frequency")