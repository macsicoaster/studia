# Biblioteki
import math
from matplotlib import pyplot as plt
import numpy as np
import geopandas as gpd
from geopandas.geodataframe import GeoDataFrame
import openpyxl

# Wczytanie danych i zapisanie ich do zmiennych
nmt5_path = 'nmt5.shp'
dane5_path = 'dane5.shp'

dane5_gpd: GeoDataFrame = gpd.read_file(dane5_path)
nmt5_gpd: GeoDataFrame = gpd.read_file(nmt5_path)

nmt5_gpd = nmt5_gpd.to_crs(dane5_gpd.crs)

# Ustawienie bufora
buffer = 1000


dane5_gpd['buffer'] = dane5_gpd.geometry.buffer(buffer)
dane5_gpd = dane5_gpd.set_geometry('buffer')

# Znalezienie punktów w zasięgu

nmt5_in_radius: GeoDataFrame = gpd.sjoin(nmt5_gpd, dane5_gpd, predicate='within', how='inner')

x = nmt5_in_radius.iloc[0]['geometry']

centers = {}

# Grupowanie punktów
for index, row in nmt5_in_radius.iterrows():
    x = row['NG']
    y = row['EG']
    h = row['H']
    centers[(x, y, h)] = centers.get((x, y, h), []) + [row]

# Funkcja obliczająca odległość
def get_distance(x1, y1, x2, y2):
    return math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)

# Funkcja obliczająca wartośćt
def calculate(center, points):
    k = 0.04187
    p = 2.67
    sum = 0
    for point in points:
        x = point['NCN']
        y = point['NCE']
        r = get_distance(center[0], center[1], x, y)
        h = abs(point['Hnorm'] - center[2])
        sum += r + abs(h) - np.sqrt(r ** 2 + h ** 2) 
    return k * p * sum / len(points)

# Wyświetlenie wyników
for center, points in centers.items():
    for point in points:
        print(f'Center: {center}, result: {calculate(center, points)}')

# eksport do pliku csv
#nmt5_in_radius.to_csv('nmt5_in_radius.csv')

# dopisanie roznicy wysokosci do kazdego punktu dane5 (point['Hnorm'] - center[2])
dane5_gpd['Hnorm'] = 0
for index, row in dane5_gpd.iterrows():
    x = row['NG']
    y = row['EG']
    h = row['H']
    points = centers.get((x, y, h), [])
    dane5_gpd.at[index, 'Hnorm'] = abs(points[0]['Hnorm'] - h)

# dopisanie poprawki dla kazdego punktu dane5
dane5_gpd['poprawka'] = 0
for index, row in dane5_gpd.iterrows():
    x = row['NG']
    y = row['EG']
    h = row['H']
    points = centers.get((x, y, h), [])
    dane5_gpd.at[index, 'poprawka'] = calculate((x, y, ), points)

# zapisanie do pliku xls
dane5_gpd.to_excel('dane5_poprawione.xlsx')