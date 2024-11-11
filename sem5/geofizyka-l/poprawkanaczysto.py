# Biblioteki
import math
from matplotlib import pyplot as plt
import numpy as np
import geopandas as gpd
from geopandas.geodataframe import GeoDataFrame

# Wczytanie danych i zapisanie ich do zmiennych
nmt5_path = 'nmt5.shp'
dane5_path = 'dane5.shp'

dane5_gpd: GeoDataFrame = gpd.read_file(dane5_path)
nmt5_gpd: GeoDataFrame = gpd.read_file(nmt5_path)

nmt5_gpd = nmt5_gpd.to_crs(dane5_gpd.crs)
buffer = 1200


dane5_gpd['buffer'] = dane5_gpd.geometry.buffer(buffer)
dane5_gpd = dane5_gpd.set_geometry('buffer')

nmt5_in_radius: GeoDataFrame = gpd.sjoin(nmt5_gpd, dane5_gpd, predicate='within', how='inner')

x = nmt5_in_radius.iloc[0]['geometry']

centers = {}

for index, row in nmt5_in_radius.iterrows():
    x = row['NG']
    y = row['EG']
    centers[(x, y)] = centers.get((x, y), []) + [row]


def get_distance(x1, y1, x2, y2):
    return math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)

def calculate(center, points):
    k = 0.04
    p = 2.67
    sum = 0
    for point in points:
        x = point['NCN']
        y = point['NCE']
        r = get_distance(center[0], center[1], x, y)
        h = point['Hnorm']
        sum += r + abs(h) - np.sqrt(r ** 2 + h ** 2) 
    return 2/len(points) * math.pi * k * p * sum

for center, points in centers.items():
    print(f'Center: {center}, result: {calculate(center, points)}')






