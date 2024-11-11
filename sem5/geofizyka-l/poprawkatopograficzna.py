# Importujemy potrzebne biblioteki
import math
from matplotlib import pyplot as plt
import numpy as np
import geopandas as gpd
from geopandas.geodataframe import GeoDataFrame

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
# Wykorzystujemy 'sjoin' z predykatem 'within'
nmt5_in_radius = gpd.sjoin(nmt5_gpd, dane5_gpd, predicate='within', how='inner')

# Wynikowy GeoDataFrame `nmt5_in_radius` zawiera teraz punkty nmt5 znajdujące się w promieniu `radius` od każdego punktu w `dane5`.
# Możesz wyczyścić `buffer` z `dane5_gpd` jeśli jest już zbędny
dane5_gpd = dane5_gpd.set_geometry('geometry').drop(columns=['buffer'])


centers = []
for row in dane5_gpd.T:
    data = dane5_gpd.iloc[row]
    ng = data['NG']
    eg = data['EG']
    centers.append((ng,eg))

center_points = {k: [] for k in centers}

