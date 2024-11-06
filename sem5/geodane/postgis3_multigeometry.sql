//Utwórz tabele obiektów typu multipoint

create table multipunkty (id serial, name varchar, geom geometry(Multipoint, 2177));


//Wprowad obiekty typu multipoint
NR    X       Y, ... 
1  6433971.00  5663801.00, 6433975.00 5663806.00, 6433965.00 5663810.00
2  6433855.30  5663766.30, 6433859.30 5663769.30, 6433851.30 5663769.30
3  6433968.00  5663949.25, 6433960.00 5663940.25, 6433969.00 5663941.25, 6433965.00 5663943.25

insert into multipunkty(id,name,geom) values (1,'M100',ST_GeomFromText('MULTIPOINT ((6433971.00  5663801.00), (6433975.00 5663806.00), (6433965.00 5663810.00))',2177));
insert into multipunkty(id,name,geom) values (2,'M200',ST_GeomFromText('MULTIPOINT ((6433855.30  5663766.30), (6433859.30  5663769.30),(6433851.30  5663769.30))',2177));
insert into multipunkty(id,name,geom) values (3,'M300',ST_GeomFromText('MULTIPOINT ((6433968.00  5663949.25), (6433960.00  5663940.25),(6433969.00  5663941.25),(6433965.00  5663943.25))',2177));

//Utwórz tabele obiektów typu multilinestring
create table multilinie (id serial, name varchar, geom geometry(Multilinestring,2177));

//Wprowad obiekty typu multilinestring 
NR    X       Y, ... 
L1_1  6433990.00  5663801.00, 6433870.30  5663766.30 , 6433868.00  5663949.25
L1_2  6433980.00  5663811.00, 6433860.30  5663756.30 , 6433858.00  5663939.25

L2_1  6433968.00  5663949.25, 6433768.00  5663749.25, 6433868.00  5663849.25
L2_2  6433958.00  5663959.25, 6433758.00  5663759.25, 6433858.00  5663859.25

insert into multilinie(id,name,geom) values (1,'ML1',ST_GeomFromText('MULTILINESTRING((6433990.00 5663801.00, 6433870.30  5663766.30 , 6433868.00  5663949.25),(6433980.00  5663811.00, 6433860.30  5663756.30 , 6433858.00  5663939.25))',2177));
insert into multilinie(id,name,geom) values (2,'ML2',ST_GeomFromText('MULTILINESTRING((6433968.00 5663949.25, 6433768.00  5663749.25, 6433868.00  5663849.25),(6433958.00  5663959.25, 6433758.00  5663759.25, 6433858.00  5663859.25))',2177));

//Utwórz tabelê obiektów typu multipolygon
create table multipoligony (id serial, name varchar, geom geometry(Multipolygon,2177));

//Wprowad obiekty typu multipolygon
NR    X       Y, ... 
P1_1  6434042.00 5663859.00, 6434142.00 5663959.00, 6434142.00 5663859.00,6434042.00 5663859.00
P1_2  6434242.00 5664059.00, 6434342.00 5664159.00, 6434342.00 5664059.00,6434242.00 5664059.00

P2_1  6434242.00 5663859.00, 6434342.00 5663959.00, 6434342.00 5663859.00,6434242.00 5663859.00
P2_2  6434342.00 5663959.00, 6434442.00 5664059.00, 6434442.00 5663959.00,6434342.00 5663959.00

insert into multipoligony(id,name,geom) values (1,'MP1',ST_GeomFromText('MULTIPOLYGON(((6434042.00 5663859.00, 6434142.00 5663959.00, 6434142.00 5663859.00,6434042.00 5663859.00),
(6434242.00 5664059.00, 6434342.00 5664159.00, 6434342.00 5664059.00,6434242.00 5664059.00)))',2177));
insert into multipoligony(id,name,geom) values (2,'MP2',ST_GeomFromText('MULTIPOLYGON(((6434242.00 5663859.00, 6434342.00 5663959.00, 6434342.00 5663859.00,6434242.00 5663859.00),
(6434342.00 5663959.00, 6434442.00 5664059.00, 6434442.00 5663959.00,6434342.00 5663959.00)))',2177));


//Utwórz tabelê obiektów typu geometrycollection
create table kolekcjegeom (id serial, name varchar, geom geometry(Geometrycollection,2177));

