setwd('R:/s2587604/Biomass_Data/Resample') 

> library(raster) 

Loading required package: sp 

Warning messages: 
  
  1: package ‘raster’ was built under R version 4.2.3  

2: package ‘sp’ was built under R version 4.2.3  

> library(ggplot2) 

Warning message: 
  
  package ‘ggplot2’ was built under R version 4.2.3  

> GEDI_Geotiff <- raster("GEDI_Cornwall_BNG.tif") 

> ESA_Geotiff <- raster("ESA_Resample_Mean.tif") 

> ICESat2_Geotiff <- raster("ICESat2_Resample_Mean.tif") 

> GEDI_Vector <- na.omit(values(GEDI_Geotiff)) 

> ESA_Vector <- na.omit(values(ESA_Geotiff)) 

> ICESat2_Vector <- na.omit(values(ICESat2_Geotiff)) 

> min_length <- min(length(GEDI_Vector), length(ESA_Vector), length(ICESat2_Vector)) 

> GEDI_Vector <- GEDI_Vector[1:min_length] 

> ESA_Vector <- ESA_Vector[1:min_length] 

> ICESat2_Vector <- ICESat2_Vector[1:min_length] 

> par(mfrow=c(1,3)) 

> plot(GEDI_Vector, ESA_Vector, main = "GEDI vs ESA", xlab = "GEDI", ylab = "ESA", pch=19, col=rgb(0, 0, 1, 0.5)) 

> plot(GEDI_Vector, ICESat2_Vector, main = "GEDI vs ICESat2", xlab = "GEDI", ylab = "ICESat2", pch=19, col=rgb(0, 1, 0, 0.5)) 

> plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlab = "ESA", ylab = "ICESat2", pch=19, col=rgb(1, 0, 0, 0.5)) 

> plot(GEDI_Vector, ESA_Vector, main = "GEDI vs ESA", xlim = c(0, 200), xlab = "GEDI", ylim = c(0, 200), ylab = "ESA", pch=19, col=rgb(0, 0, 1, 0.5)) 

> plot(GEDI_Vector, ICESat2_Vector, main = "GEDI vs ICESat2", xlim = c(0, 200), xlab = "GEDI", ylim = c(0, 200), ylab = "ICESat2", pch=19, col=rgb(0, 1, 0, 0.5)) 

> plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlim = c(0, 200), xlab = "ESA", ylim = c(0, 200), ylab = "ICESat2", pch=19, col=rgb(1, 0, 0, 0.5)) 