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
