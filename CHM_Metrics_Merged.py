import os 
import rasterio 
import numpy as np 
import csv 

def Calculate_metrics(chm_path, threshold=2.0):
    """Calculate maximum canopy height, mean canopy heght, and canopy cover percentages from a CHM raster file.
    Parameters:
    - chm_path (str): Path to the CHM raster file.
    - threshold (float): Threshold height (in meters) to define canopy cover
    
    Returns:
    - max_height float): Maximum canopy height.
    - mean_height (float): Mean canopy height.
    - canopy_cover_pct (float): Canopy cover percentage
    """

    with rasterio.open(chm_path) as src:
        chm = src.read(1, masked=True)
        chm_heights = chm.data.flatten()

        #Calculate Metrics 
        max_height = np.max(chm_heights)
        mean_height = np.mean(chm_heights)

        #Calculate canopy cover percentages
        canopy_cover_pixels = np.sum(chm_heights > threshold)
        total_pixels = chm_heights.size 
        canopy_cover_pct= (canopy_cover_pixels / total_pixels) * 1000.0

    return max_height, mean_height, canopy_cover_pct 

def Save_metrics_to_CSV(metrics_dict, output_csv):
    with open(output_csv, 'w', newline='') as csvfile:
        cvswriter = csv.writer(csvfile)
        cvswriter.writerow(['File', 'Max Height (m)', 'Mean Height (m)', 'Canopy Cover (%)'])
        for CHM_file, metrics in metrics_dict.items():
            max_height, mean_height, canopy_cover_pct = metrics 
            cvswriter.writerow([CHM_file, max_height, mean_height, canopy_cover_pct])

if __name__ == "__main__":
    CHM_file = 'DCHM_Merged.tif'

    max_height, mean_height, canopy_cover_pct = Calculate_metrics(CHM_file)

    print(f"Maximum Canopy Height: {max_height:.2f} meters")
    print(f"Mean Canopy Height: {mean_height:.2f} meters")
    print(f"Canopy Cover Percentage: {canopy_cover_pct:.2f}%")
    
    output_csv = "CHM_Metrics_Merged.csv"
    Save_metrics_to_CSV(output_csv)

    print("All CHM files processed")
