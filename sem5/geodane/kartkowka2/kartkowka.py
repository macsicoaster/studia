#Napisz skrypt w języku Python, który:
#Połączy się do bazy TBD_wroc
#Wykona w niej kwerendę, która zwróci budynki (kolumny: gid, liczbakond, zabytek), dla których wartość w kolumnie x_zrodloda = Ort. Ogranicz liczbę wyników do 20.
#Pokaż wynik kwerendy w konsoli.

import psycopg2

conn = psycopg2.connect(host='localhost', port='5432', dbname='TBD_wroc', user='postgres', password='postgres')
cursor = conn.cursor()

cursor.execute('''
select gid, liczbakond, zabytek from budynki where x_zrodloda = 'Ort' limit 20;
               ''')

wynik = cursor.fetchall()
for i in range(20):
    print(wynik[i])

cursor.close()
conn.close()