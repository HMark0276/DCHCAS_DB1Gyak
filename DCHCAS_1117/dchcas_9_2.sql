create database dchcas_9_2;

use dchcas_9_2;

create table tanfolyam(
	tkod INT,
    ar INT CHECK(ar>0),
    megnevezes VARCHAR(50),
    tipus VARCHAR(1)
);

create table befizetes(
	kurzus INT REFERENCES tanfolyam(tkod),
	diak boolean references resztvevo(tajszam),
    befizetes  INT 
);

create table resztvevo(
	tajszam varchar(12),
    nev varchar(50),
    lakcim varchar(100)
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

SELECT tipus, AVG(ar), MAX(ar) - MIN(ar) FROM tanfolyam GROUP BY tipus;
SELECT megnevezes, CASE WHEN ar > 100000 THEN ‘drága’ ELSE ‘olcsó’ END arkategoria FROM termek;
CREATE VIEW tdb AS SELECT MAX(t.megnevezes) nev, COUNT(*) db FROM tanfolyam t INNER JOIN befizetes b ON b.kurzus = t.tkod GROUP BY t.tkod;
SELECT nev, CASE WHEN db > 10 THEN ‘népszerű’ ELSE ‘nem népszerű’ END letszam FROM tdb;
