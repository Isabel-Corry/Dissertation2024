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
    #input_dsm_folder = 'DSM'
    #output_dsm_folder = 'DSM_Geotiff'
    #batch_asc_to_geotiff(input_dsm_folder, output_dsm_folder)

    input_dtm_folder = 'DTM'
    output_dtm_folder = 'DTM_Geotiff'
    batch_asc_to_geotiff(input_dtm_folder, output_dtm_folder)