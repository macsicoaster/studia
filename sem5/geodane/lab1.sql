create table if not exists dzialki
(nrobreb varchar(20),
 nrdzialki varchar(20),
 powierzchnia decimal(10,2),
 ulica varchar(20),
 numer varchar(20),
 primary key (nrobreb,nrdzialki));

--drop table dzialki;

insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('1','1',250,'GRUNWALDZKA','21');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('2','1',450,'SZKOLNA','22');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('3','1',350,'GRUNWALDZKA','23');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('4','1',550,'SZKOLNA','25');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('1','2',350,'JODŁOWA','34');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('2','3',550,'JODŁOWA','35');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('3','2',650,'WODNA','23');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('4','2',850,'WODNA','25');
insert into dzialki (nrobreb,nrdzialki,powierzchnia,ulica,numer) VALUES ('1','3',750,'WODNA','26');

create table if not exists osoby
(pesel varchar(11),
imie varchar(20),
nazwisko varchar(25),
miejscowosc varchar(25),
ulica varchar (25),
numer varchar (25),
primary key(pesel));

create table if not exists uzytkownik
(rodzaj varchar(20))
INHERITS (osoby);

insert into osoby values ('1','Jan','Kowalski','Wrocław','Długa','5');
insert into osoby values ('2','Jan','Nowak','Wrocław','Krótka','4');
insert into osoby values ('3','Adam','Nowak','Wrocław','Kasztanowa','10');
insert into osoby values ('4','Tadeusz','Różewicz','Wrocław','Jaworowa','23');
insert into osoby values ('5','Robert','Lewandowski','Wrocław','Morelowa','15');
insert into osoby values ('6','Artur','Kowalski','Wrocław','Długa','5');

create table if not exists udzialy
(nrobreb varchar(20),
nrdzialki varchar(20),
pesel varchar(11),
udzial varchar (25),
primary key (nrobreb,nrdzialki,pesel));

insert into udzialy values ('1','1','1','1/2');
insert into udzialy values ('1','1','2','1/2');
insert into udzialy values ('1','2','3','1/2');
insert into udzialy values ('1','2','4','1/2');
insert into udzialy values ('1','3','4','1/2');
insert into udzialy values ('1','3','5','1/2');
