SELECT AVG(ST_Area(budynki.geom)) AS srednia_powierzchnia
FROM budynki
JOIN (
    SELECT ST_Buffer(ST_Boundary(gran_dzielnice.geom), 25) AS geom
    FROM gran_dzielnice
    WHERE gran_dzielnice.gid = 14
) AS bufor
ON ST_Intersects(budynki.geom, bufor.geom)
WHERE budynki.liczbakond > 2;