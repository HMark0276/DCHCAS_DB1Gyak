CREATE DATABASE dchcas_5;

use dchcas_5;

CREATE TABLE termekek (
tkod INT PRIMARY KEY,
 nev VARCHAR(50) NOT NULL,
 ear INT CHECK (EAR > 0),
 kategoria VARCHAR(20)
 );
 
insert into termekek values(1,'lapát',2000, 'K1'); // letező kulcs
insert into termekek values(1,'seprű',4000, 'K1'); // hibas szam
insert into termekek values(3,NUll,1500, 'K2'); // ures nev
insert into termekek values(4,'szappan',-1000 , 'K2'); // hibas ar
insert into termekek values(5,'pohár',2400, "K3"); // hibas szoveg konstans