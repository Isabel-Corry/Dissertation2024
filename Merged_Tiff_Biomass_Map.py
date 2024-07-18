import rasterio
import os
from rasterio.merge import merge 

folder_path = 'Biomass_Map/Jenkins_Spruce/DCHM_BNG'

print(f"Searching for GeoTiff files in {folder_path} ...")
tiff_files = [os.path.join(folder_path, file) for file in os.listdir(folder_path) if file.endswith('.tif')] 

if len(tiff_files) == 0:
    print(f"No GeoTIFF fiels found in {folder_path}. Exiting..")
    exit() 

print(f"Found {len(tiff_files)} GeoTIFF files")

src_files_to_mosaic = []

for file in tiff_files:
    print(f"Opening {file} ..")
    src = rasterio.open(file)
    src_files_to_mosaic.append(src)

print(f"Merging GeoTIFF files ...")
mosaic, out_trans = merge(src_files_to_mosaic)

out_meta = src.meta.copy()
out_meta.update({"driver": "GTiff", 
                 "height": mosaic.shape[1],
                 "width": mosaic.shape[2],
                 "transform": out_trans})

output_folder= "Biomass_Map/Jenkins_Spruce/Biomass_Merged.tif"

print(f"Saving merged GeoTIFF to {output_folder} ..")
with rasterio.open(output_folder, "w", **out_meta) as dst:
    dst.write(mosaic)

print(f"Merged GeoTIFF saved to {output_folder}")