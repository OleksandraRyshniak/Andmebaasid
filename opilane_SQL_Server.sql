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


CREATE DATABASE epoodRyshniak;
use epoodRyshniak;

CREATE TABLE Category (
idCategory int Primary key identity(1,1),
CategoryName varchar(25) UNIQUE
);
select * from Category;
INSERT INTO Category (CategoryName)
Values ('jook'), ('söök');

-- TABELI struktuuri muutmine-->uue veergu lisamine
Alter table Category ADD test int;

-- TABELI struktuuri muutmine-->uue veergu kustamine
Alter table Category DROP COLUMN test;

create table Product (
idProduct int Primary key identity(1,1), 
ProductName varchar(25) UNIQUE, 
idCategory int,
Foreign key (idCategory) references Category(idCategory),
Price decimal(2,1)
)
insert into Product(ProductName, idCategory, Price)
VALUES
('fanta',
1,
2.5),
('sugar',
2,
0.7)
select * from Product
select * from Category

create table Sale(
idSale int primary key identity (1,1),
idProduct int,
Foreign key (idProduct) references Product(idProduct),
idCustomer int,
Count_ int,
DateOfSale date);

--kustutab kõik kirjed
DELETE From Sale;

Create table Customer(
idCustomer int primary key identity (1,1),
Name varchar(25),
contact text)
--tabeli muutmine --> FK lisamine
Alter table Sale add foreign key (idCustomer) references Customer(idCustomer)
--tabeli Customer täitmine
-- tabeli Sale täitmine

insert into Customer (Name, contact)
values(
'Nikita',
'+37255905578'),
('Oleksandra',
'+37245780954'),
('Mariia',
'+37245678901'),
('Stas',
'+37245678901'),
('Oleg',
'+37267890123')
select * from Customer
delete from Customer
insert into Sale (idProduct, idCustomer, Count_, DateofSale)
values(
1,
1,
12,
'2025-01-30'),
(3,
2,
2,
'2025-01-30'),
(4,
3,
1, 
'2025-01-30'),
(5,
4,
18,
'2025-01-30'),
(6,
5,
23,
'2025-01-30')

select * from Category
select * from Product
select * from Sale
select * from Customer

insert into Product(ProductName, idCategory, Price)
VALUES 
('mahl',
1,
2.2),
('juust',
2,
1.5),
('vesi',
1,
0.5),
('fanta',
1,
2.5),
('sugar',
2,
0.7)
