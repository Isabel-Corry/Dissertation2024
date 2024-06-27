ESA_raster <- "ESA_Resample_Mean.tif"
> ICESat2_raster <- "ICESat2_Resample_Mean.tif)"
> GEDI_Biomass <- raster(GEDI_raster)
> ESA_Biomass <- raster(ESA_raster)
> ICESat2_Biomass <- raster(ICESat2_raster)
Error in .rasterObjectFromFile(x, band = band, objecttype = "RasterLayer",  : 
                                 Cannot create a RasterLayer object from this file. (file does not exist)
                               In addition: Warning message:
                                 R:/s2587604/Biomass_Data/Resample/ICESat2_Resample_Mean.tif): No such file or directory (GDAL error 4) 
> ICESat2_raster <- "ICESat2_Resample_Mean.tif"
> ICESat2_Biomass <- raster(ICESat2_raster)
> GEDI <- values(GEDI_Biomass)
> ESA <- values(ESA_Biomass)
> ICESat2 <- values(ICESat2_Biomass)
> GEDI <- GEDI[!is.na(GEDI)]
> ESA <- ESA[!is.na(ESA)]
> ICESat2 <- ICESat2[!is.na(ICESat2)]
> dfGEDI <- data.frame(value = GEDI, source = "GEDI")
> dfESA <- data.frame(value =ESA, source = "ESA")
> dfICESat2 <- data.frame(value = ICESat2, source = "ICESat2")
> df <- rbind(dfGEDI, dfESA, dfICESat2)
> ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Biomass"
             +          y = "Frequency")
Error: unexpected symbol in:
  "         x = "Biomass"
         y"
> ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Biomass",
             +          y = "Frequency")
> ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Biomass",
             +          y = "Frequency")
> ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Biomass",
             +          y = "Frequency")
> ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Biomass",
             +          y = "Frequency") + 
  +     ylim(0, 150)
Warning message:
  Removed 14 rows containing missing values or values outside the scale range (`geom_bar()`). 
> ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Biomass",
             +          y = "Frequency") + 
  +     xlim(0, 150)
Warning messages:
  1: Removed 8 rows containing non-finite outside the scale range (`stat_bin()`). 
2: Removed 6 rows containing missing values or values outside the scale range (`geom_bar()`). 
> ggplot(df, aes(x = value)) +
  +     geom_histogram(binwidth = 10, fill = "light green", color = "black", alpha = 0.7) +
  +     facet_wrap(~source, scales = "free_x", ncol = 1) + 
  +     theme_minimal() +
  +     labs(title = "Histogram of Biomass Values", 
             +          x = "Pixel Values",
             +          y = "Frequency") + 
  +     xlim(0, 150)