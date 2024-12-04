--Zadanie
--1. Oblicz wysokość centroidu dzielnicy
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
end loop;
end;
$$ LANGUAGE plpgsql;

--2. Oblicz średnią wysokość w dzielnicy
DO
$$
declare
ids integer;
avg_z decimal(10,3);
begin
alter table gran_dzielnice add column if not exists avg_Hn decimal(10,3);
for ids, avg_z in (select dziel.gid ids, AVG(grd.z_mean) z from gran_dzielnice dziel inner join grid_wroclaw grd
on ST_Intersects(ST_Force2D(dziel.geom),ST_Force2D(grd.geom))
group by dziel.gid)
loop
execute format ('update gran_dzielnice set avg_Hn=%s where gid=%s', avg_z, ids);
end loop;
end;
$$ LANGUAGE plpgsql;

--3. Oblicz liczbę budynków w dzielnicach
DO
$$
declare
ids integer;
count_bud integer;
begin
alter table gran_dzielnice add column if not exists bud_count integer;
for ids, count_bud in (select dziel.gid ids, count(bud.gid) count_bud from gran_dzielnice dziel inner join budynki bud
on ST_Intersects(ST_Force2D(dziel.geom),ST_Force2D(bud.geom))
group by dziel.gid)
loop
execute format ('update gran_dzielnice set bud_count=%s where gid=%s', count_bud, ids);
end loop;
end;
$$ LANGUAGE plpgsql;

--4. Oblicz średnią powierzchnię (zabudowy, po obrysie) budynków w dzielnicach
DO
$$
declare
ids integer;
mean_pow decimal(10,3);
begin
alter table gran_dzielnice add column if not exists avg_pow decimal(10,3);
for ids, mean_pow in (select dziel.gid ids, AVG(ST_Area(bud.geom)) mean_pow from gran_dzielnice dziel inner join budynki bud 
on ST_Intersects(ST_Force2D(dziel.geom),ST_Force2D(bud.geom))
group by dziel.gid)
loop
execute format ('update gran_dzielnice set avg_pow=%s where gid=%s', mean_pow, ids);
end loop;
end;
$$ LANGUAGE plpgsql;

--5. Oblicz średnią wysokość w otoczeniu 200 m od budynków
DO
$$
declare
ids integer;
avg_z_mean decimal(10,3);
begin
alter table budynki add column if not exists avg_z_mean_200m decimal(10,3);
for ids, avg_z_mean in (select bud.gid ids, AVG(grd.z_mean) z_mean from budynki bud inner join grd_200m grd
on ST_Intersects(ST_Buffer(bud.geom,200,8), grd.geom)
group by bud.gid)
loop
execute format ('update budynki set avg_z_mean_200m=%s where gid=%s', avg_z_mean, ids);
end loop;
end;
$$ LANGUAGE plpgsql;

--6. Oblicz liczbę otworów hydrogeologicznych w siatce grid_wroclaw
DO
$$
declare
count_hydro integer;
begin
select count(*) into count_hydro from grid_wroclaw grd inner join hydro
on ST_Intersects(ST_Force2D(grd.geom),ST_Force2D(hydro.geom));
RAISE NOTICE 'Liczba otworów hydrogeologicznych: %', count_hydro;
end;
$$ LANGUAGE plpgsql;
