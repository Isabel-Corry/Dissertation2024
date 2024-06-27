import rasterio
import numpy as np 
import matplotlib.pyplot as plt 

GEDI_Geotiff = 'GEDI_Cornwall_BNG.tif'
ESA_Geotiff = 'ESA_Resample_Mean.tif'
ICESat2_Geotiff = 'ICESat2_Resample_Mean.tif'

with rasterio.open(GEDI_Geotiff) as src1, rasterio.open(ESA_Geotiff) as src2, rasterio.open(ICESat2_Geotiff) as src3:
    Biomass_GEDI = src1.read(1)
    Biomass_ESA = src2.read(1)
    Biomass_ICESat2 = src3.read(1)

Biomass_GEDI = Biomass_GEDI.flatten()
Biomass_ESA = Biomass_ESA.flatten()
Biomass_ICESat2 = Biomass_ICESat2.flatten()

#print(Biomass_GEDI)
#print(Biomass_ESA)
#print(Biomass_ICESat2)

#mask = (Biomass_GEDI != src1.nodata) & (Biomass_ESA != src2.nodata) & (Biomass_ICESat2 != src3.nodata)

#Biomass_GEDI = Biomass_GEDI[mask]
#Biomass_ESA = Biomass_ESA[mask]
#Biomass_ICESat2 = Biomass_ICESat2[mask]

#print(Biomass_GEDI)
#print(Biomass_ESA)
#print(Biomass_ICESat2)

plt.figure(figsize=(10,6))
plt.scatter(Biomass_GEDI, Biomass_ESA, alpha=0.5, c='blue', edgecolors='none')
plt.title('GEDI vs ESA Biomass')
plt.xlabel('GEDI Biomass')
plt.xlim(0, 200)
plt.ylabel('ESA Biomass')
plt.ylim(0, 200)
plt.grid(True)
plt.show()
plt.savefig(f"{'GEDI_vs_ESA_Biomass'}.png")
plt.clf()

plt.figure(figsize=(10,6))
plt.scatter(Biomass_GEDI, Biomass_ICESat2, alpha=0.5, c='green', edgecolors='none')
plt.title('GEDI vs ICESat2 Biomass')
plt.xlabel('GEDI Biomass')
plt.xlim(0, 200)
plt.ylabel('ICESat2 Biomass')
plt.ylim(0, 200)
plt.grid(True)
plt.show()
plt.savefig(f"{'GEDI_vs_ICESat_Biomass'}.png")
plt.clf()

plt.figure(figsize=(10,6))
plt.scatter(Biomass_ESA, Biomass_ICESat2, alpha=0.5, c='red', edgecolors='none')
plt.title('ESA vs ICESat2 Biomass')
plt.xlabel('ESA Biomass')
plt.xlim(0, 200)
plt.ylabel('ICESat2 Biomass')
plt.ylim(0, 200)
plt.grid(True)
plt.show()
plt.savefig(f"{'ESA_vs_ICESat_Biomass'}.png")
plt.clf()

fig, axes = plt.subplots(1,3, figsize=(18,6))

axes[0].scatter(Biomass_GEDI, Biomass_ESA, alpha=0.5, c='blue', edgecolor='none')
axes[0].set_title('GEDI vs ESA Biomass')
axes[0].set_xlabel('GEDI Biomass')
axes[0].set_xlim(0, 200)
axes[0].set_ylabel('ESA Biomass')
axes[0].set_ylim(0, 200)
axes[0].grid(True)

axes[1].scatter(Biomass_GEDI, Biomass_ICESat2, alpha=0.5, c='green', edgecolor='none')
axes[1].set_title('GEDI vs ICESat2 Biomass')
axes[1].set_xlabel('GEDI Biomass')
axes[1].set_xlim(0, 200)
axes[1].set_ylabel('ICESat2 Biomass')
axes[1].set_ylim(0, 200)
axes[1].grid(True)

axes[2].scatter(Biomass_ESA, Biomass_ICESat2, alpha=0.5, c='red', edgecolor='none')
axes[2].set_title('ESA vs ICESat2')
axes[2].set_xlabel('ESA Biomass')
axes[2].set_xlim(0, 200)
axes[2].set_ylabel('ICESat2 Biomass')
axes[2].set_ylim(0, 200)
axes[2].grid(True)

plt.tight_layout( )
plt.show()
plt.savefig(f"{'Scatterplot_Biomass_Comparison'}.png")
plt.clf()