select * from osoby;
select imie as IM,nazwisko as NAZ
from osoby;
select imie IM,nazwisko NAZ
from osoby;

--create table informacja as
create view informacja_view as
select imie IM,nazwisko NAZ from osoby;

--1. Wyświetl kolumny pesel, imię, nazwisko z tabeli osoby
SELECT pesel, imie, nazwisko from osoby;
--2. Wyświetl kolumny imię, nazwisko, miejscowość
SELECT imie, nazwisko, miejscowosc from osoby;
--3. Wyświetl dane z tabeli udzialy
SELECT * from udzialy;
--4. Wyświetl dane z tabeli dzialki
SELECT * from dzialki;

select * from osoby where nazwisko='Kowalski';
select * from osoby where nazwisko='Kowalski' and imie='Jan';
--zadania
--1. Wyświetl dane dla pesel=2
SELECT * from osoby WHERE pesel = '2';
--2. Wyświetl dane dla osób o imieniu Jan
SELECT * from osoby where imie = 'Jan';

-- sortowanie
SELECT * from osoby ORDER BY nazwisko;
SELECT * from osoby ORDER BY nazwisko desc;
-- 1. dane uporządkowane według nr pesel
SELECT * from osoby ORDER BY pesel;
-- 2. wedlug nazwy ulicy
SELECT * from dzialki ORDER BY ulica;

-- akyualizacja
update dzialki set powierzchnia = 600 where nrdzialki = '2' and nrobreb = '1';
update dzialki set powierzchnia = 260 where nrdzialki = '2'and powierzchnia = '250';
--zadania
--1. Zmień imię Jan na Mikołaj dla użytkownika Jan Nowak o numerze pesel=2
update osoby set imie = 'Mikołaj' where pesel = '2';
--2. Zmień nazwisko Nowak na Nowacki dla użytkownika Adam Nowak o numerze pesel=3
update osoby set nazwisko = 'Nowacki' where pesel = '3';

update dzialki set powierzchnia = 900 where nrdzialki = '2' and nrobreb = '1';

select distinct nazwisko from osoby;

--zadania
--1. Wyświetl imiona osób występujące w tabeli osoby
select distinct imie from osoby;
--2. Wyświetl ulice występujące w tabeli dzialki
select distinct ulica from dzialki;

-- 16.10.2024
-- funckje agregujące

Select sum(powierzchnia) SUM_POW from dzialki;
select count(nrdzialki) liczba_dzialek from dzialki;
select ulica, count(nrdzialki) liczba_dzialek from dzialki group by ulica;
select  ulica, AVG(powierzchnia) from dzialki group by ulica;
select  ulica, SUM(powierzchnia) from dzialki group by ulica;
select  ulica, AVG(powierzchnia) as srednia from dzialki group by ulica;
select  ulica, round(AVG(powierzchnia),2) as srednia from dzialki group by ulica;
select  AVG(powierzchnia) from dzialki;
--funkcje
--MIN() -minimum   
--MAX()- maksimum
--SUM() - suma
--AVG() - średnia
--VARIANCE() - Wariancja
--STDDEV() - odchylenie standardowe
--COUNT() - zliczanie

--zadania
--1. Oblicz sumę powierzchni działek w bazie danych
select sum(powierzchnia) as suma_pow from dzialki;
--2. Oblicz sumę powierzchni działek przy ulicach
select ulica, sum(powierzchnia) as suma_pow from dzialki group by ulica;
--3. Pokaż minimalne powierzchnie działek przy ulicach
select ulica, min(powierzchnia) as min_pow from dzialki group by ulica;

Select sum(powierzchnia) SUM_POW from dzialki;
select ulica, SUM(powierzchnia) as suma_pow from dzialki group by (ulica)
select ulica, SUM(powierzchnia) as suma_pow from dzialki group by (ulica) having ulica='WODNA';
select nrobreb,nrdzialki, powierzchnia FROM dzialki where powierzchnia>(select AVG (powierzchnia) from dzialki) order by nrobreb;
select ulica, AVG(powierzchnia) as srednia_pow from dzialki group by ulica having AVG (powierzchnia)>420 order by ulica;
select AVG(powierzchnia) from dzialki;
select * from dzialki;

