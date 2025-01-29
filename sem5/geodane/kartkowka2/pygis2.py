import pandas as pd
import geopandas as gpd
from shapely.geometry import Point, LineString, Polygon
#import fiona
from io import StringIO
import matplotlib.pyplot as plt
plt.style.use('bmh')
import psycopg2
from sqlalchemy import create_engine 

con = create_engine("postgresql+psycopg2://postgres:abc@localhost/postgres")
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
df = pd.read_table(StringIO(data), sep=',')
pointsl = [Point(xy) for xy in zip(df.X, df.Y)]
geo_df = gpd.GeoDataFrame(df, geometry=pointsl, crs = 'EPSG:4326')
lines = geo_df.groupby(['ID'])['geometry'].apply(lambda x:  LineString(x.tolist()))
lines = gpd.GeoDataFrame(lines, geometry='geometry', crs="EPSG:4326") 
lines.reset_index(inplace=True)
lines.to_postgis('linie_python',con)



sql='select * from budynki'
#budynki=gpd.GeoDataFrame.from_postgis(sql,con,geom_col='geom')
#print (budynki)
#budynki.plot()
#plt.show()