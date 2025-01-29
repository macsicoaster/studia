import pandas
import geopandas
import pathlib
import fiona
import pyogrio
import matplotlib.pyplot as plt
import osmnx as ox
import branca as bc
from mapclassify import classify

path_dz='C:/DYDAKTYKA/2023_24/lato/PYTHON/tbd/dzielnice.shp'
path_objdz = pathlib.Path(path_dz)
df_dz = geopandas.read_file(path_objdz)
df_dz.to_crs(epsg=4326,inplace=True)
#print(type(df_dz))


country='Polska'
country_area=ox.geocode_to_gdf(country)
#print(type(country_area))

province='dolnośląskie, Polska'
province_area=ox.geocode_to_gdf(province)
#print(type(province_area))

city='Wrocław'
city_area=ox.geocode_to_gdf(city)
#print(city_area.crs)

#fig,ax=plt.subplots()
#country_area.plot(ax=ax,color='green',label='Polska')
#province_area.plot(ax=ax,color='grey',label='dolnośląskie')
#city_area.plot(ax=ax,color='white',edgecolor='black',label='Wrocław')
#df_dz.plot(ax=ax,color='white', edgecolor='black')
#print(country_area)
#plt.legend()


place_names = [
    "Wrocław, Polska",
    "Trzebnica,Polska",
    "Oława,Polska",
    "Sobótka, Polska",
    "Środa Śląska, Polska",
]
ds_cities = ox.geocode_to_gdf(place_names)

city_byid=ox.geocode_to_gdf(["R2942230", ], by_osmid=True)

#fig,ax=plt.subplots()
#country_area.plot(ax=ax,color='green',label='Polska')
#province_area.plot(ax=ax,color='grey',label='dolnośląskie')
#ds_cities.plot(ax=ax,color='blue',edgecolor='black',label='cities')
#city_byid.plot(ax=ax,color='red',edgecolor='black')

#bbox = 51.00, 51.25, 16.8, 17.2
#street_wroc = ox.graph_from_bbox(bbox=bbox, network_type="drive_service")
#print(type(street_wroc))
#fig,ax=ox.plot_graph(street_wroc, node_color="red",show=False, close=False,
#    bgcolor="white")
#city_area.plot(ax=ax,color='white',edgecolor='black',label='Wrocław',alpha=0.6)

#l_point = (51.15, 17.00)
#street_wroc = ox.graph_from_point(l_point, dist=6000, dist_type="bbox",\
#                        network_type="drive_service")

#fig,ax=ox.plot_graph(street_wroc, node_color="red",show=False, close=False,
#    bgcolor="white")
#city_area.plot(ax=ax,color='white',edgecolor='black',label='Wrocław',alpha=0.6)


#street_wroc = ox.graph_from_place('Wrocław, Polska',network_type="drive_service")
#fig,ax=ox.plot_graph(street_wroc, node_color="red",show=False,bgcolor="white")
#city_area.plot(ax=ax,color='white',edgecolor='black',label='Wrocław',alpha=0.6)

nodes = ox.graph_from_place('Wrocław, Polska',network_type="drive_service")
pgraph=ox.project_graph(nodes)
node,dist = ox.nearest_nodes(pgraph, [17.00,], [51.15,],return_dist=True)
#print(node,dist)

gdf_nodes = ox.convert.graph_to_gdfs(
    nodes, nodes=True, edges=False, node_geometry=True,
    fill_edge_geometry=False)
#gdf_nodes.plot()
nearest_node = ox.distance.nearest_nodes(nodes,
                                         17.00, 51.15,
                                         return_dist=True)
#print(nearest_node)

#fig,ax=ox.plot_graph(node, node_color="red",show=False,bgcolor="white")
#city_area.plot(ax=ax,color='white',edgecolor='black',label='Wrocław',alpha=0.6)
orig= ox.nearest_nodes(nodes,  17.00, 51.15,return_dist=False)
dest= ox.nearest_nodes(nodes,  17.03, 51.18,return_dist=False)
route = ox.shortest_path(nodes, orig, dest, weight="length")
fig, ax = ox.plot_graph_route(nodes, route, route_color="y",bgcolor="white", route_linewidth=6, node_size=0)

plt.show()