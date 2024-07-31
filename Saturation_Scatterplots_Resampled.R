setwd('P:/Geotiff')
library(raster)
library(ggplot2)
library(gridExtra)
GEDI_File <- "GEDI_Cornwall.tif"
ESA_File <- "ESA_Resample_Mean.tif"
ICESat2_File <- "ICESat2_Resample_Mean.tif"
GEDI_Raster <- raster(GEDI_File)
ESA_Raster <- raster(ESA_File)
ICESat2_Raster <- raster(ICESat2_File)
GEDI_Vector <- na.omit(values(GEDI_Raster))
ESA_Vector <- na.omit(values(ESA_Raster))
ICESat2_Vector <- na.omit(values(ICESat2_Raster))
min_length <- min(length(GEDI_Vector), length(ESA_Vector), length(ICESat2_Vector))
GEDI_Vector <- GEDI_Vector[1:min_length]
ESA_Vector <- ESA_Vector[1:min_length]
ICESat2_Vector <- ICESat2_Vector[1:min_length]
data <- data.frame(GEDI = GEDI_Vector, ESA = ESA_Vector, ICESat2 = ICESat2_Vector)
create_hex_plot <- function(x, y, xlab, ylab, title) {
  ggplot(data, aes(x = !!sym(x), y = !!sym(y))) + 
    geom_hex(bins = 20) + 
    scale_fill_viridis_c() + 
    labs(title =  title, x = xlab, y = ylab) + 
    theme_minimal() + 
    coord_fixed() + 
    xlim(0, 150) + 
    ylim(0, 150)
}
hex_plot_p1 <- create_hex_plot("GEDI", "ESA", "GEDI Biomass", "ESA CCI Biomass", "GEDI vs ESA CCI")
hex_plot_p2 <- create_hex_plot("GEDI", "ICESat2", "GDI Biomass", "ICESat2 Biomass", "GEDI vs ICESat2")
hex_plot_p3 <- create_hex_plot("ESA", "ICESat2", "ESA CCI Biomass", "ICESat2 Biomass", "ESA CCI vs ICESat2")
grid.arrange(hex_plot_p1, hex_plot_p2, hex_plot_p3, ncol = 3)
