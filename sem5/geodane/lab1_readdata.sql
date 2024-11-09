select *
from osoby;

select imie as IM, nazwisko as NAZ
from osoby;

select imie IM, nazwisko NAZ
from osoby;

-- create table informacja as
create view informacja_view as
    select imie IM, nazwisko NAZ
    from osoby;

select *
from informacja_view;

-- zadania
-- 1
SELECT pesel, imie, nazwisko from osoby;

-- 2
SELECT imie, nazwisko, miejscowosc from osoby;

-- 3
SELECT * from udzialy;

-- 4
SELECT * from dzialki;

select * from osoby
WHERE nazwisko = 'Kowalski';

select * from osoby
WHERE nazwisko = 'Kowalski'
    and imie = 'Jan';

-- zadania

-- 1 - wyswietl dane dla pesel = 2
select * from osoby
WHERE pesel = '2';

-- 2 - wyswietl dane dla osob o imieniu jan
select * from osoby
WHERE imie = 'Jan';


select *
from osoby
order by nazwisko;

select *
from osoby
order by nazwisko desc;

--zadania
-- osoby wg pesel
select * from osoby order by pesel;
-- osoby wg ulicy
select * from osoby order by ulica;

update dzialki
set powierzchnia = 600
where nrdzialki = '2'
    and nrobreb = '1';

update dzialki
set powierzchnia = 260
where nrobreb = '2'
    and powierzchnia = 250;

--zadania
-- zmien imie jan na mikolaj dla uzytkownika jan nowak o numerze pesel=2
update osoby
set imie = 'Mikołaj'
where pesel = '2';
-- zmien naziwsko nowak na nowacki dla uzytkownika adam nowak o nmerze pesel=3
update osoby
set nazwisko = 'Nowacki'
where pesel = '3';

select distinct nazwisko from osoby;

--zadania
--1 wyswietl imiona osob wystapujacych w tabeli osoby
select distinct imie from osoby;
--2 wyswietl ulice wystepujace w tabeli dzialki
select distinct ulica from dzialki;

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
select sum(powierzchnia) from dzialki;
--2. Oblicz sumę powierzchni działek przy ulicach
select ulica, sum(powierzchnia) from dzialki group by ulica;
--3. Pokaż minimalne powierzchnie działek przy ulicach
select ulica, min(powierzchnia) from dzialki group by ulica;

Select sum(powierzchnia) SUM_POW from dzialki;
select ulica, SUM(powierzchnia) as suma_pow from dzialki group by (ulica)
select ulica, SUM(powierzchnia) as suma_pow from dzialki group by (ulica) having ulica='WODNA';
select nrobreb,nrdzialki, powierzchnia FROM dzialki where powierzchnia>(select AVG (powierzchnia) from dzialki) order by nrobreb;
select ulica, AVG(powierzchnia) as srednia_pow from dzialki group by ulica having AVG (powierzchnia)>420 order by ulica;
select AVG(powierzchnia) from dzialki;
select * from dzialki;

--zadania
--1. Oblicz sumę powierzchni działek przy ulicy 'GRUNWALDZKA'
select ulica, SUM(powierzchnia) as suma_pow from dzialki group by (ulica) having ulica='GRUNWALDZKA';
--2. Oblicz liczbę działek przy ulicy 'GRUNWALDZKA'
select ulica, COUNT(nrdzialki) as liczba_dzialek from dzialki group by (ulica) having ulica='GRUNWALDZKA';
--3. Wyświetl działki o powierzchni mniejszej od średniej w bazie danych
select nrobreb,nrdzialki, powierzchnia, ulica FROM dzialki where powierzchnia<(select AVG (powierzchnia) from dzialki) order by nrobreb;


select ulica, nrobreb, nrdzialki,  powierzchnia, round (AVG(powierzchnia) over (partition by ulica),2) as pow_sred from dzialki;
select ulica, nrobreb, nrdzialki,  powierzchnia, round (SUM(powierzchnia) over (partition by ulica),2) as sum from dzialki;
select nrobreb, nrdzialki, powierzchnia, SUM(powierzchnia) over (order by powierzchnia) from dzialki;
select nrobreb, nrdzialki, powierzchnia, SUM(powierzchnia) over (order by nrobreb,nrdzialki) from dzialki;

