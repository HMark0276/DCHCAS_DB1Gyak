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

insert into gyarto values(10,'ABC','Miskolc'); 
insert into gyarto values(20,'DEF','Gyor'); 
insert into gyarto values(30,'GHI',NULL);
insert into gyarto values(40,'JKL','Gyor');
insert into gyarto values(50,'MNO','Budapest'); 

insert into termek values(01,'csokolade',3600,10);
insert into termek values(02,'tej',4000,20);
insert into termek values(03,'gereblye',5000,30);
insert into termek values(04,'kefir',3200,40);
insert into termek values(05,'kenyer',1000,10);

select * from termek where ear>3000;
select nev, adoszam from gyarto where telephely='Gyor';
select count(tkod) from termek where ear>3000;
select tkod from termek where nev='tej';
select nev from gyarto where telephely=NULL;
