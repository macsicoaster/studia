# Otwórz plik shp z granicami dzielnic. Utwórz 500 metrowe bufory wokół centroidów dzielnic i wyświetl je na wykresie.
import geopandas as gpd
import matplotlib.pyplot as plt

lokalizacjashp = "gran_dzielnice/gran_dzielnice.shp"
dzielnice = gpd.read_file(lokalizacjashp)

dzielnice["centroid"] = dzielnice.geometry.centroid
dzielnice["buffer"] = dzielnice["centroid"].buffer(500)

fig, ax = plt.subplots(figsize=(8, 8))
dzielnice.plot(ax=ax, color="none", edgecolor="black", linewidth=1)
dzielnice.set_geometry("buffer").plot(ax=ax, color="navy", alpha=0.3)
dzielnice.set_geometry("centroid").plot(ax=ax, color="purple", markersize=15)
plt.show()