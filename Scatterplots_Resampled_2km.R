library(ggplot2)
Warning message:
  package ‘ggplot2’ was built under R version 4.2.3 
> GEDI_Raster <- raster("GEDI_Resampled_2km.tif")
> ESA_Raster <- raster("ESA_Resampled_2km.tif")
> ICESat2_Raster <- raster("ICESat2_Resampled_2km.tif")
> GEDI_Vector <- na.omit(values(GEDI_Raster))
> ESA_Vector <- na.omit(values(ESA_Raster))
> ICESat2_Vector <- na.omit(values(ICESat2_Raster))
> min_length <- min(length(GEDI_Vector), length(ESA_Vector), length(ICESat2_Vector))
> GEDI_Vector <- GEDI_Vector[1:min_length]
> ESA_Vector <- ESA_Vector[1:min_length]
> ICESat2_Vector <- ICESat2_Vector[1:min_length]
> par(mfrow = c(1,3))
> plot(GEDI_Vector, ESA_Vector, main = "GEDI vs ESA", xlab = "GEDI", ylab = "ESA", pch=19, col=rgb(0, 0, 1, 0.5)) 
> plot(GEDI_Vector, ICESat2_Vector, main = "GEDI vs ICESat2", xlab = "GEDI", ylab = "ICESat2", pch=19, col=rgb(0, 1, 0, 0.5))
> 
  > > plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlab = "ESA", ylab = "ICESat2", pch=19, col=rgb(1, 0, 0, 0.5))
Error: unexpected '>' in ">"
> plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlab = "ESA", ylab = "ICESat2", pch=19, col=rgb(1, 0, 0, 0.5))
> par(mfrow = c(1,3))
> plot(GEDI_Vector, ESA_Vector, main = "GEDI vs ESA", xlim = c(0, 150), xlab = "GEDI", ylim = c(0, 150), ylab = "ESA", pch=19, col=rgb(0, 0, 1, 0.5)) 
> 
  > plot(GEDI_Vector, ICESat2_Vector, main = "GEDI vs ICESat2", xlim = c(0, 150), xlab = "GEDI", ylim = c(0, 150), ylab = "ICESat2", pch=19, col=rgb(0, 1, 0, 0.5)) 
> plot(ESA_Vector, ICESat2_Vector, main = "ESA vs ICESat2", xlim = c(0, 150), xlab = "ESA", ylim = c(0, 150), ylab = "ICESat2", pch=19, col=rgb(1, 0, 0, 0.5)) 
> 