--zadania
--1. Oblicz sumę powierzchni działek przy ulicy 'GRUNWALDZKA'
select ulica, SUM(powierzchnia) from dzialki group by (ulica) where ulica = 'GRUNWALDZKA';
--2. Oblicz liczbę działek przy ulicy 'GRUNWALDZKA'
select ulica, COUNT(powierzchnia) from dzialki group by (ulica) having ulica = 'GRUNWALDZKA';
--3. Wyświetl działki o powierzchni mniejszej od średniej w bazie danych
select nrobreb,nrdzialki, powierzchnia FROM dzialki where powierzchnia>(select AVG (powierzchnia) from dzialki) order by nrobreb;


select ulica, nrobreb, nrdzialki,  powierzchnia, round (AVG(powierzchnia) over (partition by ulica),2) as pow_sred from dzialki;
select ulica, nrobreb, nrdzialki,  powierzchnia, round (SUM(powierzchnia) over (partition by ulica),2) as sum_pow from dzialki;
select nrobreb, nrdzialki, powierzchnia, SUM(powierzchnia) over (order by powierzchnia) from dzialki;
select nrobreb, nrdzialki, powierzchnia, SUM(powierzchnia) over (order by nrobreb,nrdzialki) from dzialki;

--zadania
--1. Oblicz średnią powierzchnię działek w obrębach. Wyświetl wszystkie działki i ich pola powierzchni oraz średnią dla obrębu.
select nrdzialki, nrobreb, powierzchnia, round(AVG(powierzchnia) over (partition by nrobreb),2) from dzialki;
--2. Oblicz sumę powierzchni działek w obrębach. Wyświetl wszystkie działki i ich pola powierzchni oraz sumy dla obrębów.
select nrdzialki, nrobreb, powierzchnia, SUM(powierzchnia) over (partition by nrobreb) as sum_pow  from dzialki;

-- % - dalsze znaki niezerowe, _ - pojedynczy znak
select imie , nazwisko from osoby where nazwisko like 'Kow%';
select imie , nazwisko from osoby where nazwisko like 'kow%';
select imie , nazwisko from osoby where nazwisko ilike 'kow%';
select imie , nazwisko from osoby where nazwisko like 'Kowalsk_';
select imie , nazwisko from osoby where nazwisko not ilike '%kow%';
select imie , nazwisko from osoby where nazwisko similar to '%owa%';


--złączenia
select * from osoby
inner join udzialy on osoby.pesel=udzialy.pesel
inner join dzialki on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki;

select * from osoby
full join udzialy on osoby.pesel=udzialy.pesel
full join dzialki on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki;

select * from osoby
left outer join udzialy on osoby.pesel=udzialy.pesel
left outer join dzialki on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki;

select * from osoby
right outer join udzialy on osoby.pesel=udzialy.pesel
right outer join dzialki on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki;

select osoby.pesel,dzialki.nrdzialki,dzialki.nrobreb from osoby
right outer join udzialy on osoby.pesel=udzialy.pesel
right outer join dzialki on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki
where osoby.pesel is null;


select osoby.pesel,osoby.imie, osoby.nazwisko, udzialy.udzial from osoby
inner join udzialy on osoby.pesel=udzialy.pesel
inner join dzialki on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki;

--zadania
--1. Wyświetl dane osobowe dla działek o powierzchni większej niż 600 m2. Uporządkuj według numerów obrębów.
-- ma nic nie zwrócić
select * from dzialki 
left join udzialy on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki
right join osoby on osoby.pesel=udzialy.pesel
where powierzchnia>600 order by dzialki.nrobreb;





--2. Wyświetl dane osób, które nie mają przyporządkowanych działek.
-- nie ma takich osób
select * from udzialy;