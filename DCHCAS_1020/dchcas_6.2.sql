CREATE DATABASE dchcas_2;

use dchcas_2;

CREATE TABLE gyarto(
adoszam int primary key,
nev varchar(30) NOT null,
telephely varchar(50),
irsz varchar(4),
varos varchar(40),
utca varchar(100) );

CREATE TABLE termek (
tkod int primary key,  
nev varchar(50) not null, 
ear int check (ear > 0), 
gyarto int references GYARTO); 

CREATE TABLE alaktresz(
akod  int primary key,  
nev  varchar(50) not null);
 
CREATE TABLE egysegek(
aru int references termek, 
db int check (db > 0) ); 

CREATE TABLE komponens(
termek int references termek, 
alkatresz int references alkatresz);