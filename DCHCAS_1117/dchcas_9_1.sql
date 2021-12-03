create database dchcas_8;

use dchcas_8;

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

create table komponens(
	termek INT(20) REFERENCES termek(tkod),
    alkatresz INT(20) REFERENCES alkatresz(akod)	
);

create table alkatresz(
	akod INT(30),
    nev VARCHAR(50),
    uj_ar INT(30)
);

create table egysegek(
	aru INT(30) REFERENCES termek(tkod),
    db INT CHECK(db>0)
);
insert into gyarto values(101,'A1','Miskolc',3543,'Miskolc','Damjanics');
insert into gyarto values(102,'A2','Budapest',1103,'Budapest','Petofi');
insert into gyarto values(103,'A3','Miskolc',3543,'Debrecen','Bartok');

insert into termek values(1,'aso',4000,'A1');
insert into termek values(2,'kapa',6000,'A1');
insert into termek values(3,'gereblye',2000,'A1');
insert into termek values(4,'lapat',1000,'A1');
insert into termek values(5,'vodor',3000,'A2');

insert into egysegek values(1,40);
insert into egysegek values(2,10);
insert into egysegek values(3,70);
insert into egysegek values(4,100);
insert into egysegek values(5,30);

insert into komponens values('aso',201);
insert into komponens values('kapa',202);
insert into komponens values('gereblye',203);
insert into komponens values('lapat',204);
insert into komponens values('vodor',205);

insert into alkatresz values(201,'nyel',3000);
insert into alkatresz values(202,'fej',1000);
insert into alkatresz values(203,'elezo',2000);

ALTER TABLE alkatresz ADD ( ar INT CHECK (ar > 0));
SELECT nev FROM gyarto WHERE adoszam NOT IN (SELECT gyarto FROM termek);
UPDATE termek SET ear = 1.1*ear WHERE tkod IN ( SELECT termek FROM komponens WHERE alkatresz = (SELECT akod FROM alkatresz WHERE nev = ‘elezo’));
CREATE VIEW bb AS SELECT MAX(t.nev) nev, t.tkod, COUNT(*) db FROM termek t INNER JOIN egysegek e ON e.aru = t.tkod GROUP BY t.tkod;
SELECT nev FROM aa WHERE db = (SELECT MAX(db) FROM aa);
