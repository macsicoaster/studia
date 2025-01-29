#Utwórz prostą mapę na której zaprezentujesz granice miasta Wrocław, na tle granic województwa. Dane pobierz za pomocą biblioteki osmnx.

import osmnx as ox
import geopandas as gpd
import matplotlib.pyplot as plt

wroclaw = ox.geocode_to_gdf("Wrocław, Polska")
dolnoslaskie = ox.geocode_to_gdf("województwo dolnośląskie, Polska")
fig, ax = plt.subplots(figsize=(8, 8))
dolnoslaskie.plot(ax=ax, color="blue", edgecolor="black", alpha=0.5)
wroclaw.plot(ax=ax, color="none", edgecolor="red", linewidth=2)
plt.show()