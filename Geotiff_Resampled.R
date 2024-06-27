> setwd('R:/s2587604/Biomass_Data/Resample') 

> install.packages("raster") 

Installing package into ‘M:/R/Win-Library/4.2’ 

(as ‘lib’ is unspecified) 

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.2/raster_3.6-26.zip' 

Content type 'application/zip' length 3598194 bytes (3.4 MB) 

downloaded 3.4 MB 



package ‘raster’ successfully unpacked and MD5 sums checked 



The downloaded binary packages are in 

C:\Users\s2587604\AppData\Local\Temp\Rtmp8007Io\downloaded_packages 

> install.packages("rgdal") 

Installing package into ‘M:/R/Win-Library/4.2’ 

(as ‘lib’ is unspecified) 

Warning in install.packages : 
  
  package ‘rgdal’ is not available for this version of R 



A version of this package for your version of R might be available elsewhere, 

see the ideas at 

https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages 

> library(raster) 

Loading required package: sp 

Warning messages: 
  
  1: package ‘raster’ was built under R version 4.2.3  

2: package ‘sp’ was built under R version 4.2.3  

> library(rgdal) 

Please note that rgdal will be retired during 2023, 

plan transition to sf/stars/terra functions using GDAL and PROJ 

at your earliest convenience. 

See https://r-spatial.org/r/2022/04/12/evolution.html and https://github.com/r-spatial/evolution 

rgdal: version: 1.6-5, (SVN revision 1199) 

Geospatial Data Abstraction Library extensions to R successfully loaded 

Loaded GDAL runtime: GDAL 3.5.2, released 2022/09/02 

Path to GDAL shared files: C:/ProgramData/R422/library/rgdal/gdal 

GDAL binary built with GEOS: TRUE  

Loaded PROJ runtime: Rel. 8.2.1, January 1st, 2022, [PJ_VERSION: 821] 

Path to PROJ shared files: C:/ProgramData/R422/library/rgdal/proj 

PROJ CDN enabled: FALSE 

Linking to sp version:1.6-0 

To mute warnings of possible GDAL/OSR exportToProj4() degradation, 

use options("rgdal_show_exportToProj4_warnings"="none") before loading sp or rgdal. 

> install.packages("gdal") 

Installing package into ‘M:/R/Win-Library/4.2’ 

(as ‘lib’ is unspecified) 

Warning in install.packages : 
  
  package ‘gdal’ is not available for this version of R 



A version of this package for your version of R might be available elsewhere, 

see the ideas at 

https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages 

> resample_geotiff <- function(input_file, output_file, new_width, new_height) {} 

> resample_geotiff <- function(input_file, output_file, new_width, new_height) {} 

> resample_geotiff <- function(input_file, output_file, new_width, new_height) { 
  
  +     raster_data <- raster(input_file)  
  
  +     factor_x <- new_width / res(raster_data)[1]  
  
  +     factor_y <- new_height / res(raster_data)[2]  
  
  +     resampled_raster <- aggregate(raster_data, fct = c(factor_x, factor_y), fun = mean) writeRaster(resampled_raster, output_file, format = "GTiff", overwrite = TRUE) 
  
  Error: unexpected symbol in: 
    
    "    factor_y <- new_height / res(raster_data)[2]  

    resampled_raster <- aggregate(raster_data, fct = c(factor_x, factor_y), fun = mean) writeRaster" 
  
  > resample_geotiff <- function(input_file, output_file, new_width, new_height) { 
    
    +     raster_data <- raster(input_file)  
    
    +     factor_x <- new_width / res(raster_data)[1]  
    
    +     factor_y <- new_height / res(raster_data)[2]  
    
    +     resampled_raster <- aggregate(raster_data, fact = c(factor_x, factor_y), fun = mean) writeRaster(resampled_raster, output_file, format = "GTiff", overwrite = TRUE) 
    
    Error: unexpected symbol in: 
      
      "    factor_y <- new_height / res(raster_data)[2]  

    resampled_raster <- aggregate(raster_data, fact = c(factor_x, factor_y), fun = mean) writeRaster" 
    
    > resample_geotiff <- function(input_file, output_file, new_width, new_height) { 
      
      +     raster_data <- raster(input_file)  
      
      +     factor_x <- new_width / res(raster_data)[1]  
      
      +     factor_y <- new_height / res(raster_data)[2]  
      
      +     resampled_raster <- aggregate(raster_data, fact = c(factor_x, factor_y), fun = mean)  
      
      +     writeRaster(resampled_raster, output_file, format = "GTiff", overwrite = TRUE) 
      
      +     } 
    
    > main <- function() { 
      
      +     input_file_ESA <- "ESA_Extract_Merged.tif" 
      
      +     input_file_ICESat2 <- "ICESat2_Cornwall_1B.tif" 
      
      +     output_file_ESA <- "ESA_Resample_Mean.tif" 
      
      +     output_file_ICESat2 <- "ICESat2_Resample_Mean.tif" 
      
      +     new_width <- 800 
      
      +     new_height <- 1300 
      
      +     resample_geotiff(input_file_ESA, output_file_ESA, new_width, new_height) 
      
      +     resample_geotiff(input_file_ICESat2, output_file_ESA, new_width, new_height) 
      
      +     } 
    
    > main() 
    
    > main <- function() { 
      
      +     input_file_ESA <- "ESA_Extract_Merged.tif" 
      
      +     input_file_ICESat2 <- "ICESat2_Cornwall_1B.tif" 
      
      +     output_file_ESA <- "ESA_Resample_Mean.tif" 
      
      +     output_file_ICESat2 <- "ICESat2_Resample_Mean.tif" 
      
      +     new_width <- 800 
      
      +     new_height <- 1300 
      
      +     resample_geotiff(input_file_ESA, output_file_ESA, new_width, new_height) 
      
      +     resample_geotiff(input_file_ICESat2, output_file_ICESat2, new_width, new_height) 
      
      +     } 
    
    > main() 