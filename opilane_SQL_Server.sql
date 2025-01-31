--AB loomine
Create database RyshniakBaas;

use RyshniakBaas;
CREATE TABLE opilane(
opilaneId int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane(
eesnimi,
perenimi,
synniaeg,
stip,
keskmine_hinne)
VALUES(
'Nikita',
'Nikita',
'2008-12-12',
1,
4.5),
(
'Nikita2',
'Nikita2',
'2008-12-12',
1,
4.5),
(
'Nikita3',
'Nikita3',
'2008-12-12',
1,
4.5),
(
'Nikita4',
'Nikita4',
'2008-12-12',
1,
4.5),
(
'Nikita5',
'Nikita5',
'2008-12-12',
1,
4.5)

--tabeli kustutamine
drop table opilane;
--rida kustutamine, kus on opilaneId=2
DElETE FROM opilane WHERE opilaneId=1;
select * from opilane;

--andmete uuendamine
UPDATE opilane SET aadress='Tartu'
WHERE opilaneId=3
--AB loomine
Create database RyshniakBaas;

use RyshniakBaas;
CREATE TABLE opilane(
opilaneId int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane(
eesnimi,
perenimi,
synniaeg,
stip,
keskmine_hinne)
VALUES(
'Nikita',
'Nikita',
'2008-12-12',
1,
4.5),
(
'Nikita2',
'Nikita2',
'2008-12-12',
1,
4.5),
(
'Nikita3',
'Nikita3',
'2008-12-12',
1,
4.5),
(
'Nikita4',
'Nikita4',
'2008-12-12',
1,
4.5),
(
'Nikita5',
'Nikita5',
'2008-12-12',
1,
4.5)

--tabeli kustutamine
drop table opilane;
--rida kustutamine, kus on opilaneId=2
DElETE FROM opilane WHERE opilaneId=1;
select * from opilane;

--andmete uuendamine
UPDATE opilane SET aadress='Tartu'
WHERE opilaneId=3

create table Language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);
select * from Language;

INSERT into Language(ID, Code, Language)
VALUES (2, 'RUS', 'vene'), (3, 'ENG', 'inglise'), (4, 'DE', 'saksa')

create table keeleValik(
keeleValikId int primary key identity(1,1),
valikuNimetus varchar(10) not null,
opilaneId int,
Foreign key (opilaneId) references opilane(opilaneId),
language int,
Foreign key (Language) references Language(ID)
)
select * from keeleValik;
select * from Language;
select * from opilane;

insert into keelevalik(valikuNimetus, opilaneId, Language)
Values ('valik B', 6, 2)

DElETE FROM keelevalik WHERE keeleValikId=5;

SELECT opilane.eesnimi, Language.Language 
From opilane, Language, keelevalik
Where opilane.opilaneId=keelevalik.opilaneID
AND Language.ID=keelevalik.Language

SELECT * From opilane, Language, keelevalik
Where opilane.opilaneId=keelevalik.opilaneID
AND Language.ID=keelevalik.Language

create table oppimine(
oppimineID int primary key identity(1,1),
aine varchar(25) NOT NULL,
aasta varchar(25) NOT NULL,
opetaja varchar (25) Not null,
opilaneId int,
Foreign key (opilaneId) references opilane(opilaneId),
hinne int)
INSERT INTO oppimine(
aine,
aasta,
opetaja,
hinne)
VALUES(
'ajalugu',
'2025',
'opetaja',
4)
insert into oppimin


select * from oppimine
viga kood!
