CREATE TABLE opilane(
opilaneId int primary key AUTO_INCREMENT,
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
);
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
4.5);
DElETE FROM opilane WHERE opilaneId=1;
drop table opilane;

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

INSERT into Language(ID, Code, Language)
VALUES (2, 'RUS', 'vene'), (3, 'ENG', 'inglise'), (4, 'DE', 'saksa')

create table keeleValik(
keeleValikId int primary key AUTO_INCREMENT,
valikuNimetus varchar(10) not null,
opilaneId int,
Foreign key (opilaneId) references opilane(opilaneId),
language int,
Foreign key (Language) references Language(ID)
);

insert into keelevalik(valikuNimetus, opilaneId, Language)
Values ('valik B', 6, 2)
