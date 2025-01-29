from geopandas import read_file
from geopandas import geodataframe as gpd
from shapely.geometry import LineString
from shapely.ops import nearest_points
import matplotlib.pyplot as plt

_SHP_PATH = '/Users/maciejklossek/Documents/studia/sem5/geodane/python/grid_wroclaw.shp'
_SHP_PATH2 = '/Users/maciejklossek/Documents/studia/sem5/geodane/python/osiedla.shp'
_SHP_PATH3 = '/Users/maciejklossek/Documents/studia/sem5/geodane/python/budynki.shp'

granice_df = read_file(_SHP_PATH, engine='pyogrio')
osiedla_df = read_file(_SHP_PATH2, engine='pyogrio')
budynki_df = read_file(_SHP_PATH3, engine='pyogrio')
#print(granice_df.head())

#fig, ax = plt.subplots()
#granice_df.plot(ax=ax, color='purple', edgecolor='black')
#osiedla_df.plot(ax=ax, color='white', edgecolor='black')
#budynki_df.plot(ax=ax, color='red', edgecolor='black')
#plt.show()

#dodac wykres laczacy centroidy dzielnic, od najwiekszej do najmniejszej
osiedla_df['area'] = osiedla_df.geometry.area
osiedla_sorted_df = osiedla_df.sort_values(by='area')

centroids_df = osiedla_sorted_df.geometry.centroid



lines = LineString(centroids_df.tolist())
line_df = gpd.GeoDataFrame(geometry=[lines], crs=osiedla_sorted_df.crs)

fig,ax = plt.subplots()
osiedla_df.plot(ax=ax, color='red', edgecolor='black')
line_df.plot(ax=ax, color='blue')
plt.show()

