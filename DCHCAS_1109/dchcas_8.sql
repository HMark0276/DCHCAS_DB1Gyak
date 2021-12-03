create database dchcas_8;

use dchcas_8;
1.RESZ
create table gyarto(
	adoszam INT PRIMARY KEY,
	nev VARCHAR(30),
	telephely VARCHAR(30),
	irsz VARCHAR(4),
	varos VARCHAR(40),
	utca VARCHAR(100)
);

create table termek(
	tkod INT(20) PRIMARY KEY,
	nev VARCHAR(50),
	ear INT CHECK(ear >0),
	gyarto INT(3) REFERENCES gyarto(adoszam)
);
2.RESZ
create table egysegek(
	aru INT NOT NULL,
	db INT CHECK(db>0),
	FOREIGN KEY(aru) references termek(tkod)
);

create table komponens(
	termek INT NOT NULL,
	alkatresz INT NOT NULL,
	FOREIGN KEY(termek) references termek(tkod),
	FOREIGN KEY(alkatresz) references alkatresz(akod)
);

create table alkatresz(
	akod INT PRIMARY KEY,
	nev VARCHAR(30)
);
1.RESZ
insert into gyarto values(10,'ABC','Miskolc',3344,'Miskolc','Benedek'); 
insert into gyarto values(20,'DEF','Gyor',2544,'Gyor','Kazincy'); 
insert into gyarto values(30,'GHI','Budapest',1344,'Miskolc','Petofi');
insert into gyarto values(40,'JKL','Gyor',2344,'Budapest','Gyori');
insert into gyarto values(50,'MNO','Budapest',1304,'Miskolc','Ady'); 

insert into termek values(01,'csokolade',3600,10);
insert into termek values(02,'tej',4000,20);
insert into termek values(03,'gereblye',5000,30);
insert into termek values(04,'kefir',3200,40);
insert into termek values(05,'kenyer',1000,10);

insert into egysegek values(01,16);
insert into egysegek values(02,10);
insert into egysegek values(03,30);
insert into egysegek values(04,12);
insert into egysegek values(05,30);

insert into komponens values(01,01);
insert into komponens values(02,02);
insert into komponens values(03,03);
insert into komponens values(04,04);
insert into komponens values(05,05);

insert into alkatresz values(01,'doboz');
insert into alkatresz values(02,'uveg');
insert into alkatresz values(03,'kupak');
insert into alkatresz values(03,'doboz');
insert into alkatresz values(05,'uveg');

select * from termek where ear>1000;
select gyarto.nev, gyarto.adoszam from gyarto where telephely like 'Gyor%';
select count(termek.nev) from termek where ear>3000;
select termek.tkod from termek where termek.nev like 'kenyer';
select gyarto.nev from gyarto where telephely is NULL;
2.RESZ
select termek.nev, gyarto.nev from termek, gyarto;
select termek.nev, termek.ear from termek where gyartok.nev = 'A';
select alkatresz.nev from alkatresz where termek.nev = 'fa';
select termek.nev from termek where alkatresz.akod and komponens.akod is null;
3.RESZ
create table resztvevo (
tajszam varchar(12) primary key,
nev varchar(50),
lakcim varchar(100)
);

create table tanfolyam (
tkod int primary key,
ar int check(ar>0),
megnevezes varchar(50),
tipus varchar(1)
);

create table befizetes (
kurzus int,
diak boolean not null default 0,
befizetes int,
foreign key (kurzus) references tanfolyam(tkod),
foreign key (diak) references resztvevo(tajszam)
);

insert into resztvevo values('1','Jozsef',87262344,'Arviz utca 1');
insert into resztvevo values('2','Agnes',7233363,'Negyesi utca 52');
insert into resztvevo values('3','Istvan',78233663,'Virag utca 111');
insert into resztvevo values('4','Benedek',79122121,'Oz utca 2');
insert into resztvevo values('5','Akos',62244121,'Ady utca 54');

insert into tanfolyam values(1,'5000','A','E2');
insert into tanfolyam values(2,'5000','A','E1');
insert into tanfolyam values(3,'2000','B','K2');
insert into tanfolyam values(4,'2000','B','K1');


insert into befizetes values(1, 87262344, 3000);
insert into befizetes values(1, 7233363, 1000);
insert into befizetes values(2, 78233663, 7000);
insert into befizetes values(3, 79122121, 2500);
insert into befizetes values(4, 78233663, 1000);
insert into befizetes values(3, 62244121, 5500);
insert into befizetes values(4, 7233363, 500);

select tipus, count(*) db from tanfolyam group by tipus;
select kurzus, count(*) db from befizetes group by kurzus;
select t.nev, count(*) db from befizetes b INNER join tanfolyam t on b.kurzus = t.tkod;
select t.nev, count(*) db from befizetes b INNER join tanfolyam t on ;b.kurzus = t.tkod where b.befizetes = t.ar;
select r.lakcim, count(*) db from befizetes b INNER join resztvevo r on b.diak = r.tajszam where b.kurzus IN (select tkod from tanfolyam where megnevezes = ‘A’);

4.RESZ
select * from termek where ear>1000;
select gyarto.nev, gyarto.adoszam from gyarto where telephely like 'Gyor%';
select count(termek.nev) from termek where ear>3000;
select termek.tkod from termek where termek.nev like 'kenyer';
select gyarto.nev from gyarto where telephely is NULL;

select count(*) from termek where ear > (select avg(ear) from termek);
select nev from termek where ear = (select max(ear) from termek);
select nev from gyarto where adoszam in (select gyarto from termek where ear = (select max(ear) from termek));
create view gyatlag as select gy.nev, AVG(gy.ear) mear from gyarto t inner join termek t on t.gyarto = gy.adoszam group by gy.nev;
select nev from gyatlag where mear = (select max(mear) from gyatlag);
select gy.nev, avg (t.ear) aear from gyarto gy left outer join termek t ON gy.adoszam = t.gyarto group by gy,nev;
