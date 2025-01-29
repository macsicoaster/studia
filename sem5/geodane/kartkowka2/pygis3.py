import pandas
import geopandas
import pathlib
import fiona
import pyogrio
import matplotlib.pyplot as plt
plt.style.use('bmh')


path_dz='C:/DYDAKTYKA/2023_24/lato/PYTHON/tbd/dzielnice.shp'
path_objdz = pathlib.Path(path_dz)
df_dz = geopandas.read_file(path_objdz)

path_bud='C:/DYDAKTYKA/2023_24/lato/PYTHON/tbd/budynki.shp'
path_objbud = pathlib.Path(path_bud)
df_bud = geopandas.read_file(path_objbud,engine="pyogrio")

#df_dz.plot()
#df_bud.plot()
#base=df_dz.plot(color='white', edgecolor='black')
#df_bud.plot(ax=base,color='grey',edgecolor='blue')


#print(df_bud.columns)
#print(df_bud.head(3))
#df_bud.head(3).to_csv('kolumny.txt')

#print(df_bud.loc[2:4])
#print(df_bud.loc[(df_bud.liczbakond>17) & (df_bud.zabytek==1)])
#print(df_bud.iloc[[1,3,9]])
#print(df_bud.iloc[2:4])
#print(df_bud.iloc[0:3,0:4])

df_bud_sel=df_bud.iloc[0:10]
df_bud_sel.plot()
df_bud_sel.to_file('budynki')

#df_bud_sel=df_bud.cx[361500:364000,363000:365000]
#df_bud_sel.plot()

#df_bud_sel= df_bud.iloc[2:4]
#df_bud_sel.plot(color='blue')

#buf=df_bud_sel.buffer(distance=10,resolution=3, \
#                      join_style='round')
#bb=buf.plot()
#df_bud_sel.plot(ax=bb, color='red')

#df_centroid=df_bud_sel.centroid
#df_centroid.plot(ax=df_bud_sel.plot(color='blue'), color='red')

#print(df_centroid.iloc[0].distance(df_centroid.iloc[1]))
#print(df_bud_sel.length)
#print(df_bud_sel.area)
#print(df_dz)
dz=df_dz.loc[(df_dz.gid==3)]
bud_sel=geopandas.sjoin(df_bud,dz,how='inner',predicate='intersects')
bud_sel.set_geometry(col='geometry',inplace=True)

#print(bud_sel.info())
#base=dz.plot(color='white', edgecolor='black')
#bud_sel.plot(ax=base,color='red')

#fig,ax=plt.subplots()
#dz.plot(ax=ax,color='white', edgecolor='black')
#bud_sel.plot(ax=ax,color='red')

#bud=bud_sel.loc[4:6]
#print(bud.geometry)
#gdf1=geopandas.GeoDataFrame()
#for b in bud.geometry:
    #gdf2=geopandas.GeoDataFrame(b.intersection(dz.geometry))
    #gdf1=pandas.concat([gdf1,gdf2])
#gdf1.reset_index(inplace=True)
#gdf1.index.name='idx'
#gdf1.drop('index',axis='columns',inplace=True)
#print (gdf1)
#fig,ax=plt.subplots()
#dz.plot(ax=ax,color='white', edgecolor='black')
#gdf1.plot(ax=ax,color='red')

#for b in bud.geometry:
    #print(b.intersects(dz.geometry))
    
#bud_simpli=bud_sel.simplify (tolerance=5)
#fig,ax=plt.subplots()
#dz.plot(ax=ax,color='white', edgecolor='black')
#df_bud.plot(ax=ax, color='green')
#bud_simpli.plot(ax=ax,color='red')

bud_buf=bud_sel.buffer(distance=15,resolution=15, \
                      join_style='round')
bud_union=bud_buf.unary_union
#dz_holes=dz['geometry'].difference(bud_union)
#print(dz_holes)

bud_insec=dz['geometry'].intersection(bud_union)
print(bud_insec)

fig,ax=plt.subplots()
#dz.plot(ax=ax,color='white', edgecolor='black')
#bud_buf.plot(ax=ax)
#dz_holes.plot(ax=ax,color='yellow')
bud_insec.plot(ax=ax,color='blue')
plt.show()
