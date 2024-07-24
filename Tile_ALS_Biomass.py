import os 
import rasterio 
import numpy as np 

 
def calculate_biomass(height_array): 

    height_array[height_array <= 0] = 0.01 

    biomass_array = 0.1256 * (height_array)**2.3323

    return biomass_array 

 

input_directory = 'DCHM' 

output_directory = 'Biomass_Map' 

os.makedirs(output_directory, exist_ok=True) 

 

for filename in os.listdir(input_directory): 

    if filename.endswith('.tif'): 

        CHM_Path = os.path.join(input_directory, filename) 

        print(f"Processing file: {CHM_Path}") 

        try: 

            with rasterio.open(CHM_Path) as src: 

                CHM_Array = src.read(1) 

                profile = src.profile 

                print(f"CHM file opened. Array shape: Tiled_Biomas_ALS.py{CHM_Array.shape}") 

 

                # Check for height constraints 

                if np.any(CHM_Array > 30): 

                    print(f"Warning: Height values exceed 30 meters in {filename}") 

                elif np.any(CHM_Array > 20): 

                    print(f"Warning: Height values exceed 20 meters in {filename}") 

 

                # Remove tiles with excessive heights 

                if np.any(CHM_Array > 60): 

                    print(f"Removing {filename} due to excessive height values.") 

                    continue  # Skip this file 
                 

                print("Calculating biomass...") 

                Biomass_Array = calculate_biomass(CHM_Array) 

                print("Biomass calculation completed.") 

 

                # Highlight tiles with biomass more than 350 

                if np.any(Biomass_Array > 350): 

                    print(f"Warning: Biomass values exceed 350 in {filename}") 

                    high_biomass_indices = np.where(Biomass_Array > 350) 

                    print(f"High biomass tiles: {high_biomass_indices}") 

 

                profile.update(dtype=rasterio.float32, count=1, crs='EPSG:27700') 

 

                Biomass_Path = os.path.join(output_directory, f"Biomass_{filename}") 

                print(f"Saving biomass map to: {Biomass_Path}")

                with rasterio.open(Biomass_Path, 'w', **profile) as dst: 

                    dst.write(Biomass_Array.astype(rasterio.float32), 1) 

                    print("Biomass map saved successfully.") 

        except FileNotFoundError as e: 

            print(f"File not found: {e.filename}") 

        except PermissionError as e: 

            print(f"Permission error: {e}") 

        except Exception as e: 

            print(f"An error occurred while processing {filename}: {e}") 