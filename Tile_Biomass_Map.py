import os 
import rasterio 
import numpy as np 

def caculate_biomass(height_array):
    height_array[height_array <= 0] = 0.01
    biomass_array = 0.0000144620 * (height_array)**2.4767
    return biomass_array

input_directory = 'DCHM'
output_directory = 'Biomass_Map'
os.makedirs(output_directory, exist_ok=True)

for filename in os.listdir(input_directory):
    if filename.endswith('.tif'):
        CHM_Path = os.path.join(input_directory, filename)
        print(f"processing file: {CHM_Path}")
        try:
            with rasterio.open(CHM_Path) as src:
                CHM_Array = src.read(1)
                profile = src.profile 
                print(f"CHM file opened. Array shape: {CHM_Array.shape}")

                print("Calculating biomass.. ")
                Biomass_Array = caculate_biomass(CHM_Array)
                print("Biomass calcualtion completed.")

                profile.update(dtype=rasterio.float32, count=1)

                Biomass_Path = os.path.join(output_directory, f"Biomass_{filename}")
                print(f"Saving biomass map to: {Biomass_Path}")
                with rasterio.open(Biomass_Path, 'w', **profile) as dst:
                    dst.write(Biomass_Array.astype(rasterio.float32), 1)
                    print("Biomass map saved sucessfully.")
        except FileNotFoundError as e:
            print(f"File not found: {e.filename}")
        except PermissionError as e:
            print(f"Permission error: {e}")
        except Exception as e:
            print(f"An error occured while processsing {filename}: {e}")
