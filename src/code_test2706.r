> setwd('R:/s2587604/Biomass_Data/Resample') 

> install.packages("raster") 

Installing package into ???M:/R/Win-Library/4.2??? 

(as ???lib??? is unspecified) 

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.2/raster_3.6-26.zip' 

Content type 'application/zip' length 3598194 bytes (3.4 MB) 

downloaded 3.4 MB 



package ???raster??? successfully unpacked and MD5 sums checked 



The downloaded binary packages are in 

C:\Users\s2587604\AppData\Local\Temp\Rtmp8007Io\downloaded_packages 

> install.packages("rgdal") 

Installing package into ???M:/R/Win-Library/4.2??? 

(as ???lib??? is unspecified) 

Warning in install.packages : 
  
  package ???rgdal??? is not available for this version of R 



A version of this package for your version of R might be available elsewhere, 

see the ideas at 

https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages 

> library(raster) 

Loading required package: sp 

Warning messages: 
  
  1: package ???raster??? was built under R version 4.2.3  

2: package ???sp??? was built under R version 4.2.3  

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

Installing package into ???M:/R/Win-Library/4.2??? 

(as ???lib??? is unspecified) 

Warning in install.packages : 
  
  package ???gdal??? is not available for this version of R 



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
    
    > install.packages("sf") 
    
    Installing package into ???M:/R/Win-Library/4.2??? 
    
    (as ???lib??? is unspecified) 
    
    trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.2/sf_1.0-16.zip' 
    
    Content type 'application/zip' length 28034555 bytes (26.7 MB) 
    
    downloaded 26.7 MB 
    
    
    
    package ???sf??? successfully unpacked and MD5 sums checked 
    
    
    
    The downloaded binary packages are in 
    
    C:\Users\s2587604\AppData\Local\Temp\Rtmp8007Io\downloaded_packages 
    
    > library(sf) 
    
    Linking to GEOS 3.9.3, GDAL 3.5.2, PROJ 8.2.1; sf_use_s2() is TRUE 
    
    Warning message: 
      
      package ???sf??? was built under R version 4.2.3  
    
    > GEDI_Geotiff <- raster("GEDI_Cornwall_Mask.tif") 
    
    > ESA_Geotiff <- raster("ESA_Resample_Mean.tif") 
    
    > ICESat2_Geotiff <- raster("ICESat2_Resample_Mean.tif") 
    
    > crs(GEDI_Geotiff) 
    
    Coordinate Reference System: 
      
      Deprecated Proj.4 representation: 
      
      +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs  
    
    WKT2 2019 representation: 
      
      PROJCRS["unknown", 
              
              BASEGEOGCRS["unknown", 
                          
                          DATUM["Unknown based on Airy 1830 ellipsoid", 
                                
                                ELLIPSOID["Airy 1830",6377563.396,299.3249646, 
                                          
                                          LENGTHUNIT["metre",1, 
                                                     
                                                     ID["EPSG",9001]]]], 
                          
                          PRIMEM["Greenwich",0, 
                                 
                                 ANGLEUNIT["degree",0.0174532925199433], 
                                 
                                 ID["EPSG",8901]]], 
              
              CONVERSION["unknown", 
                         
                         METHOD["Transverse Mercator", 
                                
                                ID["EPSG",9807]], 
                         
                         PARAMETER["Latitude of natural origin",49, 
                                   
                                   ANGLEUNIT["degree",0.0174532925199433], 
                                   
                                   ID["EPSG",8801]], 
                         
                         PARAMETER["Longitude of natural origin",-2, 
                                   
                                   ANGLEUNIT["degree",0.0174532925199433], 
                                   
                                   ID["EPSG",8802]], 
                         
                         PARAMETER["Scale factor at natural origin",0.9996012717, 
                                   
                                   SCALEUNIT["unity",1], 
                                   
                                   ID["EPSG",8805]], 
                         
                         PARAMETER["False easting",400000, 
                                   
                                   LENGTHUNIT["metre",1], 
                                   
                                   ID["EPSG",8806]], 
                         
                         PARAMETER["False northing",-100000, 
                                   
                                   LENGTHUNIT["metre",1], 
                                   
                                   ID["EPSG",8807]]], 
              
              CS[Cartesian,2], 
              
              AXIS["(E)",east, 
                   
                   ORDER[1], 
                   
                   LENGTHUNIT["metre",1, 
                              
                              ID["EPSG",9001]]], 
              
              AXIS["(N)",north, 
                   
                   ORDER[2], 
                   
                   LENGTHUNIT["metre",1, 
                              
                              ID["EPSG",9001]]]]  
    
    > crs(ESA_Geotiff) 
    
    Coordinate Reference System: 
      
      Deprecated Proj.4 representation: 
      
      +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs  
    
    WKT2 2019 representation: 
      
      PROJCRS["unknown", 
              
              BASEGEOGCRS["unknown", 
                          
                          DATUM["Unknown based on Airy 1830 ellipsoid", 
                                
                                ELLIPSOID["Airy 1830",6377563.396,299.3249646, 
                                          
                                          LENGTHUNIT["metre",1, 
                                                     
                                                     ID["EPSG",9001]]]], 
                          
                          PRIMEM["Greenwich",0, 
                                 
                                 ANGLEUNIT["degree",0.0174532925199433], 
                                 
                                 ID["EPSG",8901]]], 
              
              CONVERSION["unknown", 
                         
                         METHOD["Transverse Mercator", 
                                
                                ID["EPSG",9807]], 
                         
                         PARAMETER["Latitude of natural origin",49, 
                                   
                                   ANGLEUNIT["degree",0.0174532925199433], 
                                   
                                   ID["EPSG",8801]], 
                         
                         PARAMETER["Longitude of natural origin",-2, 
                                   
                                   ANGLEUNIT["degree",0.0174532925199433], 
                                   
                                   ID["EPSG",8802]], 
                         
                         PARAMETER["Scale factor at natural origin",0.9996012717, 
                                   
                                   SCALEUNIT["unity",1], 
                                   
                                   ID["EPSG",8805]], 
                         
                         PARAMETER["False easting",400000, 
                                   
                                   LENGTHUNIT["metre",1], 
                                   
                                   ID["EPSG",8806]], 
                         
                         PARAMETER["False northing",-100000, 
                                   
                                   LENGTHUNIT["metre",1], 
                                   
                                   ID["EPSG",8807]]], 
              
              CS[Cartesian,2], 
              
              AXIS["(E)",east, 
                   
                   ORDER[1], 
                   
                   LENGTHUNIT["metre",1, 
                              
                              ID["EPSG",9001]]], 
              
              AXIS["(N)",north, 
                   
                   ORDER[2], 
                   
                   LENGTHUNIT["metre",1, 
                              
                              ID["EPSG",9001]]]]  
    
    > crs(ICESat2_Geotiff) 
    
    Coordinate Reference System: 
      
      Deprecated Proj.4 representation: 
      
      +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs  
    
    WKT2 2019 representation: 
      
      PROJCRS["unknown", 
              
              BASEGEOGCRS["unknown", 
                          
                          DATUM["Unknown based on Airy 1830 ellipsoid", 
                                
                                ELLIPSOID["Airy 1830",6377563.396,299.3249646, 
                                          
                                          LENGTHUNIT["metre",1, 
                                                     
                                                     ID["EPSG",9001]]]], 
                          
                          PRIMEM["Greenwich",0, 
                                 
                                 ANGLEUNIT["degree",0.0174532925199433], 
                                 
                                 ID["EPSG",8901]]], 
              
              CONVERSION["unknown", 
                         
                         METHOD["Transverse Mercator", 
                                
                                ID["EPSG",9807]], 
                         
                         PARAMETER["Latitude of natural origin",49, 
                                   
                                   ANGLEUNIT["degree",0.0174532925199433], 
                                   
                                   ID["EPSG",8801]], 
                         
                         PARAMETER["Longitude of natural origin",-2, 
                                   
                                   ANGLEUNIT["degree",0.0174532925199433], 
                                   
                                   ID["EPSG",8802]], 
                         
                         PARAMETER["Scale factor at natural origin",0.9996012717, 
                                   
                                   SCALEUNIT["unity",1], 
                                   
                                   ID["EPSG",8805]], 
                         
                         PARAMETER["False easting",400000, 
                                   
                                   LENGTHUNIT["metre",1], 
                                   
                                   ID["EPSG",8806]], 
                         
                         PARAMETER["False northing",-100000, 
                                   
                                   LENGTHUNIT["metre",1], 
                                   
                                   ID["EPSG",8807]]], 
              
              CS[Cartesian,2], 
              
              AXIS["(E)",east, 
                   
                   ORDER[1], 
                   
                   LENGTHUNIT["metre",1, 
                              
                              ID["EPSG",9001]]], 
              
              AXIS["(N)",north, 
                   
                   ORDER[2], 
                   
                   LENGTHUNIT["metre",1, 
                              
                              ID["EPSG",9001]]]]  
    
    > Aligned_ESA_Raster <- resample(ESA_Geotiff, GEDI_Geotiff, method = "bilinear") 
    
    > Aligned_ICESat2_Raster <- resample(ICESat2_Geotiff, GEDI_Geotiff, methods = "bilinear") 
    
    > par(mfrow = c(1,3)) 
    
    > plot(GEDI_Geotiff, main="GEDI") 
    
    > plot(Aligned_ESA_Raster, main = "ESA") 
    
    > plot(Aligned_ICESat2_Raster, main = "ICESat2") 
    
    > writeRaster(Aligned_ESA_Raster, "ESA_Resampled_Mean_Aligned_Bi.tif", format = "GTiff") 
    
    > writeRaster(Aligned_ICESat2_Raster, "ICESat2_Resampled_Mean_Aligned_Bi.tif", format = "GTiff") 
    
    > GEDI_Geotiff <- "GEDI_Cornwall_BNG.tif" 
    
    > Aligned_ESA_Raster <- resample(ESA_Geotiff, GEDI_Geotiff, method = "bilinear") 
    
    Error in (function (classes, fdef, mtable)  :  
                
                unable to find an inherited method for function ???resample??? for signature ???"RasterLayer", "character"??? 
              
              > crs(GEDI_Geotiff) 
              
              Error: [rast] empty srs 
              
              In addition: Warning message: 
                
                missing [ (GDAL error 1) 
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          > setwd('R:/s2587604/Biomass_Data/Resample') 
                          
                          > library(raster) 
                          
                          Loading required package: sp 
                          
                          Warning messages: 
                            
                            1: package ???raster??? was built under R version 4.2.3  
                          
                          2: package ???sp??? was built under R version 4.2.3  
                          
                          > library(sf) 
                          
                          Linking to GEOS 3.9.3, GDAL 3.5.2, PROJ 8.2.1; sf_use_s2() is TRUE 
                          
                          Warning message: 
                            
                            package ???sf??? was built under R version 4.2.3  
                          
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
                          
                          > GEDI_Geotiff <- raster("GEDI_Cornwall_BNG.tif") 
                          
                          > ESA_Geotiff <- raster("ESA_Resampled_Mean.tif") 
                          
                          Error in .rasterObjectFromFile(x, band = band, objecttype = "RasterLayer",  :  
                                                           
                                                           Cannot create a RasterLayer object from this file. (file does not exist) 
                                                         
                                                         In addition: Warning message: 
                                                           
                                                           R:/s2587604/Biomass_Data/Resample/ESA_Resampled_Mean.tif: No such file or directory (GDAL error 4)  
                                                         
                                                         > ESA_Geotiff <- raster("ESA_Resample_Mean.tif") 
                                                         
                                                         > ICESat2_Geotiff <- raster("ICESat2_resample_Mean.tif") 
                                                         
                                                         > crs(GEDI_Geotiff) 
                                                         
                                                         Coordinate Reference System: 
                                                           
                                                           Deprecated Proj.4 representation: 
                                                           
                                                           +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs  
                                                         
                                                         WKT2 2019 representation: 
                                                           
                                                           PROJCRS["unknown", 
                                                                   
                                                                   BASEGEOGCRS["unknown", 
                                                                               
                                                                               DATUM["Unknown based on Airy 1830 ellipsoid", 
                                                                                     
                                                                                     ELLIPSOID["Airy 1830",6377563.396,299.3249646, 
                                                                                               
                                                                                               LENGTHUNIT["metre",1, 
                                                                                                          
                                                                                                          ID["EPSG",9001]]]], 
                                                                               
                                                                               PRIMEM["Greenwich",0, 
                                                                                      
                                                                                      ANGLEUNIT["degree",0.0174532925199433], 
                                                                                      
                                                                                      ID["EPSG",8901]]], 
                                                                   
                                                                   CONVERSION["unknown", 
                                                                              
                                                                              METHOD["Transverse Mercator", 
                                                                                     
                                                                                     ID["EPSG",9807]], 
                                                                              
                                                                              PARAMETER["Latitude of natural origin",49, 
                                                                                        
                                                                                        ANGLEUNIT["degree",0.0174532925199433], 
                                                                                        
                                                                                        ID["EPSG",8801]], 
                                                                              
                                                                              PARAMETER["Longitude of natural origin",-2, 
                                                                                        
                                                                                        ANGLEUNIT["degree",0.0174532925199433], 
                                                                                        
                                                                                        ID["EPSG",8802]], 
                                                                              
                                                                              PARAMETER["Scale factor at natural origin",0.9996012717, 
                                                                                        
                                                                                        SCALEUNIT["unity",1], 
                                                                                        
                                                                                        ID["EPSG",8805]], 
                                                                              
                                                                              PARAMETER["False easting",400000, 
                                                                                        
                                                                                        LENGTHUNIT["metre",1], 
                                                                                        
                                                                                        ID["EPSG",8806]], 
                                                                              
                                                                              PARAMETER["False northing",-100000, 
                                                                                        
                                                                                        LENGTHUNIT["metre",1], 
                                                                                        
                                                                                        ID["EPSG",8807]]], 
                                                                   
                                                                   CS[Cartesian,2], 
                                                                   
                                                                   AXIS["(E)",east, 
                                                                        
                                                                        ORDER[1], 
                                                                        
                                                                        LENGTHUNIT["metre",1, 
                                                                                   
                                                                                   ID["EPSG",9001]]], 
                                                                   
                                                                   AXIS["(N)",north, 
                                                                        
                                                                        ORDER[2], 
                                                                        
                                                                        LENGTHUNIT["metre",1, 
                                                                                   
                                                                                   ID["EPSG",9001]]]]  
                                                         
                                                         > crs(ESA_Geotiff) 
                                                         
                                                         Coordinate Reference System: 
                                                           
                                                           Deprecated Proj.4 representation: 
                                                           
                                                           +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs  
                                                         
                                                         WKT2 2019 representation: 
                                                           
                                                           PROJCRS["unknown", 
                                                                   
                                                                   BASEGEOGCRS["unknown", 
                                                                               
                                                                               DATUM["Unknown based on Airy 1830 ellipsoid", 
                                                                                     
                                                                                     ELLIPSOID["Airy 1830",6377563.396,299.3249646, 
                                                                                               
                                                                                               LENGTHUNIT["metre",1, 
                                                                                                          
                                                                                                          ID["EPSG",9001]]]], 
                                                                               
                                                                               PRIMEM["Greenwich",0, 
                                                                                      
                                                                                      ANGLEUNIT["degree",0.0174532925199433], 
                                                                                      
                                                                                      ID["EPSG",8901]]], 
                                                                   
                                                                   CONVERSION["unknown", 
                                                                              
                                                                              METHOD["Transverse Mercator", 
                                                                                     
                                                                                     ID["EPSG",9807]], 
                                                                              
                                                                              PARAMETER["Latitude of natural origin",49, 
                                                                                        
                                                                                        ANGLEUNIT["degree",0.0174532925199433], 
                                                                                        
                                                                                        ID["EPSG",8801]], 
                                                                              
                                                                              PARAMETER["Longitude of natural origin",-2, 
                                                                                        
                                                                                        ANGLEUNIT["degree",0.0174532925199433], 
                                                                                        
                                                                                        ID["EPSG",8802]], 
                                                                              
                                                                              PARAMETER["Scale factor at natural origin",0.9996012717, 
                                                                                        
                                                                                        SCALEUNIT["unity",1], 
                                                                                        
                                                                                        ID["EPSG",8805]], 
                                                                              
                                                                              PARAMETER["False easting",400000, 
                                                                                        
                                                                                        LENGTHUNIT["metre",1], 
                                                                                        
                                                                                        ID["EPSG",8806]], 
                                                                              
                                                                              PARAMETER["False northing",-100000, 
                                                                                        
                                                                                        LENGTHUNIT["metre",1], 
                                                                                        
                                                                                        ID["EPSG",8807]]], 
                                                                   
                                                                   CS[Cartesian,2], 
                                                                   
                                                                   AXIS["(E)",east, 
                                                                        
                                                                        ORDER[1], 
                                                                        
                                                                        LENGTHUNIT["metre",1, 
                                                                                   
                                                                                   ID["EPSG",9001]]], 
                                                                   
                                                                   AXIS["(N)",north, 
                                                                        
                                                                        ORDER[2], 
                                                                        
                                                                        LENGTHUNIT["metre",1, 
                                                                                   
                                                                                   ID["EPSG",9001]]]]  
                                                         
                                                         > crs(ICESat2_Geotiff) 
                                                         
                                                         Coordinate Reference System: 
                                                           
                                                           Deprecated Proj.4 representation: 
                                                           
                                                           +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs  
                                                         
                                                         WKT2 2019 representation: 
                                                           
                                                           PROJCRS["unknown", 
                                                                   
                                                                   BASEGEOGCRS["unknown", 
                                                                               
                                                                               DATUM["Unknown based on Airy 1830 ellipsoid", 
                                                                                     
                                                                                     ELLIPSOID["Airy 1830",6377563.396,299.3249646, 
                                                                                               
                                                                                               LENGTHUNIT["metre",1, 
                                                                                                          
                                                                                                          ID["EPSG",9001]]]], 
                                                                               
                                                                               PRIMEM["Greenwich",0, 
                                                                                      
                                                                                      ANGLEUNIT["degree",0.0174532925199433], 
                                                                                      
                                                                                      ID["EPSG",8901]]], 
                                                                   
                                                                   CONVERSION["unknown", 
                                                                              
                                                                              METHOD["Transverse Mercator", 
                                                                                     
                                                                                     ID["EPSG",9807]], 
                                                                              
                                                                              PARAMETER["Latitude of natural origin",49, 
                                                                                        
                                                                                        ANGLEUNIT["degree",0.0174532925199433], 
                                                                                        
                                                                                        ID["EPSG",8801]], 
                                                                              
                                                                              PARAMETER["Longitude of natural origin",-2, 
                                                                                        
                                                                                        ANGLEUNIT["degree",0.0174532925199433], 
                                                                                        
                                                                                        ID["EPSG",8802]], 
                                                                              
                                                                              PARAMETER["Scale factor at natural origin",0.9996012717, 
                                                                                        
                                                                                        SCALEUNIT["unity",1], 
                                                                                        
                                                                                        ID["EPSG",8805]], 
                                                                              
                                                                              PARAMETER["False easting",400000, 
                                                                                        
                                                                                        LENGTHUNIT["metre",1], 
                                                                                        
                                                                                        ID["EPSG",8806]], 
                                                                              
                                                                              PARAMETER["False northing",-100000, 
                                                                                        
                                                                                        LENGTHUNIT["metre",1], 
                                                                                        
                                                                                        ID["EPSG",8807]]], 
                                                                   
                                                                   CS[Cartesian,2], 
                                                                   
                                                                   AXIS["(E)",east, 
                                                                        
                                                                        ORDER[1], 
                                                                        
                                                                        LENGTHUNIT["metre",1, 
                                                                                   
                                                                                   ID["EPSG",9001]]], 
                                                                   
                                                                   AXIS["(N)",north, 
                                                                        
                                                                        ORDER[2], 
                                                                        
                                                                        LENGTHUNIT["metre",1, 
                                                                                   
                                                                                   ID["EPSG",9001]]]]  
                                                         
                                                         > Aligned_Raster_ESA <- resample(ESA_Geotiff, GEDI_Geotiff, methods = "bilinear") 
                                                         
                                                         > Aligned_Raster_ICESat2 <- resample(ICESat2_Geotiff, GEDI_Geotiff, method = 'bilinear') 
                                                         
                                                         > Aligned_Raster_ESA <- resample(ESA_Geotiff, GEDI_Geotiff, method = "bilinear") 
                                                         
                                                         > par(mfrow = c(1,3)) 
                                                         
                                                         > plot(GEDI_Geotiff, main = "GEDI") 
                                                         
                                                         > plot(Aligned_Raster_ESA, main = "ESA") 
                                                         
                                                         > plot(Aligned_Raster_ICESat2, main = "ICESat2") 
                                                         
                                                         > writeRaster(Aligned_Raster_ESA, "ESA_Resampled_Mean_Aligned_BNG_Bi.tif") 
                                                         
                                                         > writeRaster(Aligned_Raster_ICESat2, "ICESat2_Resampled_Mean_Aligned_BNG_Bi.tif", format = "GTiff") 
                                                         
                                                         > writeRaster(Aligned_Raster_ESA, "ESA_Resampled_Mean_Aligned_BNG_Bi.tif", format = "GTiff") 
                                                         
                                                         Error: [writeStart] file exists. You can use 'overwrite=TRUE' to overwrite it 
                                                         
                                                         > overwrite=TRUE 
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         Scatterplots  
                                                         
                                                         
                                                         
                                                         setwd('R:/s2587604/Biomass_Data/Resample') 
                                                         
                                                         > library(raster) 
                                                         
                                                         Loading required package: sp 
                                                         
                                                         Warning messages: 
                                                           
                                                           1: package ???raster??? was built under R version 4.2.3  
                                                         
                                                         2: package ???sp??? was built under R version 4.2.3  
                                                         
                                                         > library(ggplot2) 
                                                         
                                                         Warning message: 
                                                           
                                                           package ???ggplot2??? was built under R version 4.2.3  
                                                         
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
                                                         
                                                         > 