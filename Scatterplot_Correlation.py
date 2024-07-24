import rasterio
import numpy as np 
from scipy.stats import pearsonr
import matplotlib.pyplot as plt

def read_geotiff(file_path):
    with rasterio.open(file_path) as src:
        return src.read(1)
    
def preprocess_data(arr1, arr2, arr3):
    min_rows = min(arr1.shape[0], arr2.shape[0], arr3.shape[0])
    min_cols = min(arr1.shape[1], arr2.shape[1], arr3.shape[1])
    arr1 = arr1[:min_rows, :min_cols]
    arr2 = arr2[:min_rows, :min_cols]
    arr3 = arr3[:min_rows, :min_cols]
    return arr1, arr2, arr3

def create_scatterplot(x, y, xlabel, ylabel, title, correlation, filename):
    plt.scatter(x, y, alpha=0.5)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title(f"{title}\nCorrelation: {correlation:.2f}")
    plt.grid(True)
    plt.savefig(filename)
    plt.close()

if __name__ == "__main__":
    GEDI_Biomass = read_geotiff('GEDI_Cornwall.tif')
    ESA_Biomass = read_geotiff('ESA_Resample_Mean.tif')
    ICESat2_Biomass = read_geotiff('ICESat2_Resample_Mean.tif')

    GEDI_Biomass, ESA_Biomass, ICESat2_Biomass = preprocess_data(GEDI_Biomass, ESA_Biomass, ICESat2_Biomass)

    GEDI_Biomass_flat = GEDI_Biomass.flatten()
    ESA_Biomass_flat = ESA_Biomass.flatten()
    ICESat2_Biomass_flat = ICESat2_Biomass.flatten()

    valid_indices = ~np.isnan(GEDI_Biomass_flat) & ~np.isnan(ESA_Biomass_flat) & ~np.isnan(ICESat2_Biomass_flat)

    GEDI_Biomass_flat = GEDI_Biomass_flat[valid_indices]
    ESA_Biomass_flat = ESA_Biomass_flat[valid_indices]
    ICESat2_Biomass_flat = ICESat2_Biomass_flat[valid_indices]

    corrGEDIESA, _ = pearsonr(GEDI_Biomass_flat, ESA_Biomass_flat)
    corrGEDIICESAt2, _ = pearsonr(GEDI_Biomass_flat, ICESat2_Biomass_flat)
    corrESAICESat2, _ = pearsonr(ESA_Biomass_flat, ICESat2_Biomass_flat)

    create_scatterplot(GEDI_Biomass_flat, ESA_Biomass_flat, 'GEDI Biomass', 'ESA Biomass', 'Scatterplot GEDI vs ESA Biomass', corrGEDIESA, 'Scatterplot_GEDI_vs_ESA_Biomass.png')
    create_scatterplot(GEDI_Biomass_flat, ICESat2_Biomass_flat, 'GEDI Biomass', 'ICESat2 Biomass', 'Scatterplot GEDI vs ESA Biomass', corrGEDIICESAt2, 'Scatterplot_GEDI_vs_ICESat2_Biomass.png')
    create_scatterplot(ESA_Biomass_flat, ICESat2_Biomass_flat, 'ESA Biomass', 'ICESat2 Biomass', 'Scatterplot ESA vs ICESat2 Biomass', corrESAICESat2, 'Scatterplot_ESA_vs_ICESat2_Biomass.png')