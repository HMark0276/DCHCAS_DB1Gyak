CREATE DATABASE dchcas_4;

use dchcas_4;

CREATE TABLE termekek (
tkod int primary key,
nev varchar(50) not null,
ear int check (ear > 0),
kategoria varchar(20)
 );
 
insert into termekek values(1,'lapát',2000, 'K1');
insert into termekek values(2,'seprű',4000, 'K1');
insert into termekek values(3,'mosogató gél',1500, 'K2');
insert into termekek values(4,'szappan',1000, 'K2');
insert into termekek values(5,'pohár',2400, 'K3');