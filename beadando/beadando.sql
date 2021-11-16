create database beadando;

use beadando;

create table Tigris(
	fajnev varchar(30) primary key,
    tudom_nev varchar(30)
);

create table Elterjedes(
	szarm_terulet varchar(30) primary key,
    jelen_terulet varchar(30),
    ved_statusz boolean,
    kihalas_ideje date
);

create table Megjelenes(
	meret int(3),
    suly int(3),
    minta varchar(30),
    szin varchar(20)
);

create table Eletmod(
	vadasz_idoszak varchar(20),
    territorium int(3),
    koz_statusz varchar(20),
    preda varchar(10)
);