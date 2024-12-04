create extension postgis;
create extension postgis_raster;

--raster2pgsql -s 2180 -I -C -M C:\DYDAKTYKA\ARCHIWUM\PGIS2\LAB1\34-B-D-4\34-B-D-4.tif -t auto -F public.toporast> C:\DYDAKTYKA\ARCHIWUM\PGIS2\LAB1\34-B-D-4\topo.sql
--psql -q -f C:\DYDAKTYKA\ARCHIWUM\PGIS2\LAB1\34-B-D-4\topo.sql -h localhost -p 5432 -W -d proj_ras -U postgres

--raster2pgsql -s 2180 -I -C -M D:\DATA_RAS\34-B-D-4.tif -t auto -F public.toporast> D:\DATA_RAS\topo.sql
--psql -q -f D:\DATA_RAS\topo.sql -h localhost -p 5432 -W -d projekt -U postgres

--rid, tiles, pixels
select * from toporast a;

--ST_NumBands - returns the number of bands in the raster object - liczba kanałów rastra
select ST_NumBands(a.rast) from toporast a;
--rid -id identifier of tile - zapytanie tylko o fragment według identyfikatora rid
select ST_NumBands(a.rast) from toporast a where rid=100;

--ST_SRID- zapytanie o identyfikator układu współrzędnych
select ST_SRID(a.rast) from toporast a;

--ST_Width, ST_Height - tiles dimensions in pixels - wymiary tafli w pikselach
select ST_Width(a.rast) from toporast a;
select ST_Height(a.rast) from toporast a;

--ST_PixelWidth, ST_PixelsHeight -- width, height of a pixel in geometric units of the spatial reference system
--wymiary piksela w jednostkach geometrycznych układu współrzędnych w kierunkach wersorów i,j
select ST_PixelWidth(a.rast) from toporast a;
select ST_PixelHeight(a.rast) from toporast a;

--ST_Scale - X pixel width, Y pixel height - pixel width in units of coordinate reference system 
--wymiary w jednostkach układu współrzędnych
select ST_ScaleX(a.rast) from toporast a;
select ST_ScaleY(a.rast) from toporast a;

--ST_Skew - rotation
--https://en.wikipedia.org/wiki/World_file
select ST_SkewX(a.rast) from toporast a;
select ST_SkewY(a.rast) from toporast a;

--ST_UpperLeftX,Y - Returns the upper left X,Y coordinate of raster in projected spatial ref.
--współrzędne x,y górnego lewego narożnika
select ST_UpperLeftX(a.rast) from toporast a;
select ST_UpperLeftY(a.rast) from toporast a;

--Returns name describing data type and size of values stored in each cell of given band
--Typ piksela dla podanego kanału 
select ST_BandPixelType(a.rast,1) from toporast a;
--1BB - 1-bit boolean (0 or 1)
--2BUI - 2-bit unsigned integer
--4BUI - 4-bit unsigned integer
--8BSI - 8-bit signed integer
--8BUI - 8-bit unsigned integer
--16BSI - 16-bit signed integer
--16BUI - 16-bit unsigned integer
--32BSI - 32-bit signed integer
--32BUI - 32-bit unsigned integer
--32BF - 32-bit float
--64BF - 64-bit float

--ST_Value - Returns the value of a given band in a given columnx, rowy pixel or at a given geometry point
--double precision ST_Value(raster rast, geometry pt, boolean exclude_nodata_value=true);
--double precision ST_Value(raster rast, integer band, geometry pt, boolean exclude_nodata_value=true);
--double precision ST_Value(raster rast, integer x, integer y, boolean exclude_nodata_value=true);
--double precision ST_Value(raster rast, integer band, integer x, integer y, boolean exclude_nodata_value=true);
select ST_Value(a.rast,1,277,273,true) from toporast a;
select ST_Value(a.rast,1,ST_GeomFromText('POINT (354700 373600)',2180),true) from toporast a;

--ST_BandNodataValue-returns the value that represents no data for the band
select ST_BandNodataValue(a.rast) from toporast a;
--select ST_BandNodataValue(a.rast) is not null from toporast a;

