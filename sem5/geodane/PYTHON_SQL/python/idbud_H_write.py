#połączenie z bazą, wybór rekordów, zapis do pliku

#obliczenie średniej wysokości terenu przy budynkach (w promieniu 100 m od wybranego punktu X,Y)
#oraz zapis do pliku tekstowego ich identyfikatorów oraz średnich wysokości

import psycopg2

conn = psycopg2.connect(host='localhost', port='5432', dbname='projekt', user='postgres', password='abc')
cursor = conn.cursor()

#zapytanie
SQL="select idbud, avg(h_grd) h_T  from \
(select grd.z_mean h_grd, bud.gid idbud from grd_200m grd, budynki bud \
where ST_Intersects(bud.geom,grd.geom) \
and ST_Intersects(ST_Buffer(ST_GeomFromText('POINT(6436934 5663931)',2177),100),bud.geom)) as bud_grd \
group by idbud;"

#plik wyjściowy
path='D:\DYDAKTYKA\WYKŁADY\kolokwium\idbud_h_T.txt'
txtfile=open(path, "w")
txtfile.write("ID_budynku, Srednia wysokość terenu H \n")   

cursor.execute(SQL)
records=cursor.fetchall()

for record in records:
    lista=[str(record[0]),",", str(record[1]), "\n"]
    txtfile.writelines(lista)
     
txtfile.close()
cursor.close()
conn.close()
print("Wykonano")
