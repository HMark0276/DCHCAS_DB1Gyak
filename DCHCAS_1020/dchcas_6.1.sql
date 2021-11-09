CREATE DATABASE dchcas_1;

use dchcas_1;

CREATE TABLE gyarto (
adoszam int primary key,
nev varchar(30) not null,
telephely varchar(100) );
 
CREATE TABLE termek (
tkod int primary key,
nev varchar(30) not null,
ear int check (ear>0),
gyarto int references GYARTO );