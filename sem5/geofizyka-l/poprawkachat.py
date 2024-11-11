# Importujemy potrzebne biblioteki
import math
from matplotlib import pyplot as plt
import numpy as np
import geopandas as gpd
from geopandas.geodataframe import GeoDataFrame
import matplotlib.cm as cm
import matplotlib.colors as mcolors

# Ścieżki do plików SHP
nmt5_path = 'nmt5.shp'
dane5_path = 'dane5.shp'

# Wczytanie plików SHP
nmt5_gpd = gpd.read_file(nmt5_path)
dane5_gpd = gpd.read_file(dane5_path)

# Upewnij się, że oba zbiory danych mają ten sam układ współrzędnych (CRS)
nmt5_gpd = nmt5_gpd.to_crs(dane5_gpd.crs)

# Ustawienie promienia dla bufora
radius = 1200  # jednostki zgodne z CRS, np. w metrach

# Utworzenie bufora wokół punktów w dane5
dane5_gpd['buffer'] = dane5_gpd.geometry.buffer(radius)

# Zmieniamy kolumnę 'buffer' na nową geometrię
dane5_gpd = dane5_gpd.set_geometry('buffer')

# Przestrzenne połączenie, aby znaleźć punkty nmt5 w obrębie bufora punktów dane5
nmt5_in_radius = gpd.sjoin(nmt5_gpd, dane5_gpd, predicate='within', how='inner')

# Wyświetlanie buforów i przypisanych do nich punktów nmt5 na mapie
fig, ax = plt.subplots(figsize=(10, 10))

# Wyświetlenie buforów
dane5_gpd.plot(ax=ax, color='blue', alpha=0.3, edgecolor='k', label='Bufory (1200m)')

# Wyświetlenie punktów dane5
dane5_gpd.set_geometry('geometry').plot(ax=ax, color='black', markersize=10, label='Punkty Dane5')

# Przygotowanie koloru dla każdej grupy punktów nmt5 w zależności od ich przynależności do buforów
unique_buffers = nmt5_in_radius['index_right'].unique()
colors = cm.get_cmap('tab10', len(unique_buffers))  # Wybranie mapy kolorów z 10 odcieniami

# Grupowanie i rysowanie punktów nmt5 przypisanych do każdego bufora innym kolorem
for i, buffer_id in enumerate(unique_buffers):
    points_in_buffer = nmt5_in_radius[nmt5_in_radius['index_right'] == buffer_id]
    points_in_buffer.plot(ax=ax, color=colors(i), markersize=5, label=f'Punkty NMT5 w buforze {buffer_id}')

# Ustawienia wykresu
plt.legend()
plt.title('Bufory wokół punktów dane5 oraz punkty nmt5 przypisane do każdego bufora')
plt.show()

# Przywrócenie oryginalnej geometrii bez buforów
dane5_gpd = dane5_gpd.set_geometry('geometry').drop(columns=['buffer'])

# print punktow znajdujacych si