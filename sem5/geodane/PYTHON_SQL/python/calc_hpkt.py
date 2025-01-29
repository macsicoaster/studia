#obliczenie wysokosci jako sredniej

import numpy as np
import math
import sys
import re
from pathlib import Path

import psycopg2

tabnmt='cent_200'
tabpkt='cbdhgis'
idnt='id'

#------------------polaczenie z baza
conn = psycopg2.connect(host='192.168.2.106', port='5432', dbname='WROC', user='postgres', password='postgres')

cursor = conn.cursor()
cursor1 = conn.cursor()
cursor2 = conn.cursor()
cursor3 = conn.cursor()
SQL="alter table "+tabpkt+" add column if not exists hn decimal(10,3); alter table "+tabpkt+" add column if not exists stdhn decimal(10,3);"
cursor.execute(SQL)
conn.commit()
cursor.close()

print("Polaczono z baza")
print("Obliczenia...")
#---------------------------------------

SQL1="SELECT * from "+ str(tabpkt)
#print (SQL1)
cursor1.execute(SQL1)
ODP1=cursor1.fetchall()
for row in ODP1:
   idn=row[0]
   geom=row[1]
   SQL2="SELECT ST_X(a.geom), ST_Y(a.geom),ST_Z(a.geom) FROM "+str(tabnmt)+" a\
   where ST_Intersects(ST_Transform(ST_Force2D(ST_Buffer('"+geom+"'::geometry,2)),2180),a.geom);"
   #print(SQL2)
   cursor2.execute(SQL2)
   ODP2=cursor2.fetchall()
   Z=np.array([])
   N=np.array([])
   E=np.array([])
   lp=np.array([])
   #DZNE=np.array([])
   licz=0
   for rownmt in ODP2:
       Z=np.append(Z,[float(rownmt[2])])
       N=np.append(N,[float(rownmt[1])])
       E=np.append(E,[float(rownmt[0])])
       licz=licz+1
       lp=np.append(lp,licz)
   zsum=np.sum(Z)
   nz=np.size(Z)
   if nz>1:
       RZ=range(0,nz-1)
       z_mean=zsum/nz
       vsumq=0
       for i in RZ:
           v=Z[i]-z_mean
           vsumq=vsumq+pow(v,2)
       std_z=np.sqrt(vsumq/(nz-1))
   else:
       z_mean=9999
       std_z=9999
          
   SQL3="update "+str(tabpkt)\
         +" set geom=ST_GeomFromText('POINTZ('||ST_X('"+geom+"'::geometry)||' '||ST_Y('"+geom+"'::geometry)||' '||"+str(z_mean)+"||')',2180)\
         ,hn="+str(z_mean)+",stdhn="+str(std_z)+" where "+ idnt+"="+str(idn)+";"
   #print(SQL3)
   cursor3.execute(SQL3)
   conn.commit()   


print("Obliczono")
#---------------zamkniecie polaczen
cursor.close()
cursor1.close()
cursor2.close()
cursor3.close()
conn.close()

