create database dchcas_7;

use dchcas_7; 

CREATE TABLE termekek (
tkod INT PRIMARY KEY, 
nev VARCHAR(50) NOT NULL,
ear INT CHECK (EAR > 0), 
kategoria CHAR(20)
);

alter table termekek add (szín char(20));
drop table termekek;
delete from termekek where kategoria is null;
