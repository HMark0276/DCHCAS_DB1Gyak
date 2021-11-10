create database dchcas_6;

use dchcas_6;

CREATE TABLE termekek (
tkod INT PRIMARY KEY,  
nev VARCHAR(50) NOT NULL,
ear INT CHECK (EAR > 0), 
kategoria CHAR(20)
); 

Insert into termekek values(1, 'citrom', 15, 'C');
Delete from termekek where Ear<X;
Update termekek set ear= ear*0.9 where kategoria=Y;
