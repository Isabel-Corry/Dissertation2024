import rasterio 
import numpy as np 
import matplotlib.pyplot as plt  

def load_geotiff(file_path): 
    with rasterio.open(file_path) as src:  
        data = src.read(1) 
        profile = src.profile 
    return data, profile  

def calculate_saturation(data, threshold): 
    saturated_pixels = data > threshold 
    saturation_percentage = np.sum(saturated_pixels) / data.size * 100  
    return saturation_percentage 

def create_saturation_mask(data, threshold): 
    return data > threshold 

def plot_saturation_map(data, mask, title): 
    plt.figure(figsize=(10,10)) 
    plt.imshow(data, cmap='Greys', interpolation='none') 
    plt.imshow(mask, cmap='viridis', alpha=0.5, interpolation='none') 
    plt.title(title) 
    plt.colorbar() 
    plt.show() 

def save_geotiff(file_path, data, profile): 
    with rasterio.open(file_path, 'w', **profile) as dst: 
        dst.write(data.astype(rasterio.uint8), 1) 

if __name__ == "__main__": 
    GEDI_data, GEDI_profile = load_geotiff('GEDI_Cornwall.tif') 
    ESA_data, ESA_profile = load_geotiff('ESA_Extract_Merged.tif')  
    ICESat2_data, ICESat2_profile = load_geotiff('ICESat2_Cornwall_1B.tif') 

    saturation_threshold = 75 

    GEDI_saturation = calculate_saturation(GEDI_data, saturation_threshold) 
    ESA_saturation = calculate_saturation(ESA_data, saturation_threshold) 
    ICESat2_saturation = calculate_saturation(ICESat2_data, saturation_threshold) 

    print(f'GEDI Saturation: {GEDI_saturation:.2f}%') 
    print(f'ESA Saturation: {ESA_saturation:.2f}%') 
    print(f'ICESat2 Saturation: {ICESat2_saturation:.2f}%') 

    GEDI_saturation_mask = create_saturation_mask(GEDI_data, saturation_threshold) 
    ESA_saturation_mask = create_saturation_mask(ESA_data, saturation_threshold) 
    ICESat2_saturation_mask = create_saturation_mask(ICESat2_data, saturation_threshold) 

    plot_saturation_map(GEDI_data, GEDI_saturation_mask, 'GEDI Saturation Map') 
    plot_saturation_map(ESA_data, ESA_saturation_mask, 'ESA Saturation Map') 
    plot_saturation_map(ICESat2_data, ICESat2_saturation_mask, 'ICESat2 Saturation Map') 

    save_geotiff('GED_saturation_mask.tif', GEDI_saturation_mask, GEDI_profile) 
    save_geotiff('ESA_saturation_mask.tif', ESA_saturation_mask, ESA_profile) 
    save_geotiff('ICESAt2_saturation_mask.tif', ICESat2_saturation_mask, ICESat2_profile)