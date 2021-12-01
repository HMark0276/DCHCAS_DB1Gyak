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

create table hallgato(
	neptunkod VARCHAR(6) PRIMARY KEY,
	nev VARCHAR(20),
	tankor VARCHAR(20),
	szul_d DATE,
	eletkor INT(2),
	irszam INT(4),
	varos VARCHAR(20),
	utca VARCHAR(20),
	hsz INT(3)
);


create table hallgat(
	kod INT NOT NULL,
	neptunkod VARCHAR(6),
	felev INT(1),
	vizsgajegy INT(1)
	FOREIGN KEY(kod) references targy(kod),
	FOREIGN KEY(neptunkod) references hallgato(kod);
);

insert into oktato values('FVH884', 'Istvan', 'Matematika');
insert into oktato values('H4GMNV', 'Gabor', 'Matematika');
insert into oktato values('3CF4TJ', 'Janos', 'Informatika');
insert into oktato values('2GGV45', 'Eva', 'Gazdasag');
insert into oktato values('34CV5V', 'Anna', 'Matematika');

insert into targy values('123','4','Valszam');
insert into targy values('111','3','Gazdjog');
insert into targy values('132','2','Progelm');
insert into targy values('544','6','db1');
insert into targy values('765','5','Oprendszerek');

insert into hallgato values('
