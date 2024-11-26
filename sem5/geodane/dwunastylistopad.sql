--Zadanie
--1. Oblicz wysokość centroidu dzielnicy
--select dziel.gid ids, grd.z_mean z from gran_dzielnice dziel inner join grd_200m grd on ST_Intersects(ST_Force2D(ST_Centroid(dziel.geom)),ST_Force2D(grd.geom))
--select dziel.gid ids, grd.z_mean z from gran_dzielnice dziel 
--inner join grd_200m grd on ST_Intersects(ST_Force2D(ST_Centroid(dziel.geom)),ST_Force2D(grd.geom));

DO
$$
declare
ids integer;
z decimal(10,3);
begin
alter table gran_dzielnice add column if not exists Hn decimal(10,3);
for ids, z in (select dziel.gid ids, grd.z_mean z from gran_dzielnice dziel inner join grid_wroclaw grd
on ST_Intersects(ST_Force2D(ST_Centroid(dziel.geom)),ST_Force2D(grd.geom)))
loop
execute format ('update gran_dzielnice set Hn=%s where gid=%s',z,ids);
--RAISE NOTICE USING MESSAGE=CAST(z as varchar(20));
end loop;
end;
$$ LANGUAGE plpgsql;

--ST_Force2D stosować dla geometrii 3D !!!!!

--2. Oblicz średnią wysokość w dzielnicy
select dziel.gid ids, AVG(grd.z_mean) z from gran_dzielnice dziel inner join grid_wroclaw grd
on ST_Intersects(ST_Force2D(dziel.geom),ST_Force2D(grd.geom))
group by ids;


--3. Oblicz liczbę budynków w dzielnicach
select dziel.gid ids, bud.gid idb from gran_dzielnice dziel inner join budynki bud
on ST_Intersects(ST_Force2D(dziel.geom),ST_Force2D(bud.geom));



--4. Oblicz średnią powierzchnię (zabudowy, po obrysie) budynków w dzielnicach
select dziel.gid ids, AVG(ST_Area(bud.geom)) mean_pow from gran_dzielnice dziel inner join budynki bud 
on ST_Intersects(ST_Force2D(dziel.geom),ST_Force2D(bud.geom))
group by ids;


--5. Oblicz średnią wysokość w otoczeniu 200 m od budynków
select bud.gid ids, AVG(grd.z_mean) z_mean from budynki bud inner join grd_200m grd
on ST_Intersects(ST_Buffer(bud.geom,200,8), grd.geom)
group by ids;

--6. Oblicz liczbę otworów hydrogeologicznych w siatce grid_wroclaw
select count(*) from grid_wroclaw grd inner join hydro
on ST_Intersects(ST_Force2D(grd.geom),ST_Force2D(hydro.geom));