--zadania
--1. Oblicz średnią powierzchnię działek w obrębach. Wyświetl wszystkie działki i ich pola powierzchni oraz średnią dla obrębu.
select nrobreb, nrdzialki, powierzchnia, round (AVG(powierzchnia) over (partition by nrobreb),2) from dzialki;
--2. Oblicz sumę powierzchni działek w obrębach. Wyświetl wszystkie działki i ich pola powierzchni oraz sumy dla obrębów.
select nrobreb, nrdzialki, powierzchnia, round (SUM(powierzchnia) over (partition by nrobreb),2) from dzialki;
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
select osoby.pesel,osoby.imie, osoby.nazwisko, udzialy.udzial from osoby
inner join udzialy on osoby.pesel=udzialy.pesel
inner join dzialki on udzialy.nrobreb=dzialki.nrobreb and udzialy.nrdzialki=dzialki.nrdzialki
where powierzchnia>600 order by nrobreb;
--2. Wyświetl dane osób, które nie mają przyporządkowanych działek.
select osoby.pesel,osoby.imie, osoby.nazwisko, udzialy.udzial from osoby
left outer join udzialy on osoby.pesel=udzialy.pesel
where udzialy.pesel is null;

alter table dzialki add column if not exists wartosc decimal(10,2);
--drop column wartosc;

select * from dzialki order by nrobreb;

--zadania 
-- Wprowadź wartości działek
 --,1, 1, 25000
 --,1, 2, 30000
 --,2, 3, 35000
 --,2, 1, 32000
 --,3, 1, 50000
 --,3, 2, 45000
 --,4, 1, 65000
 --,4, 2, 61000
 
update dzialki set wartosc=25000 where (nrobreb='1' and nrdzialki='1');
update dzialki set wartosc=30000 where (nrobreb='1' and nrdzialki='2');
update dzialki set wartosc=35000 where (nrobreb='2' and nrdzialki='3');
update dzialki set wartosc=32000 where (nrobreb='2' and nrdzialki='1');
update dzialki set wartosc=50000 where (nrobreb='3' and nrdzialki='1');
update dzialki set wartosc=45000 where (nrobreb='3' and nrdzialki='2');
update dzialki set wartosc=65000 where (nrobreb='4' and nrdzialki='1');
update dzialki set wartosc=61000 where (nrobreb='4' and nrdzialki='2');
 
--Dodaj kolumnę cenametr decimal(10,2)
alter table dzialki add column cenametr decimal(10,2);
-- przyklad funkcji**************************************

CREATE OR REPLACE FUNCTION dodawanie(a decimal(10,2),b decimal(10,2))
RETURNS decimal(10,2) AS
$$
DECLARE
c decimal(10,2);     
 BEGIN 
  c=a+b;
 RETURN c; 
 END;
$$
LANGUAGE plpgsql; 
--drop function dodawanie;

select dodawanie(2.4,4.5);




CREATE OR REPLACE FUNCTION  print_message(mess varchar)
RETURNS varchar AS
$$
DECLARE
varx ALIAS FOR $1;
mess_ext varchar(20):='AAAAAA';
new_mess varchar(40); 
     
 BEGIN 
   new_mess=mess || mess_ext;
   RAISE NOTICE USING MESSAGE=new_mess;
   varx=new_mess || ' BBBBBBB';
   RAISE NOTICE USING MESSAGE=varx;
   RETURN varx; 
 END;
$$
LANGUAGE plpgsql; 

SELECT print_message ('Wstawiony tekst i '); --wywołanie funkcji
--***************************************

-- przyklad funkcji**************************************

create or replace function oblicz_wartosc(nrobreb varchar,nrdzialki varchar,wsp decimal(10,2), tabn varchar) 
returns decimal(10,2) as $$
declare 
wartosc decimal(10,2);
nowa_wartosc decimal(10,2);
begin
execute format('select wartosc from %s where nrobreb=''%s'' and nrdzialki=''%s''',tabn,nrobreb,nrdzialki) INTO wartosc;
nowa_wartosc:=wartosc*wsp;
return nowa_wartosc;
end;
$$ LANGUAGE plpgsql;

select oblicz_wartosc('1','1',1.2,'dzialki');

--ZADANIA
--1. Zapisz nową wartość do tabeli
--2. Napisz funkcję obliczającą w przeliczeniu na m2

DO
$$
declare
nrdz varchar(20);
nrobr varchar(20);
wsp decimal(10,2);
wart decimal(10,2);
pow decimal(10,2);
nowa_wart decimal(10,2);
c_metr decimal(10,2);

begin
for nrobr, nrdz, pow, wart in (select nrobreb nobr, nrdzialki nrdz, powierzchnia pow, wartosc wart  from dzialki)
loop
wsp:=1.1;
nowa_wart:=wart*wsp;
c_metr:=nowa_wart/pow;
execute format('update dzialki set wartosc=%s where nrobreb=''%s'' and nrdzialki=''%s''',nowa_wart,nrobr,nrdz) ;
execute format('update dzialki set cenametr=%s where nrobreb=''%s'' and nrdzialki=''%s''',c_metr,nrobr,nrdz) ;
--RAISE NOTICE USING MESSAGE=CAST(c_metr as varchar(20));
end loop;
end;
$$ LANGUAGE plpgsql;

select * from dzialki;

