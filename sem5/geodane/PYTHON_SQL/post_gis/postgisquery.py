#ustawienia
import psycopg2

conn = psycopg2.connect(host='localhost', port='5432', dbname='tbd', user='postgres', password='abc')
cursor = conn.cursor()

SQL="select ST_AsText(ST_Centroid(bud.geom)) from budynki bud where gid<3"

cursor.execute(SQL)
records=cursor.fetchall()
for record in records:
    print (records)
