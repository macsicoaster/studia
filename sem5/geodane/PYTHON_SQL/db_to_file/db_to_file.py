﻿#F3
#połączenie z bazą, wybór rekordów, zapis do pliku

import psycopg2

conn = psycopg2.connect(host='localhost', port='5432', dbname='adresy', user='postgres', password='abc')
cursor = conn.cursor()

#zapytanie
SQL="select * from PKT_ADRES;"

#plik wyjściowy
path='D:/data/output.txt'
txtfile=open(path, "w")
txtfile.write("ID punkty adresowego,  Adres, ID budynku \n")   

cursor.execute(SQL)
records=cursor.fetchall()

for record in records:
    lista=[str(record[0]),",", str(record[2]), ",", str(record [3]), "\n"]
    txtfile.writelines(lista)
     
txtfile.close()
cursor.close()
conn.close()
