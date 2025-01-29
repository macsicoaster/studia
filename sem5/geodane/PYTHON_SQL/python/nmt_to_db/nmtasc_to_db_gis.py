#czytanie pliku asc
#układ2000/6 2177

import psycopg2
conn = psycopg2.connect(host='localhost', port='5432', dbname='NMT', user='postgres', password='abc')
cursor = conn.cursor()

#TWORZENIE TABELI
cursor.execute('CREATE EXTENSION IF NOT EXISTS POSTGIS;')

cursor.execute (\
'CREATE TABLE IF NOT EXISTS NMT1M(\
IND VARCHAR (20) PRIMARY KEY,\
GEOM GEOMETRY(POINTZ,0));')


#wprowadzenie danych
SQL=" INSERT INTO NMT1M(IND,GEOM)\
 values (%s,ST_GeomFromText('POINT Z (%s %s %s)',0));"

path='D:/GEOD_INFO/PYTHON/NMT/nmt_to_db/M-33-35-C-a-4-3.asc'
licz=0
with open(path, "r") as ascfile:
    for linia in ascfile:
        licz=licz+1
        if licz==1:
            pole=linia.split()
            ncols=int(pole[1])
            print(pole[0],":",str(ncols))
        elif licz==2:
            pole=linia.split()
            nrows=int(pole[1])
            print(pole[0],":",str(nrows))
        elif licz==3:
            pole=linia.split()
            xllcenter=float(pole[1])
            print(pole[0],":",str(xllcenter))
        elif licz==4:
            pole=linia.split()
            yllcenter=float(pole[1])
            print(pole[0],":",str(yllcenter))
        elif licz==5:
            pole=linia.split()
            cellsize=float(pole[1])
            print(pole[0],":",str(cellsize))
        elif licz==6:
            pole=linia.split()
            nodatav=float(pole[1])
            print(pole[0],":",str(nodatav))
        else:
            ir=licz-7
            ic=0
            NR=1
            pole=linia.split()
            nc=len(pole)
            for zv in pole:
                if float(zv)!=nodatav:
                    XP=xllcenter+ic*cellsize
                    YP=yllcenter+ir*cellsize
                    H=float(zv)
                    ic=ic+1
                    NR=str(ic+nc*ir)
                    #print (zv)
                    #print (NR,XP,YP,H)
                    DATA=(NR,XP,YP,H)
                    cursor.execute(SQL,DATA)
                                        
ascfile.close()
#cursor.execute("SELECT * FROM NMT1M;")
#records = cursor.fetchall()
#for record in records:
#    print (record)
#print(conn.notices)

conn.commit()
cursor.close()
conn.close()

        


