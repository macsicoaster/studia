import sys
import re
from pathlib import Path

import psycopg2
conn = psycopg2.connect(host='192.168.2.106', port='5432', dbname='WROC', user='postgres', password='postgres')
cursor = conn.cursor()
#TWORZENIE TABELI
#cursor.execute('CREATE EXTENSION IF NOT EXISTS POSTGIS;')
print("Polaczono")

cursor.execute (\
'CREATE TABLE IF NOT EXISTS NMT1M(\
IND bigserial,\
GEOM GEOMETRY(POINTZ,2180),\
PRIMARY KEY(IND));')

conn.commit()
print("Tabela gotowa")

#cursor.execute('DELETE FROM NMT1M where IND is not NULL')
#wprowadzenie danych

pathxyz='/media/piotr/PG5GB/CODGIK_zam_253/NMT_XYZ'
listfile='/media/piotr/WORK/WROC/TXT/arkusze_wroc_list'
with open(listfile,"r") as lfiles:
    for lf in lfiles:
        fn=lf.split()
        filename=pathxyz+'/'+fn[0]+'.xyz'
        print(filename)
        try:
            with open(str(filename), "r") as xyzfile:
                for linia in xyzfile:
                    zv=linia.split()
                    XP=(zv[0])
                    YP=(zv[1])
                    H=(zv[2])
                    SQL="INSERT INTO NMT1M(GEOM) values (ST_GeomFromText('POINT Z("+str(XP)+" "+str(YP)+" "+str(H)+")',2180));"
                    #print (SQL)
                    #DATA=(NR,XP,YP,H)
                    cursor.execute(SQL)
            conn.commit()
        except:
            print('Brak pliku')


#pathxyz='/media/piotr/PG5GB/CODGIK_zam_253/NMT_XYZ'
#for filename in Path(pathxyz).glob('*.xyz'):
#    print(filename)
#   with open(str(filename), "r") as xyzfile:
#        for linia in xyzfile:
#            zv=linia.split()
#	    XP=(zv[0])
#            YP=(zv[1])
#            H=(zv[2])
#            SQL="INSERT INTO NMT1M(GEOM) values (ST_GeomFromText('POINT Z("+str(XP)+" "+str(YP)+" "+str(H)+")',2180));"
            #print (SQL)
            #DATA=(NR,XP,YP,H)
#            cursor.execute(SQL)
#    conn.commit()
            
                                        
#xyzfile.close()
#cursor.execute("SELECT * FROM NMT1M;")
#records = cursor.fetchall()
#for record in records:
#print (record)
#print(conn.notices)

#cursor.execute (\
#'CREATE INDEX IF NOT EXISTS is_nmt1m\
#  ON public.nmt1m\
#  USING gist\
#  (geom);')
#conn.commit()
#cursor.close()
#conn.close()
print ("Wykonano")
        


