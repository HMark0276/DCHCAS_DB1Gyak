CREATE DATABASE dchcas_3;

use dchcas_3;

CREATE TABLE tanfolyam(
tkód int primary key,
ar int,
tipus varchar(30),
megnevezes varchar(50)
);

CREATE TABLE resztvevo(
tajszam int primary key,
lakcím varchar(40),
nev varchar(30)
);

CREATE TABLE befizetes(
tanulo int,
kurzus int,
befizetes int,
foreign key(tanulo) references resztvevo(tajszam),
foreign key(kurzus) references tanfolyam(tkód)
);