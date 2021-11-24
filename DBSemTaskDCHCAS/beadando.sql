create database dchcas;

use dchcas;

create table Megnevezes(
	ID INT(1) PRIMARY KEY,
	fajnev VARCHAR(30),
	tudom_nev VARCHAR(30),
	tudom_alcsalad VARCHAR(30),
	alcsalad VARCHAR(30)
);

create table kulso(
	ID INT(1),
	M_ID INT(1),
	FOREIGN KEY (ID) references Megnevezes(ID),
	FOREIGN KEY (M_ID) references Megjelenes(M_ID),
	PRIMARY KEY(ID,M_ID)
);

create table Terulet(
	T_ID INT(1) PRIMARY KEY,
	szarm_terulet VARCHAR(30),
	jelen_terulet VARCHAR(30),
	ved_statusz BOOLEAN,
	kihalas_ideje VARCHAR(10),
	ID INT(1) references Megnevezes(ID)
);

create table Megjelenes(
	M_ID INT(1) PRIMARY KEY,
	meret INT(3),
	suly INT(3),
	minta VARCHAR(30),
	szin VARCHAR(20),
	ID INT(1) references Megnevezes(ID)
);

create table Ragadozo(
	R_ID INT PRIMARY KEY,
	vadasz_idoszak VARCHAR(20),
	territorium VARCHAR(20),
	koz_statusz VARCHAR(20),
	preda VARCHAR(20),
	ID INT(1) references Megnevezes(ID)
);

create table Utodjai(
	U_ID INT(1) PRIMARY KEY,
	himek_versengese VARCHAR(20),
	vemh_ideje INT CHECK(vemh_ideje > 0),
	kolykok_szama INT CHECK(kolykok_szama > 0),
	tulelo_utodok_szama INT CHECK(tulelo_utodok_szama > 0),
	ID INT(1) references Megnevezes(ID)
);

insert into Megnevezes values(1,'Sziberiai tigris','Panthera tigris altaica','Parducformak','Pantherinae',1);
insert into Megnevezes values(2,'Del-kinai tigris','Panthera tigris amoyensis','Parducformak','Pantherinae',2);
insert into Megnevezes values(3,'Bali tigris','Panthera tigris balica','Parducformak','Pantherinae',3);
insert into Megnevezes values(4,'Indokinai tigris','Panthera tigris corbetti','Parducformak','Pantherinae',4);
insert into Megnevezes values(5,'Malaj tigris','Panthera tigris jacksoni','Parducformak','Pantherinae',5);
insert into Megnevezes values(6,'Javai tigris','Panthera tigris sondaica','Parducformak','Pantherinae',6);
insert into Megnevezes values(7,'Szumatrai tigris','Panthera tigris sumatrae','Parducformak','Pantherinae',7);
insert into Megnevezes values(8,'Bengali tigris','Panthera tigris tigris','Parducformak','Pantherinae',8);
insert into Megnevezes values(9,'Kaszpi tigris','Panthera tigris virgata','Parducformak','Pantherinae',9);

insert into Terulet values(1,'Kina','Sziberia',1,'nincs',1);
insert into Terulet values(2,'Kina','Kina',1,'nincs',2);
insert into Terulet values(3,'Bali','nincs',0,'1937',3);
insert into Terulet values(4,'Thaifold','Vietnam',1,'nincs',4);
insert into Terulet values(5,'Malajzia','Malajzia',1,'nincs',5);
insert into Terulet values(6,'Java','nincs',0,'1980',6);
insert into Terulet values(7,'Malajzia','Indonezia',1,'nincs',7);
insert into Terulet values(8,'India','Sundarbans',1,'nincs',8);
insert into Terulet values(9,'Kina','Sziberia',0,'1996',9);

insert into Megjelenes values(1,310,220,'vastag csikok','sotet sarga',1);
insert into Megjelenes values(2,250,150,'keskeny csikok','sarga',2);
insert into Megjelenes values(3,170,80,'keskeny csikok','narancs',3);
insert into Megjelenes values(4,250,200,'keskeny csikok','sotet sarga',4);
insert into Megjelenes values(5,200,100,'fekete-feher csikok','sarga',5);
insert into Megjelenes values(6,250,120,'keskeny csikok','narancs',6);
insert into Megjelenes values(7,220,110,'keskeny csikok','sotet sarga',7);
insert into Megjelenes values(8,330,260,'vastag csikok',' vilagos sarga',8);
insert into Megjelenes values(9,290,240,'keskeny csikok','voros',9);

insert into Ragadozo values(1,'ejszaka','fuves terulet','maganyos','nagytestu novenyevok',1);
insert into Ragadozo values(2,'barmikor','sziklas terulet','maganyos','patasok',2);
insert into Ragadozo values(3,'ejszaka','erdos resz','maganyos','kozepes emlosok',3);
insert into Ragadozo values(4,'barmikor','magas fuves terulet','maganyos','kozepes emlosok',4);
insert into Ragadozo values(5,'ejszaka','magas fuves terulet','maganyos','kozepes emlosok',5);
insert into Ragadozo values(6,'barmikor','erdos resz','maganyos','patasok',6);
insert into Ragadozo values(7,'ejszaka','sziklas terulet','maganyos','kozepes emlosok',7);
insert into Ragadozo values(8,'ejszaka','erdos resz','maganyos','nagyobb emlosok',8);
insert into Ragadozo values(9,'nappal','magas fuves terulet','maganyos','nagytestu novenyevok',9);

insert into Utodjai values(1,'agressziv',3,6,2,1);
insert into Utodjai values(2,'agressziv',3,6,3,2);
insert into Utodjai values(3,'nem tudni',4,3,1,3);
insert into Utodjai values(4,'passziv',4,5,2,4);
insert into Utodjai values(5,'agressziv',3,6,3,5);
insert into Utodjai values(6,'nem tudni',3,3,1,6);
insert into Utodjai values(7,'passziv',3,7,3,7);
insert into Utodjai values(8,'agressziv',3,4,3,8);
insert into Utodjai values(9,'nem tudni',4,3,1,9);
