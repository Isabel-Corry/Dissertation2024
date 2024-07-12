import numpy as np
import os 
from osgeo import gdal 

def subtract_dsm_dtm(dsm_file, dtm_file, output_dchm):
    dsm_ds = gdal.Open(dsm_file, gdal.GA_ReadOnly)
    dtm_ds = gdal.Open(dtm_file, gdal.GA_ReadOnly)

    dsm_array = dsm_ds.ReadAsArray().astype(np.float32)
    dtm_array = dtm_ds.ReadAsArray().astype(np.float32)

    dchm_array = dsm_array - dtm_array

    driver = gdal.GetDriverByName('GTIff')
    dchm_ds = driver.Create(output_dchm, dsm_ds.RasterXSize, dsm_ds.RasterYSize, 1, gdal.GDT_Float32)
    dchm_ds.SetProjection(dsm_ds.GetProjection())
    dchm_ds.SetGeoTransform(dsm_ds.GetGeoTransform())
    dchm_ds.GetRasterBand(1).WriteArray(dchm_array)
    dchm_ds.GetRasterBand(1).SetNoDataValue(-9999)
    dchm_ds.FlushCache()

    dchm_ds = None 
    dsm_ds = None 
    dtm_ds = None 

def calculate_mean_value(dchm_file):
    dchm_ds = gdal.Open(dchm_file, gdal.GA_ReadOnly)
    dchm_array = dchm_ds.ReadAsArray()

    mean_value = np.mean(dchm_array)

    dchm_ds = None 

    return mean_value

def Calcculate_dchm_and_mean(dsm_folder, dtm_folder, output_folder):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    for dsm_file in os.listdir(dsm_folder):
        if dsm_file.endswith('.tif'):
            dsm_path = os.path.join(dsm_folder, dsm_file)
            dtm_file = dsm_file.replace('dsm_', 'dtm_')
            dtm_path = os.path.join(dtm_folder, dtm_file)

        if os.path.exists(dtm_path):
            output_dchm = os.path.join(output_folder, dsm_file.replace('dsm_', 'dchm__'))

            subtract_dsm_dtm(dsm_path, dtm_path, output_dchm)

            mean_value = calculate_mean_value(output_dchm)
            print(f"Mean value of DCHM '{dsm_file}': {mean_value}")

if __name__ == "__main__":
    input_dsm_folder = 'DSM_Geotiff'
    input_dtm_folder = 'DTM_Geotiff'
    output_dchm_folder = 'DCHM'

    Calcculate_dchm_and_mean(input_dsm_folder, input_dtm_folder, output_dchm_folder)