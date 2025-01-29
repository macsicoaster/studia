import sys
import re
from pathlib import Path

import psycopg2
conn = psycopg2.connect(host='localhost', port='5432', dbname='DS', user='postgres', password='postgres')
cursor = conn.cursor()
#TWORZENIE TABELI
#cursor.execute('CREATE EXTENSION IF NOT EXISTS POSTGIS;')
print("Polaczono")

cursor.execute (\
'CREATE TABLE IF NOT EXISTS NMPT1M(\
IND bigserial,\
GEOM GEOMETRY(POINTZ,2180),\
PRIMARY KEY(IND));')

conn.commit()
print("Tabela gotowa")

#cursor.execute('DELETE FROM NMPT1M where IND is not NULL')
#wprowadzenie danych

pathxyz='/media/piotr/PG5GB/CODGIK_zam_253/NMPT_XYZ'
for filename in Path(pathxyz).glob('*.xyz'):
    print(filename)
    with open(str(filename), "r") as xyzfile:
        for linia in xyzfile:
            zv=linia.split()
	    XP=(zv[0])
            YP=(zv[1])
            H=(zv[2])
            SQL="INSERT INTO NMPT1M(GEOM) values (ST_GeomFromText('POINT Z("+str(XP)+" "+str(YP)+" "+str(H)+")',2180));"
            #print (SQL)
            #DATA=(NR,XP,YP,H)
            cursor.execute(SQL)
    conn.commit()
            
                                        
xyzfile.close()
#cursor.execute("SELECT * FROM NMT1M;")
#records = cursor.fetchall()
#for record in records:
#print (record)
#print(conn.notices)

cursor.execute (\
'CREATE INDEX IF NOT EXISTS is_nmpt1m\
  ON public.nmpt1m\
  USING gist\
  (geom);')
conn.commit()
cursor.close()
conn.close()
print ("Wykonano")
        


