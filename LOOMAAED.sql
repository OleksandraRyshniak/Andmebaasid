-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-05-22 06:06:50.443
use Loomaaed
-- tables
-- Table: Asukoht
CREATE TABLE Asukoht (
    Id_asukoht int  NOT NULL,
    Loom_Id_loomad int  NOT NULL,
    Paikkond_Id_paikkond int  NOT NULL,
    Jalutusaed_Id_Jalutusaed int  NOT NULL,
    CONSTRAINT Asukoht_pk PRIMARY KEY  (Id_asukoht)
);


-- Table: Jalutusaed
CREATE TABLE Jalutusaed (
    Id_Jalutusaed int  NOT NULL,
    Nr_jalutusaed int  NOT NULL,
    CONSTRAINT Jalutusaed_pk PRIMARY KEY  (Id_Jalutusaed)
);

-- Table: Loom
CREATE TABLE Loom (
    Id_loomad int  NOT NULL,
    Nimi varchar(50)  NOT NULL,
    Loomaklass_Id_loomaklass int  NOT NULL,
    Sunnipaev date  NOT NULL,
    Kala varchar(50)  NOT NULL,
    Vanus int  NOT NULL,
    CONSTRAINT Loom_pk PRIMARY KEY  (Id_loomad)
);

-- Table: Loomaklass
create table Loomaklass(
Id_loomaklass int primary key,
Klass varchar(50))

insert into Loomaklass(Id_loomaklass, Klass)
values
(1, 'Imetajad'), 
(2, 'Linnud'), 
(3, 'Roomajad'), 
(4, 'Kahepaiksed'),
(5, 'Kalad')

-- Table: Paikkond
CREATE TABLE Paikkond (
    Id_paikkond int  NOT NULL,
    Paikkond_nimi varchar(50)  NOT NULL,
    Jalutusaed_Id_Jalutusaed int  NOT NULL,
    CONSTRAINT Paikkond_pk PRIMARY KEY  (Id_paikkond)
);

-- Table: Toit
CREATE TABLE Toit (
    Id_toit int  NOT NULL,
    Toit varchar(50)  NOT NULL,
    CONSTRAINT Toit_pk PRIMARY KEY  (Id_toit)
);

-- Table: Toitumine
CREATE TABLE Toitumine (
    Id_toitumine int  NOT NULL,
    Loom_Id_loomad int  NOT NULL,
    Tootaja_Id_Tootaja int  NOT NULL,
    Toit_Id_toit int  NOT NULL,
    CONSTRAINT Toitumine_pk PRIMARY KEY  (Id_toitumine)
);

-- Table: Tootaja
CREATE TABLE Tootaja (
    Id_Tootaja int  NOT NULL,
    Nimi varchar(50)  NOT NULL,
    Perenimi varchar(50)  NOT NULL,
    CONSTRAINT Tootaja_pk PRIMARY KEY  (Id_Tootaja)
);

-- foreign keys
-- Reference: Asukoht_Jalutusaed (table: Asukoht)
ALTER TABLE Asukoht ADD CONSTRAINT Asukoht_Jalutusaed
    FOREIGN KEY (Jalutusaed_Id_Jalutusaed)
    REFERENCES Jalutusaed (Id_Jalutusaed);

-- Reference: Asukoht_Loom (table: Asukoht)
ALTER TABLE Asukoht ADD CONSTRAINT Asukoht_Loom
    FOREIGN KEY (Loom_Id_loomad)
    REFERENCES Loom (Id_loomad);

-- Reference: Asukoht_Paikkond (table: Asukoht)
ALTER TABLE Asukoht ADD CONSTRAINT Asukoht_Paikkond
    FOREIGN KEY (Paikkond_Id_paikkond)
    REFERENCES Paikkond (Id_paikkond);

-- Reference: Loom_Loomaklass (table: Loom)
ALTER TABLE Loom ADD CONSTRAINT Loom_Loomaklass
    FOREIGN KEY (Loomaklass_Id_loomaklass)
    REFERENCES Loomaklass (Id_loomaklass);

-- Reference: Paikkond_Jalutusaed (table: Paikkond)
ALTER TABLE Paikkond ADD CONSTRAINT Paikkond_Jalutusaed
    FOREIGN KEY (Jalutusaed_Id_Jalutusaed)
    REFERENCES Jalutusaed (Id_Jalutusaed);

