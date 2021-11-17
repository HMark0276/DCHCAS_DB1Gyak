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
    nev VARCHAR(50)
);

create table egysegek(
	aru INT(30) REFERENCES termek(tkod),
    db INT CHECK(db>0)
);
