import pandas as pd
import geopandas as gpd
from shapely.geometry import Point, LineString, Polygon
import fiona
from io import StringIO
import matplotlib.pyplot as plt
plt.style.use('bmh')


newdata = gpd.GeoDataFrame()
coordinate = [17.5000, 51.5000]
point_coord = Point(coordinate)
df = {'Place': ['WROCLAW'], 'geometry': [point_coord]}
point = gpd.GeoDataFrame(df, geometry='geometry', crs ="EPSG:4326")


#point.plot()
#plt.show()

df = pd.DataFrame(
    {'Miejscowość': ['Wrocław','Oława','Oleśnica','Trzebnica'],
     'Powiat': ['wrocławski','oławski','oleśnicki','trzebnicki'],
     'lat': [17.03274, 17.29031,17.38017,17.05695],
     'lon': [51.10982, 50.94508, 51.20947,51.30695]})

ply_coord = [Point(x, y) for x, y in zip(df.lon,df.lat)]
#print(list(zip(df.lat, df.lon)))
poly = gpd.GeoDataFrame(df, geometry=ply_coord, crs ="EPSG:4326")

#poly.plot()
#plt.show()

path_to_csv = r'points.csv'
points ={'Miejscowość': ['Wrocław','Oława','Oleśnica','Trzebnica'],
     'Powiat': ['wrocławski','oławski','oleśnicki','trzebnicki'],
     'lat': [17.03274, 17.29031,17.38017,17.05695],
     'lon': [51.10982, 50.94508, 51.20947,51.30695]}
points = pd.DataFrame.from_dict(points)
points.index.name='ID'
points.to_csv(path_to_csv)


df = pd.read_csv(path_to_csv)
points= gpd.GeoDataFrame(df, geometry=gpd.points_from_xy(x=df.lon, y=df.lat), crs = 'EPSG:4326')

#points_from_xy() is simply an enhanced wrapper for
#[Point(x, y) for x, y in zip(df.lon, df.lat)])

#print(points)
#points.plot()
#plt.show()

 
data = """
ID,X,Y,Speed
1,  17.03274,  51.10982,  6
1,  17.03474,  51.11082,  6
2,  17.02200,  51.09900,  5
2,  17.02300,  51.09800,  5
2,  17.02100,  51.09600,  5
3,  17.01100,  51.09900,  4
3,  17.01300,  51.09800,  4
3,  17.01500,  51.09500,  4
"""
# use StringIO to read in text chunk
df = pd.read_table(StringIO(data), sep=',')

pointsl = [Point(xy) for xy in zip(df.X, df.Y)]
#print(pointsl)
geo_df = gpd.GeoDataFrame(df, geometry=pointsl, crs = 'EPSG:4326')
#geo_df.plot()
#plt.show()

# treat each `ID` group of points as a line
lines = geo_df.groupby(['ID'])['geometry'].apply(lambda x:  LineString(x.tolist()))

# store as a GeodataFrame and add 'ID' as a column (currently stored as the 'index')
lines = gpd.GeoDataFrame(lines, geometry='geometry', crs="EPSG:4326") 
lines.reset_index(inplace=True)
#lines.plot(column='ID')
#plt.show()

########polygon
coordinates = [[17.01600,  51.09700], [17.02000,  51.09800], [17.02200,  51.09600],
               [17.01500,  51.09500]]           

# Create a Shapely polygon from the coordinate-tuple list
ply_coord = Polygon(coordinates)

# create a dictionary with needed attributes and required geometry column
df = {'ID': ['P1'], 'geometry': ply_coord}
#print (df)
polygons = gpd.GeoDataFrame(df, geometry='geometry', crs ="EPSG:4326")
#print (polygons)
#polygons.plot()
#plt.show()


# newgeodata = gpd.GeoDataFrame()
# newgeodata['geometry'] = None
# newgeodata.set_geometry('geometry')
# print(newgeodata)

# Coordinates of the W6

#dfc = pd.DataFrame({'x': [17.05336,17.05836,], 'y': [51.11452,51.11652]})
dfc = pd.DataFrame({'x': [17.0000,18.0000,], 'y': [51.0000,51.5000]})
print(dfc)
geom=gpd.GeoSeries.from_xy(dfc['x'],dfc['y'])
print(geom)
newgeodata = gpd.GeoDataFrame(geometry=geom,crs='EPSG:4326')
#print(newgeodata[0:1])

point_wkt=['POINT (17.05436 51.10452)']
geom=gpd.GeoSeries.from_wkt(point_wkt)
newgeodata.loc[2, 'geometry'] = geom[0]
newgeodata.loc[2, 'location'] = 'L-1 PWr'

print(newgeodata)

#plt.show()
print('Wykonano')