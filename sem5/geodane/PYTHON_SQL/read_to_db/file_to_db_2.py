#F2
#czytanie z pliku, połączenie z postgres, operacje na danych

import psycopg2

conn = psycopg2.connect(host='localhost', port='5432', dbname='adresy', user='postgres', password='abc')
cursor = conn.cursor()

SQL1="CREATE TABLE IF NOT EXISTS PKT_ADRES (id_pkta varchar(20) primary key,id_ula varchar(20), nr_adres varchar(20), \
id_bud varchar(20), px decimal(10,2),py decimal(10,2));"

cursor.execute(SQL1)

SQL2="DO \
$$ \
BEGIN \
\
IF EXISTS (SELECT id_pkta FROM PKT_ADRES WHERE id_pkta=%s)\
THEN RAISE NOTICE 'Punkt istnieje: '%s''; \
ELSE \
INSERT INTO PKT_ADRES(id_pkta,id_ula,nr_adres, id_bud, px, py) values (%s,%s,%s,%s,%s,%s);\
END IF;\
END;\
$$;"

path='C:/DYDAKTYKA/ARCHIWUM/PGIS1/LAB5/SQL/read_to_db/adresy.txt'
with open(path, "r") as txtfile:
     for linia in txtfile:
         #print (linia)
         pole=linia.split(",")
         DATA=(pole[0],pole[0],pole[0], pole[1],pole[2],pole[3],pole[4],pole[5],)
         cursor.execute(SQL2,DATA)
print(conn.notices)    
conn.commit()   
txtfile.close()

cursor.execute("SELECT * FROM PKT_ADRES;")
records = cursor.fetchall()
for record in records:
    print (record)
cursor.close()
conn.close()
