-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-05-22 06:06:50.443

Create database Loom
use Loom;

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
    Id_loomaklass int  NOT NULL,
    Sunnipaev date  NOT NULL,
    Kala varchar(50)  NOT NULL,
    Vanus int  NOT NULL,
    CONSTRAINT Loom_pk PRIMARY KEY  (Id_loomad)
);

-- Table: Loomaklass
CREATE TABLE Loomaklass (
    Id_loomaklass int  NOT NULL,
    Klass varchar(50)  NOT NULL,
    CONSTRAINT Loomaklass_pk PRIMARY KEY  (Id_loomaklass)
);

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
    FOREIGN KEY (Id_loomaklass)
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


insert into Loomaklass(Id_loomaklass,Klass)
values (1, 'Imetajad'), (2, 'Linnud'), 
(3, 'Roomajad'), (4, 'Kahepaiksed'), (5, 'Kalad')

select * from Loomaklass

insert into Loom(Id_loomad, Nimi, Id_loomaklass, Sunnipaev, Kala, Vanus)
values (1, 'Karu', 1, '2020-09-10', '24kg', 4),
(2, 'Kotkas', 2, '2023-07-25', '5kg', 1),
(3, 'Madu', 3, '2017-10-05', '6kg', 7),
(4, 'Hunt', 1, '2020-08-12', '10kg', 4),
(5, 'Karpkala', 5, '2013-05-16', '5kg', 12)

select * from Loom

insert into Tootaja(Id_Tootaja, Nimi, Perenimi)
values(1, 'Nikita', 'Ivanov'), (2, 'Stas', 'Ukov'),
(3, 'Stasy', 'Petrova'), (4, 'Katrin', 'Simonova'), (5, 'Peter', 'Petrov')

select * from Tootaja

insert into Toit (Id_toit, Toit)
values (1, 'Kala'), (2, 'Kiskjate sööt'), (3, 'Köögiviljad'), 
(4, 'Heina'), (5, 'Toit kaladele')

select * from Toit

insert into Toitumine (Id_toitumine, Loom_Id_loomad,Tootaja_Id_Tootaja, Toit_Id_toit)
values (1,1,2,1), (2,2,1,2), (3,3,5,2), (4,4,4,1), (5,5,3,5)

select * from Toitumine

insert into Jalutusaed (Id_Jalutusaed, Nr_jalutusaed)
values (1, 123), (2, 342), (3, 564), (4, 112), (5, 231)

select * from Jalutusaed

insert into Paikkond (Id_paikkond, Paikkond_nimi, Jalutusaed_Id_Jalutusaed)
values(1, 'Kiskajate', 3), (2, 'Akvaarium', 4), (3, 'Roomajate maja', 1), (4, 'Lasteala', 5),
(5, 'Linnumaja', 2)

select * from Paikkond

insert into Asukoht (Id_asukoht, Loom_Id_loomad, Paikkond_Id_paikkond, Jalutusaed_Id_Jalutusaed)
values (1,1,1,3), (2,2,5,2), (3,3,3,1), (4,4,1,3), (5,5,2,4)

select * from Asukoht

Create table logi(
id int identity(1,1) PRIMARY KEY,
aeg DATETIME,
toiming  varchar(100),
andmed varchar(200),
kasutaja varchar(100),
)
select * from logi

create trigger Loom_klassUuendamine
On Loom
For update
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_User,
'Loom on uuendatud',
Concat ('vanad andmed: ', d.Id_loomad,' , ', d.Nimi, ' , ', lk1.Klass, ' , ', d.Sunnipaev, ' , ', d.Kala, ' , ', d.Vanus,
' || uued andmed: ', i.Id_loomad, ' , ', i.Nimi,' , ', lk2.Klass,' , ', i.Sunnipaev, ' , ', i.Kala, ' , ', i.Vanus)
    FROM deleted d
    INNER JOIN inserted i ON d.Id_loomad = i.Id_loomad
    INNER JOIN Loomaklass lk1 ON d.Id_loomaklass = lk1.Id_loomaklass
    INNER JOIN Loomaklass lk2 ON i.Id_loomaklass = lk2.Id_loomaklass;

Update Loom set Id_loomaklass=1
WHERE Id_loomad=2;
select * from Loom; 
select * from logi;

select * from Loom

drop trigger LoomLisamine
Create Trigger LoomLisamine
On Loom
For insert 
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_USER,
'linn on lisatud',
CONCAT('Id: ', i.Id_loomad , ' , ',
'Nimi: ', i.Nimi,  ' , ', 
'Klass: ', lk.Klass,  ' , ', 
'Sünnipäev: ', i.Sunnipaev, ' , ', 
'Kala: ', i.Kala, ' , ', 
'Vanus: ', i.Vanus)
from inserted i
INNER JOIN Loomaklass lk ON i.Id_loomaklass = lk.Id_loomaklass;

--trigeri tegevuse kontroll
insert into Loom(Id_loomad, Nimi, Id_loomaklass, Sunnipaev, Kala, Vanus)
Values(6, 'Madu', 3, '2017-05-16', '5kg', 5);
select * from Loom;
select * from logi;

Create Trigger LoomKustutamine
On Loom
For delete 
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_USER,
'linn on kustuta',
CONCAT('Id: ', d.Id_loomad , ' , ',
'Nimi: ', d.Nimi,  ' , ', 
'Klass: ', lk.Klass,  ' , ', 
'Sünnipäev: ', d.Sunnipaev, ' , ', 
'Kala: ', d.Kala, ' , ', 
'Vanus: ', d.Vanus)
from deleted d
INNER JOIN Loomaklass lk ON d.Id_loomaklass = lk.Id_loomaklass;

delete from Loom where Id_loomad = 6;
select * from Loom;
select * from logi;

---------------------------------------------------------------------------
Grant select, update, insert, delete on Loom to Töötaja
Grant select, insert on Loomaklass to Töötaja
Deny delete, update on Loomaklass to Töötaja
Grant select, insert, delete on Toit to Töötaja
Deny update on toit to Töötaja
Grant select, update, insert, delete on Toitumine to Töötaja
Grant select, insert on Jalutusaed to Töötaja
Deny delete, update on Jalutusaed to Töötaja
Grant select, insert on Paikkond to Töötaja
Deny delete, update on Paikkond to Töötaja
Grant select, insert, delete on Asukoht to Töötaja
Deny update on Asukoht to Töötaja

Grant select on logi to Töötaja
