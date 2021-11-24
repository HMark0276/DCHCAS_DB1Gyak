create database dchcas_10;

use dchcas_10;

create table oktato(
	neptunkod VARCHAR(6) PRIMARY KEY,
	nev VARCHAR(30),
	tanszek VARCHAR(20)
);

create table targy(
	kod INT NOT NULL PRIMARY KEY,
	kredit INT(1),
	megnevezes VARCHAR(20)
);

craete table 


create table hallgat(
	kod INT NOT NULL,
	neptunkod VARCHAR(6),
	felev INT(1),
	vizsgajegy INT(1)
	FOREIGN KEY(kod) references targy(kod),
	FOREIGN KEY(neptunkod) references hallgato(kod);
);