//Wprowad obiekty typu geometrycollection
punkt P1 6434161.0  5663518.5
linia L1 6434171.0  5663528.5, 6434191.0  5663548.5, 6434196.0  5663558.5
poligon PL1 6434200.0  5663500.0,6434200.0  5663600.0, 6434300.0  5663600.0,6434300.0  5663500.0, 6434200.0  5663500.0 

insert into kolekcjegeom(id,name,geom) values (1,'CG1',ST_GeomFromText('GEOMETRYCOLLECTION(POINT(6434161.0  5663518.5),
LINESTRING(6434171.0  5663528.5, 6434191.0  5663548.5, 6434196.0  5663558.5),
POLYGON((6434200.0 5663500.0,6434200.0 5663600.0,6434300.0 5663600.0,6434300.0 5663500.0,6434200.0 5663500.0)))',2177));

select geom from multipoligony;
select (geom) from kolekcjegeom;

//OBLICZ CENTROIDY MULTIPUNKTÓW
select ST_AsText(ST_Centroid (a.geom)) as centroid
from multipunkty a;
select ST_Centroid (a.geom) geom
from multipunkty a;

//View
//Oblicz i zapisz centroidy - jako tekst

create view centrmpunkty as 
select ST_AsText(ST_Centroid (a.geom)) as centroid
from multipunkty a;

select * from centrmpunkty;

//Oblicz i zapisz centroidy - jako geometriê
create view centrmbpunkty as 
select ST_Centroid (a.geom) as geom
from multipunkty a;

select * from centrmbpunkty;

//Table- utworzenie i zapisanie w tabeli. Mo¿na wprowadzaæ do QGIS

create table centabpunkty as 
select ST_Centroid (a.geom) as geom
from multipunkty a;
select ST_AsText(geom) from centabpunkty;
select geom from centabpunkty;


create table centablinie as 
select ST_Centroid (a.geom) as geom
from multilinie a;
select ST_AsText(geom) from centablinie;
select geom from centablinie;

// ZADANIE oblicz koperty dla multipunktów
 i zapisz jako geometriê w tabeli

//Oblicz geometriê czêci wspólnej poligonów i multipoligonów

create table interpoligony as
select ST_Intersection (a.geom, b.geom) geom
from poligony a, multipoligony b;

select (geom) from interpoligony;

//ZADANIE DO WYKONANIA
//1. Przy u¿yciu funkcji ST_Buffer (https://postgis.net/docs/ST_Buffer.html) narysuj bufory multilinii.
//2. Oblicz czêæ wspóln¹ otrzymanych buforów z poligonem.

create table bufmultiline as
select ST_Buffer (a.geom,50) as geom
from multilinie a;
select ST_AsText(geom) as geom from bufmultiline;

create table interbufpolygon as
select ST_Intersection (a.geom, b.geom) as geom
from bufmultiline a, poligony b;
select ST_AsText(geom) from interbufpolygon;

--Zadania baza TBD
--Utwórz tabele zawieraj¹ce:
--1. identyfikatory budynków, powierzchniê budynków powy¿ej 5000m2.
--2. centroidy budynków. (2 pkt)
--3. odleg³oæ miêdzy budynkami o identyfikatorach: 63620,50181.
--4. odleg³oæ miêdzy budynkiem (id.63620) a centroidem dzielnicy.
--5. liczbê budynków w dzielnicach.
--6. bufory centroidów budynków o promieniu 50 m (w jednym poleceniu). 
--7. powierzchniê buforów centroidów budynków (w jednym poleceniu).

select bud.gid as idbud, ST_AREA(bud.geom) as pole
from budynki bud
where(ST_AREA(bud.geom))>5000;

select ST_AsText (ST_Centroid (bud.geom)), bud.gid
from budynki bud;

select ST_Distance (a.geom, b.geom) as odleglosc
from budynki a, budynki b 
where a.gid=63620 and b.gid=50181;

select ST_Distance (bud.geom, cent) as odleglosc
from budynki bud, 
(
select ST_Centroid(dza.geom) cent from gran_dzielnice dza
) as oblcent
where bud.gid=63620;

select count(bud.gid) bud_w_dzielnicy, dza.gid id_dza
from budynki bud, gran_dzielnice dza
where ST_Intersects(bud.geom, dza.geom)
group by dza.gid;

select ST_AsText(ST_Buffer(adr,50)) buff, ST_AsText(adr) centroid
from
(select ST_Centroid(bud.geom) adr from budynki bud
) as cent;

select ST_Area (buff) powierzchnia_buforu
from 
(select ST_Buffer(adr,50) buff from
(select ST_Centroid(bud.geom) adr from budynki bud) as cent) 
as area;

