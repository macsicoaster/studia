/*CREATE EXTENSION postgis;
CREATE EXTENSION postgis_sfcgal;
CREATE EXTENSION postgis_raster;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION address_standardizer;
CREATE EXTENSION address_standardizer_data_us;
CREATE EXTENSION postgis_tiger_geocoder;
CREATE EXTENSION postgis_topology;
--UK£AD_2000 EPSG 2177
--POLIGON
--Y		X
--6433785.635	5663774.051
--6433882.132	5664049.148
--6434131.856	5663927.521
--6434013.753	5663617.605

--LINIE
--NR	Y		X
--1_1	6433758.702	5663827.032
--1_2	6433846.373	5664059.842
--2_1	6434044.031	5663609.908
--2_2	6434158.376	5663914.024

--PUNKTY
--NR     Y	X
--1	6433813.916	5663660.531
--2	6434255.016	5664041.298*/

create table punkty (id serial, name varchar, geom geometry(Point, 2177));
insert into punkty(id,name,geom) values (1,'P100',ST_GeomFromText('POINT (6433813.916 5663660.531)',2177));
insert into punkty(id,name,geom) values (2,'P200',ST_GeomFromText('POINT (6434255.016 5664041.298)',2177));
select * from punkty;
select ST_AsText(geom) from punkty;

create table linie (id serial, name varchar, geom geometry(Linestring,2177));
insert into linie (id,name,geom) values (1,'L1',ST_GeomFromText('Linestring 
(6433758.702 5663827.032,6433846.373 5664059.842)',2177));
insert into linie (id,name,geom) values (2,'L2',ST_GeomFromText('Linestring 
(6434044.031 5663609.908,6434158.376 5663914.024)',2177));
insert into linie (id,name,geom) values (3,'L3',ST_GeomFromText('Linestring 
(6434023.031 5663654.908,6434167.376 5663989.024,6434190.376 5663920.024)',2177));

create table poligony (id serial, name varchar, geom geometry(Polygon,2177));
insert into poligony (id,name,geom) values (1,'P1',ST_GeomFromText('Polygon 
((6433785.635 5663774.051,6433882.132 5664049.148,6434131.856 5663927.521,6434013.753 5663617.605,6433785.635 5663774.051))',2177));
select * from poligony;

select ST_Distance(a.geom,b.geom) as odleglosc
from punkty a, punkty b
where a.name='P100' and b.name='P200';

select ST_Distance(a.geom,b.geom) as odleglosc
from punkty a, linie b
where a.name='P100' and b.name='L1';

select ST_AsText(ST_PointN(l.geom,2)) as punktN
from linie l;

select ST_Area(a.geom) as pole
from poligony a;

select ST_Centroid (a.geom) as centroid
from poligony a;

select ST_AsText (ST_Centroid (a.geom)) as centroid
from poligony a;

select ST_AsText(ST_Envelope(a.geom)) as koperta
from linie a
where name='L1';
select ST_Envelope(a.geom) as koperta
from linie a
where name='L1';

select ST_IsSimple (p.geom) as stan
from poligony p;

select ST_AsText(ST_Transform(p.geom,4326)) as wspolrzedne
from punkty p;
