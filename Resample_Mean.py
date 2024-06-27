import numpy as np 
import rasterio 
from rasterio.enums import Resampling

def read_raster(file_path):
    with rasterio.open(file_path) as src:
        data = src.read(1)
        transform = src.transform 
        profile = src.profile
    return data, transform, profile 

def write_raster(file_path, data, transform, profile):
    profile.update(
        dtype=rasterio.float32, 
        height=data.shape[0], 
        width=data.shape[1], 
        transform=transform
    )
    with rasterio.open(file_path, 'w', **profile) as dst:
        dst.write(data.astype(rasterio.float32), 1)

def resample_raster(data, transform, profile, new_res_x, new_res_y):
    src_height, src_width = data.shape
    src_res_x = transform.a
    src_res_y = transform.e

    scale_x = new_res_x / src_res_x
    scale_y = new_res_y / src_res_y

    new_height = int(src_height * scale_y)
    new_width = int(src_width * scale_x)

    new_transform = transform * transform.scale(
        (src_width / new_width), 
        (src_height/ new_height)
    )

    resampled_data = np.empty((new_height, new_width), dtype=np.float32)

    with rasterio.open('/vsimem/temp.tif', 'w', **profile) as temp_dst:
        temp_dst.write(data, 1)

    with rasterio.open('/vsimem/temp.tif') as temp_src:
        resampled_data = temp_src.read(
            1, 
            out_shape=(new_height, new_width),
            resampling=Resampling.average
        )
    return resampled_data, new_transform

def main():
    input_ESA = 'ESA_Extract_Merged.tif'
    input_ICESat2 = 'ICESat2_Cornwall_1B.tif'
    output_ESA = 'ESA_Resampled_Mean.tif'
    ouput_ICESat2 = 'ICESat2_Resampled_Mean.tif'
    new_width = 800
    new_height = 1300

    dataESA, transforESA, profileESA = read_raster(input_ESA)
    resampled_dataESA, new_transformESA = resample_raster(dataESA, transforESA, profileESA, new_width, new_height)
    write_raster(output_ESA, resampled_dataESA, new_transformESA, profileESA)

    dataICESat2, tranformICESat2, profileICESat2 = read_raster(input_ICESat2)
    resampled_dataICESat2, new_transformICESat2 = resample_raster(dataICESat2, tranformICESat2, profileICESat2, new_width, new_height)
    write_raster(ouput_ICESat2, resampled_dataICESat2, new_transformICESat2, profileICESat2)

if __name__ == "__main__":
    main()