import os 
from osgeo import gdal 

def asc_to_geotiff(input_asc, output_geotiff):
    gdal.Translate(output_geotiff, input_asc, format='GTiff')

def batch_asc_to_geotiff(input_folder, output_folder): 
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    for filename in os.listdir(input_folder):
        if filename.endswith('.asc'):
            input_asc = os.path.join(input_folder, filename)
            output_geotiff = os.path.join(output_folder, filename.replace('.asc', '.tif'))
            asc_to_geotiff(input_asc, output_geotiff)

if __name__ == "__main__":
    asc_file_one = 'DSM/dsm_ss11ne_5x5km.asc'
    tif_file_one = 'DSM_Geotiff/dsm_ss11ne_5x5km.tif'
    asc_file_two = 'DSM/dsm_sx05ne_5x5km.asc'
    tif_file_two = 'DSM_Geotiff/dsm_sx05ne_5x5km.tif' 

    asc_to_geotiff(asc_file_one, tif_file_one)
    asc_to_geotiff(asc_file_two, tif_file_two)