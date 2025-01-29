1. Odczytaj wysokość terenu (wartość z rastra wyjściowego) w punkcie x=369938.90 y=360077.50 (układ epsg:2180).
select srtm.rid, st_value(srtm.rast, 1, punkt.geom) as wys
from srtm join (select st_point(369938.90, 360077.50, 2180) as geom) as pkt
on st_intersects(srtm.rast, punkt.geom)
join (select st_convexhull(srtm.rast) as geom from srtm) as raster
on st_intersects(raster.geom, punkt.geom);


2. Podaj polecenie wyszukania budynków, które są zabytkami w dzielnicy o identyfikatorze gid=3.
select budynki.gid from budynki
join gran_dzielnice on st_intersects(budynki.geom, gran_dzielnice.geom)
where gran_dzielnice.gid = 3 and budynki.zabytek = 1;


3. Podaj polecenie obliczenia wysokość terenu w centroidach budynków położonych w buforze o szerokości 25 m wzdłuż granicy dzielnicy o identyfikatorze gid=14
select st_centroid (budynki.geom) as centroid_budynku, grd_200.z_mean as wysokosc from budynki
join (select st_buffer(st_boundary(gran_dzielnice.geom), 25) as geom from gran_dzielnice where gran_dzielnice.gid = 14) as bufor
on st_intersects(budynki.geom, bufor.geom) join grd_200 on st_intersects(st_centroid(budynki.geom), grd_200.geom)
group by budynki.geom, grd_200.z_mean;


4. Podaj polecenie obliczenia liczby oraz powierzchni obrysów budynków w dzielnicy o identyfikatorze gid=3.
select count(budynki.gid) as liczba, sum(st_area(budynki.geom)) as powobrysow
from budynki join gran_dzielnice on st_intersects(budynki.geom, gran_dzielnice.geom)
where gran_dzielnice.gid = 3;


5. Oblicz liczbę budynków położonych w buforze o szerokości 25 m wzdłuż granicy dzielnicy o identyfikatorze gid=14.
select count(budynki.geom) as ilebudynkow from budynki
join (select st_buffer(st_boundary(gran_dzielnice.geom), 25) as geom from gran_dzielnice where gran_dzielnice.gid = 14) as bufor
on st_intersects(budynki.geom, bufor.geom);

6. Oblicz średnią powierzchnię obrysów budynków  o liczbie kondygnacji powyżej  2 położonych w buforze o szerokości 25 m wzdłuż granicy dzielnicy o identyfikatorze gid=14.
select avg(st_area(budynki.geom)) as sredniapow
from budynki join (select st_buffer(st_boundary(gran_dzielnice.geom, 25) as geom from gran_dzielnice where gran_dzielnice.gid = 14) as bufor)
on st_intersects(budynki.geom, bufor.geom) where budynki.liczbakond > 2;