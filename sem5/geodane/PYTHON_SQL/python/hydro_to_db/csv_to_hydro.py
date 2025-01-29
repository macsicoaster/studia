import sys
import re
from pathlib import Path
import psycopg2
from psycopg2 import sql

conn = psycopg2.connect(host='192.168.2.106', port='5432', dbname='DS', user='postgres', password='postgres')
cursor = conn.cursor()
print("Polaczono")


#TWORZENIE TABELI
cursor.execute('CREATE EXTENSION IF NOT EXISTS POSTGIS;')

#cursor.execute (\
#'CREATE TABLE IF NOT EXISTS OBJ_UJ_PT(\
#IND bigserial,\
#GEOM GEOMETRY(POINTZ,2180),\
#NR_UJ BIGINT,\
#OTW_ID BIGINT,\
#NR_RBDH BIGINT,\
#OB_ID BIGINT,\
#);')

cursor.execute (\
'CREATE TABLE IF NOT EXISTS PRO_GEO(\
IND SERIAL PRIMARY KEY,\
NR_UJ BIGINT,\
NR_RBDH BIGINT,\
NA_UJ VARCHAR(200),\
NA_OBJ VARCHAR(200),\
PL_OBJ VARCHAR(200),\
STRA_OD NUMERIC(8,2),\
STRA_DO NUMERIC(8,2),\
OKRS VARCHAR(100),\
EPOK VARCHAR(100),\
LITA_OD NUMERIC(8,2),\
LITA_DO NUMERIC(8,2),\
SKLA VARCHAR(100),\
UZRE VARCHAR(100),\
DOKI VARCHAR(100),\
PREP VARCHAR(100)\
);')

conn.commit()
print("Tabela przygotowana")

licz=0
#wprowadzenie danych

SQL="INSERT INTO PRO_GEO (NR_UJ,NR_RBDH,NA_UJ,NA_OBJ,PL_OBJ,STRA_OD,STRA_DO,OKRS,EPOK,LITA_OD,LITA_DO,SKLA,UZRE,DOKI,PREP) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"

#podaj sciezke do pliku
path='W:/hydro_2020/CBDH_3002ob/RaportProfilGeologiczny.csv'
with open(path, "r") as prgeofile:
    for linia in prgeofile:
        atrs=linia.split(',')
        licz=licz+1
        if licz>1:
            atrs=linia.split(',')
            nr_uj=int(atrs[0])
            nr_rbdh=int(atrs[2])
            na_uj=str(atrs[1])
            na_obj=str(atrs[3])
            pl_obj=str(atrs[4])
            stra_od=float(atrs[13])
            stra_do=float(atrs[14])
            okrs=str(atrs[15])
            epok=str(atrs[16])
            lita_od=float(atrs[17])
            lita_do=float(atrs[18])
            skla=str(atrs[19])
            uzre=str(atrs[20])
            doki=str(atrs[21])
            prep=str(atrs[22])
            DATA=[nr_uj,nr_rbdh,na_uj,na_obj,pl_obj,stra_od,stra_do,okrs,epok,lita_od,lita_do,skla,uzre,doki,prep,]
            cursor.execute(SQL,DATA)
        
            #print(SQL,DATA)
            #cursor.execute(sql.SQL("INSERT INTO {} VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")\
            #.format(sql.Identifier('pro_geo.')), DATA)
conn.commit()
conn.close()
prgeofile.close()
print ("Wykonano")
        
        
        
