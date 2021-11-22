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
	ved_statusz BOOLEAN,
	kihalas_ideje VARCHAR(10),
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
	territorium VARCHAR(20),
	koz_statusz VARCHAR(20),
	preda VARCHAR(20),
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

insert into Megjelenes values(310,220,'vastag csikok','sotet sarga','Sziberiai tigris');
insert into Megjelenes values(250,150,'keskeny csikok','sarga','Del-kinai tigris');
insert into Megjelenes values(170,80,'keskeny csikok','narancs','Bali tigris');
insert into Megjelenes values(250,200,'keskeny csikok','sotet sarga','Indokinai tigris');
insert into Megjelenes values(200,100,'fekete-feher csikok','sarga','Malaj tigris');
insert into Megjelenes values(250,120,'keskeny csikok','narancs','Javai tigris');
insert into Megjelenes values(220,110,'keskeny csikok','sotet sarga','Szumatrai tigris');
insert into Megjelenes values(330,260,'vastag csikok',' vilagos sarga','Bengali tigris');
insert into Megjelenes values(290,240,'keskeny csikok','voros','Kaszpi tigris');

insert into Ragadozo values('ejszaka','fuves terulet','maganyos','nagytestu novenyevok','Sziberiai tigris');
insert into Ragadozo values('barmikor','sziklas terulet','maganyos','patasok','Del-kinai tigris');
insert into Ragadozo values('ejszaka','erdos resz','maganyos','kozepes emlosok','Bali tigris');
insert into Ragadozo values('barmikor','magas fuves terulet','maganyos','kozepes emlosok','Indokinai tigris');
insert into Ragadozo values('ejszaka','magas fuves terulet','maganyos','kozepes emlosok','Malaj tigris');
insert into Ragadozo values('barmikor','erdos resz','maganyos','patasok','Javai tigris');
insert into Ragadozo values('ejszaka','sziklas terulet','maganyos','kozepes emlosok','Szumatrai tigris');
insert into Ragadozo values('ejszaka','erdos resz','maganyos','nagyobb emlosok','Bengali tigris');
insert into Ragadozo values('nappal','magas fuves terulet','maganyos','nagytestu novenyevok','Kaszpi tigris');

insert into Utodjai values('agressziv','3.5 honap',6,2,'Sziberiai tigris');
insert into Utodjai values('agressziv','3 honap',6,3,'Del-kinai tigris');
insert into Utodjai values('nem tudni','nem tudni',3,1,'Bali tigris');
insert into Utodjai values('passziv','4 honap',5,2,'Indokinai tigris');
insert into Utodjai values('agressziv','3 honap',6,3,'Malaj tigris');
insert into Utodjai values('nem tudni','nem tudni',3,1,'Javai tigris');
insert into Utodjai values('passziv','3 honap',7,3,'Szumatrai tigris');
insert into Utodjai values('agressziv','3 honap',4,3,'Bengali tigris');
insert into Utodjai values('nem tudni','nem tudni',3,1,'Kaszpi tigris');
