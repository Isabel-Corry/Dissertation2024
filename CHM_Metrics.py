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

def Process_CHM_folder(folder_path):
    """
    Process a folder  contianing CHM raster files and calcaute derived metrics. 
    
    Paramters:
    - folder_path (str): Path to the folder contianing CHM raster files. 
    
    Retruns:
    - metrics_dict (dict): Dictioanry storing calcaluted metrics for each CHM file.
    key are file na,es, values are tuples (max_height, mean_height, canopy_cover_pct)
    """

    metrics_dict = {}

    #list all files in the folder 
    CHM_files = [f for f in os.listdir(folder_path) if f.endswith('.tif')]

    #Iterate through each CHM file 
    for CHM_file in CHM_files:
        chm_path = os.path.join(folder_path, CHM_file)
        print(f"Processing {CHM_file}...")

        max_height, mean_height, canopy_cover_pct = Calculate_metrics(chm_path)

        #store metrics in dictionary 
        metrics_dict[CHM_file] = (max_height, mean_height, canopy_cover_pct)
        print(f"Completed {CHM_file}")

    return metrics_dict

def Save_metrics_to_CSV(metrics_dict, output_csv):
    with open(output_csv, 'w', newline='') as csvfile:
        cvswriter = csv.writer(csvfile)
        cvswriter.writerow(['File', 'Max Height (m)', 'Mean Height (m)', 'Canopy Cover (%)'])
        for CHM_file, metrics in metrics_dict.items():
            max_height, mean_height, canopy_cover_pct = metrics 
            cvswriter.writerow([CHM_file, max_height, mean_height, canopy_cover_pct])

if __name__ == "__main__":
    Process_CHM_folder = 'DCHM'
    metrics_dict = Process_CHM_folder(CHM_folder)

    for CHM_file , metrics in metrics_dict.items():
        max_height, mean_height, canopy_cover_pct = metrics
        print(f"File: {CHM_file}")
        print(f"Maximum Canopy Height: {max_height:.2f} meters")
        print(f"Mean Canopy Height: {mean_height:.2f} meters")
        print(f"Canopy Cover Percentage: {canopy_cover_pct:.2f}%")
        print("=" * 30)
    output_csv = "CHM_Metrics.csv"
    Save_metrics_to_CSV(metrics_dict, output_csv)

    print("All CHM files processed")
