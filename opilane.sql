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