--ST_BandPath-returns system file path to a band stored in file system
select ST_BandPath(a.rast,1) from toporast a;

--ST_Histogram
select ST_Histogram(a.rast,1,5) from toporast a;
--Przykład z dokumentacji technicznej
SELECT band, (stats).*
FROM (SELECT rid, band, ST_Histogram(rast, band, 5) As stats
    FROM toporast CROSS JOIN generate_series(1,1) As band
     WHERE rid=1) As foo;

--ST_Rotation - returns the uniform rotation of the raster in radian
select ST_Rotation(a.rast) from toporast a;

--ST_MetaData - 
--upperleftx,upperlefty,width,height,scalex,scaley,skewx,skewy,srid,numbands
select ST_MetaData(a.rast) from toporast a;



-------------------------------------------------------SRTM-------------------------------
--gdalinfo D:\DATA_RAS\srtm_40_02.tif
--raster2pgsql -s 4326 -I -C -M C:\DYDAKTYKA\ARCHIWUM\PGIS2\LAB1\srtm_40_02\srtm_40_02.tif -t auto -F public.SRTM>C:\DYDAKTYKA\ARCHIWUM\PGIS2\LAB1\srtm_40_02\SRTM.sql
--psql -q -f C:\DYDAKTYKA\ARCHIWUM\PGIS2\LAB1\srtm_40_02\SRTM.sql -h localhost -d projekt -U postgres

--raster2pgsql -s 4326 -I -C -M D:\DATA_RAS\srtm_40_02.tif -t auto -F public.SRTM>D:\DATA_RAS\SRTM.sql
--psql -q -f D:\DATA_RAS\SRTM.sql -h localhost -d projekt -U postgres


select ST_MetaData(a.rast) from srtm a;
select ST_NumBands(a.rast) from srtm a;
select ST_SRID(a.rast) from srtm a;

select ST_Width(a.rast) from srtm a;
select ST_Height(a.rast) from srtm a;
select ST_BandPixelType(a.rast,1) from srtm a;
--1BB - 1-bit boolean (0 or 1)
--2BUI - 2-bit unsigned integer
--4BUI - 4-bit unsigned integer
--8BSI - 8-bit signed integer
--8BUI - 8-bit unsigned integer
--16BSI - 16-bit signed integer
--16BUI - 16-bit unsigned integer
--32BSI - 32-bit signed integer
--32BUI - 32-bit unsigned integer
--32BF - 32-bit float
--64BF - 64-bit float

select ST_PixelWidth(a.rast) from srtm a;
select ST_PixelHeight(a.rast) from srtm a;
select ST_ScaleX(a.rast) from srtm a;
select ST_ScaleY(a.rast) from srtm a;
select ST_SkewX(a.rast) from srtm a;
select ST_SkewY(a.rast) from srtm a;



select a.rid,ST_Value(a.rast,1,ST_GeomFromText('POINT (16.92818 51.17180)',4326),false) from srtm a where rid=286;
SELECT ST_AsText(geom),x, y,val from (select (ST_PixelAsPoints(a.rast, 1,true)).* from srtm a where rid=100) as q1 order by x;

SELECT ST_Aspect(a.rast,1,'16BSI','DEGREES',false) from srtm a where rid=113;

SELECT ST_DumpValues(ST_Aspect(a.rast,1,'16BSI','DEGREES',false)) from srtm a where rid=100;

--raster ST_Slope(raster rast, integer nband=1, text pixeltype=32BF, text units=DEGREES, double precision scale=1.0, boolean interpolate_nodata=FALSE);
--raster ST_Slope(raster rast, integer nband, raster customextent, text pixeltype=32BF, text units=DEGREES, double precision scale=1.0, boolean interpolate_nodata=FALSE);
--scale is the ratio of vertical units to horizontal. For Feet:LatLon use scale=370400, for Meters:LatLon use scale=111120. 
SELECT ST_Slope(a.rast,1,'16BSI','DEGREES',1,false) from srtm a  where rid=100;
SELECT ST_DumpValues(ST_Slope(a.rast,1,'32BF','PERCENT',111120,true)) from srtm a where rid=1;
SELECT ST_DumpValues(ST_Slope(a.rast,1,'32BF','DEGREES',111120,true)) from srtm a where rid=1;



