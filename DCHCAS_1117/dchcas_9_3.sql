create database dchcas_9_3;

use dchcas_9_3;

create table gyarto (
adoszam int primary key,
nev varchar(30),
telephely varchar(100)
);

create table termek (
tkod int primary key,
nev varchar(50),
ear int check(ear>0),
gyarto int references gyarto(adoszam)
);


insert into gyarto values(101,'A1','Miskolc');
insert into gyarto values(102,'A2','Budapest');
insert into gyarto values(103,'A3','Miskolc');
insert into gyarto values(104,'A4','Budapest');
insert into gyarto values(105,'A5','Debrecen');

insert into termek values(1,'aso',4000,'A1');
insert into termek values(2,'kapa',6000,'A1');
insert into termek values(3,'gereblye',2000,'A1');
insert into termek values(4,'lapat',1000,'A1');
insert into termek values(5,'vodor',3000,'A2');


alter table termek drop column gyarto;

create table gyartja (
termek int references termek(tkod),
gyarto int references gyarto(adoszam)
);

insert into gyartja values(101,1);
insert into gyartja values(102,2);
insert into gyartja values(103,3);
insert into gyartja values(104,4);
insert into gyartja values(105,5);
