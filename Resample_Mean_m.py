import rasterio
from rasterio.warp import calculate_default_transform, reproject, Resampling 
import numpy as np 

def resample_geotiff(input_file, output_file, new_width_meters, new_height_meters):
    with rasterio.open(input_file) as src:
        src_res_x = src.transform[0]
        src_res_y = src.transform[4]
        scale_x = src_res_x / new_width_meters
        scale_y = src_res_y / new_height_meters

        new_width = int(src.width * scale_x)
        new_height = int(src.height * scale_y)

        dst_transform, dst_width, dst_height = calculate_default_transform(
            src.crs, src.crs, 
            width=new_width, height=new_height, 
            left=src.bounds.left, bottom=src.bounds.bottom, 
            right=src.bounds.right, top=src.bounds.top
        )

        profile = src.profile
        profile.update({
            'dtype': rasterio.float32,
            'width': new_width,
            'height': new_height,
            'transform': dst_transform
        })

        with rasterio.open(output_file, 'w', **profile) as dst:
            for i in range(1, src.count + 1):
                reproject(
                    source=rasterio.band(src, i),
                    destination=rasterio.band(dst, i), 
                    src_transform=src.transform, 
                    src_crs=src.crs,
                    dst_transform=dst_transform,
                    dst_crs=src.crs,
                    resampling=Resampling.average
                )

def main():
    input_ESA = 'ESA_Extract_Merged.tif'
    input_ICESat2 = 'ICESat2_Cornwall_1B.tif'
    output_ESA = 'ESA_Resampled_Mean.tif'
    ouput_ICESat2 = 'ICESat2_Resampled_Mean.tif'
    new_width_meters = 800
    new_height_meters = 1300

    resample_geotiff(input_ESA, output_ESA, new_width_meters, new_height_meters)

    resample_geotiff(input_ICESat2, ouput_ICESat2, new_width_meters, new_height_meters)

if __name__ == "__main__":
    main()