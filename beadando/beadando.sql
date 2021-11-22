create database beadando;

use beadando;

create table Megnevezes(
	fajnev VARCHAR(30) PRIMARY KEY,
	tudom_nev VARCHAR(30),
	tudom_alcsalad VARCHAR(30),
	alcsalad VARCHAR(30)
);

create table Terulet(
	szarm_terulet VARCHAR(30),
	jelen_terulet VARCHAR(30),
	ved_statusz boolean,
	kihalas_ideje VARCHAR(40),
	Foreign key(fajnev) references Megnevezes(fajnev))
);

create table Megjelenes(
	meret INT(3),
	suly INT(3),
	minta VARCHAR(30),
	szin VARCHAR(20),
	Foreign key(fajnev) references Megnevezes(fajnev))
);

create table Ragadozo(
	vadasz_idoszak VARCHAR(20),
	territorium INT(3),
	koz_statusz VARCHAR(20),
	preda VARCHAR(10),
	Foreign key(fajnev) references Megnevezes(fajnev))
);

create table Utodjai(
	himek_versengese VARCHAR(20),
	vemh_ideje VARCHAR(20),
	kolykok_szama INT CHECK(kolykok_szama > 0),
	tulelo_utodok_szama INT CHECK(tulelo_utodok_szama > 0),
	Foreign key(fajnev) references Megnevezes(fajnev))

insert into Megnevezes values('Sziberiai tigris','Panthera tigris altaica','Parducformak','Pantherinae');
insert into Megnevezes values('Del-kinai tigris','Panthera tigris amoyensis','Parducformak','Pantherinae');
insert into Megnevezes values('Bali tigris','Panthera tigris balica','Parducformak','Pantherinae');
insert into Megnevezes values('Indokinai tigris','Panthera tigris corbetti','Parducformak','Pantherinae');
insert into Megnevezes values('Malaj tigris','Panthera tigris jacksoni','Parducformak','Pantherinae');
insert into Megnevezes values('Javai tigris','Panthera tigris sondaica','Parducformak','Pantherinae');
insert into Megnevezes values('Szumatrai tigris','Panthera tigris sumatrae','Parducformak','Pantherinae');
insert into Megnevezes values('Bengali tigris','Panthera tigris tigris','Parducformak','Pantherinae');
insert into Megnevezes values('Kaszpi tigris','Panthera tigris virgata','Parducformak','Pantherinae');

insert into Terulet values('Kina','Sziberia',1,'nincs','Sziberiai tigris');
insert into Terulet values('Kina','Kina',1,'nincs','Del-kinai tigris');
insert into Terulet values('Bali','nincs',0,'1937','Bali tigris');
insert into Terulet values('Thaifold','Vietnam',1,'nincs','Indokinai tigris');
insert into Terulet values('Malajzia','Malajzia',1,'nincs','Malaj tigris');
insert into Terulet values('Java','nincs',0,'1980','Javai tigris');
insert into Terulet values('Malajzia','Indonezia',1,'nincs','Szumatrai tigris');
insert into Terulet values('India','Sundarbans',1,'nincs','Bengali tigris');
insert into Terulet values('Kina','Sziberia',0,'1996','Kaszpi tigris');
