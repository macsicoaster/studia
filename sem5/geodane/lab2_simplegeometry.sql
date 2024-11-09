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
--2	6434255.016	5664041.298
CREATE TABLE punkty(
    id serial,
    name varchar,
    geom geometry(point, 2177)
);

INSERT INTO punkty(id, name, geom)
    VALUES (1, 'P100', ST_GeomFromText('POINT (6433813.916 5663660.531)', 2177));

INSERT INTO punkty(id, name, geom)
    VALUES (2, 'P200', ST_GeomFromText('POINT (6434255.016 5664041.298)', 2177));

SELECT
    *
FROM
    punkty;

SELECT
    ST_AsText(geom)
FROM
    punkty;

CREATE TABLE linie(
    id serial,
    name varchar,
    geom geometry(Linestring, 2177)
);

INSERT INTO linie(id, name, geom)
    VALUES (1, 'L1', ST_GeomFromText('Linestring 
(6433758.702 5663827.032,6433846.373 5664059.842)', 2177));

INSERT INTO linie(id, name, geom)
    VALUES (2, 'L2', ST_GeomFromText('Linestring 
(6434044.031 5663609.908,6434158.376 5663914.024)', 2177));

INSERT INTO linie(id, name, geom)
    VALUES (3, 'L3', ST_GeomFromText('Linestring 
(6434023.031 5663654.908,6434167.376 5663989.024,6434190.376 5663920.024)', 2177));

CREATE TABLE poligony(
    id serial,
    name varchar,
    geom geometry(polygon, 2177)
);

INSERT INTO poligony(id, name, geom)
    VALUES (1, 'P1', ST_GeomFromText('Polygon 
((6433785.635 5663774.051,6433882.132 5664049.148,6434131.856 5663927.521,6434013.753 5663617.605,6433785.635 5663774.051))', 2177));

SELECT
    *
FROM
    poligony;

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

--sprawdz czy linia l3 przecina sie z poligonem p1
select ST_Intersects(l.geom, p.geom) as przecina_sie
from linie l, poligony p
where l.name = 'L3' and p.name = 'P1';