-- Reference: Toitumine_Loom (table: Toitumine)
ALTER TABLE Toitumine ADD CONSTRAINT Toitumine_Loom
    FOREIGN KEY (Loom_Id_loomad)
    REFERENCES Loom (Id_loomad);

-- Reference: Toitumine_Toit (table: Toitumine)
ALTER TABLE Toitumine ADD CONSTRAINT Toitumine_Toit
    FOREIGN KEY (Toit_Id_toit)
    REFERENCES Toit (Id_toit);

-- Reference: Toitumine_Tootaja (table: Toitumine)
ALTER TABLE Toitumine ADD CONSTRAINT Toitumine_Tootaja
    FOREIGN KEY (Tootaja_Id_Tootaja)
    REFERENCES Tootaja (Id_Tootaja);

-- End of file.

insert into Loom(Id_loomad, Nimi, Loomaklass_Id_loomaklass, Sunnipaev, Kala, Vanus)
values
(1, 'Karu', 1, '2020-09-10', '24kg', 4),
(2, 'Kotkas', 2, '2023-07-25', '5kg', 1),
(3, 'Madu', 3, '2017-10-05', '6kg', 7),
(4, 'Hunt', 1, '2020-08-12', '10kg', 4),
(5, 'Karpkala', 5, '2013-05-16', '5kg', 12)

insert into Tootaja(Id_Tootaja, Nimi, Perenimi)
values
(1, 'Nikita', 'Ivanov'),
(2, 'Stas', 'Ukov'),
(3, 'Stasy', 'Petrova'),
(4, 'Katrin', 'Simonova'),
(5, 'Peter', 'Petrov')

insert into Toit(Id_toit, Toit)
values(1, 'Kala'), 
(2, 'Kiskjate sööt'), 
(3, 'Köögiviljad'), 
(4, 'Heina'), 
(5, 'Toit kaladele')

insert into Toitumine(Id_toitumine, Loom_Id_loomad, Tootaja_Id_Tootaja, Toit_Id_toit)
values
(1, 1, 2, 1), 
(2, 2, 1, 2),
(3, 3, 5, 2),
(4, 4, 4, 1),
(5, 5, 3, 5)

insert into Jalutusaed(Id_Jalutusaed, Nr_jalutusaed)
values
(1, 123), (2, 342), (3, 564), (4, 112), (5, 231)

insert into Paikkond(Id_paikkond, Paikkond_nimi, Jalutusaed_Id_Jalutusaed)
values
(1, 'Kiskajate', 3),
(2, 'Akvaarium', 4),
(3, 'Roomajate maja', 1),
(4, 'Lasteala', 5),
(5, 'Linnumaja', 2)

insert into Asukoht(Id_asukoht, Loom_Id_loomad, Paikkond_Id_paikkond, Jalutusaed_Id_Jalutusaed)
values
(1, 1, 1, 3), (2, 2, 5, 2), (3, 3, 3, 1), (4, 4, 1, 3), (5, 5, 2, 4)


begin Transaction;
Delete from Toit Where Id_toit=3;
select * from Toit;
ROLLBACK;
select * from Toit;

begin Transaction;
Update Tootaja set Perenimi='Dubov' where Id_Tootaja=5;
select * from Tootaja;
ROLLBACK;
select * from Tootaja;


begin Transaction;
insert into Tootaja(Id_Tootaja, Nimi, Perenimi)
values (6, 'Mira', 'Fedorova');
select * from Tootaja;

create view paikkond_looma as 
select a.Paikkond_Id_paikkond, l.Nimi, l.Kala, l.Vanus
from Loom l inner join Asukoht a
on L.Id_loomad=a.Loom_Id_loomad
where Id_loomad=2

select * from paikkond_looma

create view loomaklass_loom as
select lo.Klass, l.Nimi
from Loomaklass lo inner join Loom l
on lo.Id_loomaklass=l.Loomaklass_Id_loomaklass
select * from loomaklass_loom

create view paikkond_jalutusaed_view as
select p.Paikkond_nimi, j.Nr_jalutusaed
from Paikkond p inner join Jalutusaed j
on j.Id_Jalutusaed=p.Jalutusaed_Id_Jalutusaed
where Id_paikkond=4
select * from paikkond_jalutusaed_view
