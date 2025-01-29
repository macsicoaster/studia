-- dodanie plikow asc do bazy
raster2pgsql -s 2180 -I -C -M 73679_1014208_M-33-35-C-a-3-4.asc public.nmtraster1 | psql -U postgres -d TBD_wroc
raster2pgsql -s 2180 -I -C -M 73679_1014207_M-33-35-C-a-3-3.asc public.nmtraster2 | psql -U postgres -d TBD_wroc

-- wczytanie granic dzielnic
shp2pgsql -s 2180 -I -W UTF-8 GraniceOsiedli.shp public.osiedla | psql -U postgres -d TBD_wroc

SELECT r.rid, r.rast
FROM nmtraster1 r
JOIN osiedla o ON ST_Intersects(r.rast::geometry, o.geom)
WHERE o.nazwaosied = 'Huby';

SELECT r.rid, r.rast
FROM nmtraster2 r
JOIN osiedla o ON ST_Intersects(r.rast::geometry, o.geom)
WHERE o.nazwaosied = 'Huby';

CREATE TABLE huby_raster AS
SELECT ST_Union(ST_Clip(r.rast, o.geom)) AS rast
FROM nmtraster1 r
JOIN osiedla o ON ST_Intersects(r.rast::geometry, o.geom)
WHERE o.nazwaosied = 'Huby';

INSERT INTO huby_raster(rast)
SELECT ST_Union(ST_Clip(r.rast, o.geom)) AS rast
FROM nmtraster2 r
JOIN osiedla o ON ST_Intersects(r.rast::geometry, o.geom)
WHERE o.nazwaosied = 'Huby';

CREATE TABLE huby_final_raster AS
SELECT ST_Union(rast) AS rast
FROM huby_raster;

