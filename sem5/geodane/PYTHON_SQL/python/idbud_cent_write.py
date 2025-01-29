#połączenie z bazą, wybór rekordów, zapis do pliku

#obliczenie centroidów budynków (w promieniu 100 m od wybranego punktu X,Y)
#oraz zapis do pliku tekstowego ich współrzędnych oraz identyfikatorów

import psycopg2

conn = psycopg2.connect(host='localhost', port='5432', dbname='projekt', user='postgres', password='abc')
cursor = conn.cursor()

#zapytanie
SQL="select idbud, ST_X(cbud) centroidX, ST_Y(cbud) centroidY  from \
(select bud.gid idbud, ST_Centroid(bud.geom) cbud from budynki bud \
where ST_Intersects(ST_Buffer(ST_GeomFromText('POINT(6436934 5663931)',2177),100),ST_Centroid(bud.geom))) as centbud;"

#plik wyjściowy
path='D:\DYDAKTYKA\WYKŁADY\kolokwium\cent_idbud.txt'
txtfile=open(path, "w")
txtfile.write("ID_budynku, Centroid_X,  Centroid_Y \n")   

cursor.execute(SQL)
records=cursor.fetchall()

for record in records:
    lista=[str(record[0]),",", str(record[1]), ",", str(record [2]), "\n"]
    txtfile.writelines(lista)
     
txtfile.close()
cursor.close()
conn.close()
print("Wykonano")
