create database Autor;
create table Autorid (
Autori_ID int primary key identity(1,1),
Eesnimi varchar(25),
Perekonnanimi varchar(25),
Sunniaasta date,
Sunnikoht varchar(25),
Rahvus varchar(25),
Elukoht varchar(25),
CV varchar(3),
Portree varchar (3),
Kodulehekülg varchar(25))
insert into Autorid(Eesnimi, Perekonnanimi, Sunniaasta, Sunnikoht, Rahvus, Elukoht, CV, Portree, Kodulehekülg)
values('Peter', 'Petre1', '1905-06-04', 'Eesti', 'Eestlane', 'Eesti', 'Jah', 'Ei', 'peter.peter1.ee'),
('Nikolay', 'Nikolay1', '1905-05-28', 'Venemaa', 'Venelane', 'Saksamaa', 'Jah', 'Jah', 'nikolay.2000.ru'),
('Stepan', 'Stepan1', '1905-02-07', 'Ukraina', 'Ukrainlane', 'Ukraina', 'Ei', 'Jah', 'stepan_.ua'),
('Nikoli', 'Nikoli1', '1905-05-31', 'Rootsi', 'Rootslane', 'Ukraina', 'Jah', 'Ei', 'nikoli-nikoli1.ua')

create table Teose_Likk(Liigi_ID int primary key identity(1,1),
Selgitav_text varchar(13))
insert into Teose_Likk(Selgitav_text)
values('romaan'), ('novell'), ('lühijutt'),('näidend'), ('muinasjutt')

create table Teose(Teose_ID int primary key identity(1,1), 
Pealkiri varchar(25),
Ilmumiskoht varchar(25),
Ilmumisaasta varchar(25),
Lk int,
Liigi_ID int,
foreign key (Liigi_ID) references Teose_Likk(Liigi_ID),
Kirjastus varchar(25));
insert into Teose(Pealkiri, Ilmumiskoht, Ilmumisaasta, Lk, Liigi_ID, Kirjastus)
values('Tuhkatriinu', 'Prantsusmaa', '2023-05-17', 458, 5, 'Eesti Raamat'),
('Veehane', 'Taan', '2022-11-08', 965, 2, 'Varrak'),
('Oblomov', 'Venemaa', '2023-05-12', 256, 1, 'Tavapaev')

create table Autorlus(Teose_ID int,
foreign key (Teose_ID) references Teose(Teose_ID),
Autori_ID int,
foreign key (Autori_ID) references Autorid(Autori_ID));
insert into Autorlus(Teose_ID, Autori_ID)
values(1,1), (2,1),(3,2);

create table Kasutamine(Sissekande_nr int primary key identity(1,1),
Teose_ID int,
foreign key (Teose_ID) references Teose(Teose_ID),
Kasutusviisi_kirjeldus varchar(25));
insert into Kasutamine(Teose_ID, Kasutusviisi_kirjeldus)
values (1, 'Veebileht'), (2, 'Rakendus'), (3, 'Raamatud');

select * from Autorid, Teose_Likk, Teose, Autorlus, Kasutamine


SELECT Teose_ID, Autori_ID
FROM Autorlus
WHERE Autori_ID=(select Autori_ID from Autorid where Eesnimi='Peter');

SELECT *
FROM Autorid
WHERE Sunnikoht='Eesti';

SELECT Autorlus.Teose_ID, Autorlus.Autori_ID
FROM Autorlus
WHERE (((Autorlus.[Autori_ID])=(select Autori_ID from Autorid where Eesnimi='Peter')));

SELECT avg(Lk) AS ['Keskmine lehtede arv']
FROM Teose;

SELECT Pealkiri, Liigi_ID
FROM Teose
WHERE Liigi_ID=5;

SELECT Autorid.Eesnimi, Autorid.Perekonnanimi, 2025 - Year(Sunniaasta) AS Vanus
FROM Autorid;