SELECT ST_AsBinary(a.rast) from srtm a  where rid=100;

--Returns the number of pixels in a given band of a raster or raster coverage
--bigint ST_Count(raster rast, integer nband=1, boolean exclude_nodata_value=true/false)
SELECT ST_Count (a.rast,1,true) from srtm a where rid=100;
SELECT ST_Count (a.rast,1,false) from srtm a where rid=100;

--Returns the number of pixels in a given band of a set of rasters
--bigint ST_CountAgg(raster rast, integer nband, boolean exclude_nodata_value);
SELECT ST_CountAgg (a.rast,1,false) from srtm a;

Select band,(stats).*
from (Select rid,band, ST_Histogram(rast,band,15) As stats
 from srtm CROSS JOIN generate_series(1,3) As band
  where rid=100) as hist

--%%%%%%%%%%%%%%%%%%%%%%%%%%
create table tilegeom (id serial, geom geometry(Polygon,4326));
insert into tilegeom (id,geom) select srtm.rid, ST_Envelope(srtm.rast) from srtm;
--%%%%%%%%%%%%%%%%%%%%%%%%%%%

CREATE TABLE public.partsrtm(
rid SERIAL primary key, rast raster);
select UpdateRasterSRID('partsrtm','rast',4326);

--tworzenie pustego rastra
--INSERT INTO partsrtm(rid,rast)
--SELECT srtm.rid, ST_MakeEmptyRaster(rast) from srtm where rid=286 or rid=287;

--kopiowanie fragmentów rastra
INSERT INTO partsrtm (rid,rast)
SELECT rid, rast from srtm where rid=286 or rid=287;
CREATE INDEX partsrtm_gist_idx
ON partsrtm
USING GIST(ST_ConvexHull(rast));

Select ST_MetaData(a.rast) from partsrtm a;

--select * from partsrtm;
--DELETE FROM partsrtm where rid=286 or rid=287;


--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--tworzenie rastra ze spadkami
CREATE TABLE public.srtmslope(
rid SERIAL primary key, rast raster);
select UpdateRasterSRID('srtmslope','rast',4326);
INSERT INTO srtmslope (rid,rast)
Select rid,ST_Slope(rast,1,'32BF','PERCENT',111120,true) from partsrtm;
CREATE INDEX srtmslope_gist_idx
ON srtmslope
USING GIST(ST_ConvexHull(rast));

%%%%%%%%%%%%%%%%%%%
--CREATE TABLE public.sloperas(
--rid SERIAL primary key, rast raster);
--select UpdateRasterSRID('sloperas','rast',4326);
--INSERT INTO sloperas (rid,rast)
--SELECT rid, ST_MakeEmptyRaster(rast) from srtm where rid=286 or rid=287;
--UPDATE sloperas set rast=ST_Slope(srtm.rast,1,'32BF','PERCENT',111120,true) from srtm where srtm.rid=286 or rid=287;



CREATE TABLE public.srtmaspect(
rid SERIAL primary key, rast raster);
Select UpdateRasterSRID('srtmaspect','rast',4326);
INSERT INTO srtmaspect (rid,rast)
SELECT rid, ST_Aspect(rast,1,'32BF','DEGREES',false) from partsrtm;
select * from srtmaspect;

--UPDATE aspectras
--set rast=ST_Aspect(a.rast,1,'32BF','DEGREES',false) from srtm where srtm.rid=114;

CREATE INDEX srtmaspect_gist_idx
ON srtmaspect
USING GIST(ST_ConvexHull(rast));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
select H from
(select ST_Value(rast,1,ST_GeomFromText('POINT (16.92818 51.17180)',4326),false) from partsrtm) as H
where H IS NOT NULL ;