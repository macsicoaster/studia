import sys
import re
from pathlib import Path

import psycopg2
conn = psycopg2.connect(host='192.168.2.106', port='5432', dbname='DS', user='postgres', password='postgres')
cursor = conn.cursor()
#TWORZENIE TABELI
cursor.execute('CREATE EXTENSION IF NOT EXISTS POSTGIS;')
print("Polaczono")




#PARAMETRY
#uklad matematyczny
EPSG=2176
XP=5542500
YP=5666500
DXR=22000
DYR=18000
DX=10
DY=10

NX=DXR//DX
NY=DYR//DY

print(NX,NY)
RX=range(1,NX+1)
RY=range(1,NY+1)
#print(RX,RY)

TABNAME="iwiny_grd10"
SQL="CREATE TABLE IF NOT EXISTS "+TABNAME \
+"(IND bigserial,\
GEOM GEOMETRY(POLYGONZ,2176),\
PRIMARY KEY(IND));"

cursor.execute (SQL)
conn.commit()
print("Tabela gotowa")

for i in RX:
    for j in RY:
        X1=XP+(i-1)*DX
        Y1=YP+(j-1)*DY
        Z1=0
        X2=X1
        Y2=Y1+DY
        X3=X1+DX
        Y3=Y1+DY
        X4=X1+DX
        Y4=Y1
        #print(i,j,X1,Y1,X2,Y2,X3,Y3,X4,Y4)
        SQL="INSERT INTO "+TABNAME+"(GEOM) values (ST_GeomFromText('POLYGON Z(("\
             +str(X1)+" "+str(Y1)+" "+str(Z1)+","\
             +str(X2)+" "+str(Y2)+" "+str(Z1)+","\
             +str(X3)+" "+str(Y3)+" "+str(Z1)+","\
             +str(X4)+" "+str(Y4)+" "+str(Z1)+","\
             +str(X1)+" "+str(Y1)+" "+str(Z1)+"))',"+str(EPSG)+"));"
        #print(SQL)
        cursor.execute(SQL)
conn.commit()
cursor.close()
conn.close()
print("Wykonano")
