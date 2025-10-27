create database raamat;
use raamat;
create table Autor (
AutorID int primary key identity(1,1),
AutorNimi varchar (50),
Riik varchar(50))

create table Raamat (
RaamatID int primary key identity(1,1),
Pealkiri varchar(50),
AutorID int,
foreign key (AutorID) references Autor(AutorID),
LehekülgedeArv int)

create table Laenutus (
LaenutusID int primary key identity(1,1),
RaamatID int,
foreign key (RaamatID) references Raamat(RaamatID),
LaenutajaNimi varchar(50),
LaenutuseKuupäev Date)

insert into Autor (AutorNimi, Riik)
values 
('J.K. Rowling', 'Suurbritannia'),
('George Orwell', 'Suurbritannia'),
('J.R.R. Tolkien', 'Suurbritannia'),
('Stephen King', 'USA'),
('Agatha Christie', 'Suurbritannia')

select * from Autor

insert into Raamat (Pealkiri, AutorID, LehekülgedeArv)
values 
('Harry Potter ja Kivi Filosoofi', 1, 223),
('1984', 2, 328),
('Sõrmuste Isand: Esimene Raamat', 3, 423),
('Shining', 4, 447),
('Mõrvarid' , 5, 395)

select * from Raamat

insert into Laenutus (RaamatID, LaenutajaNimi, LaenutuseKuupäev)
values
(1, 'Andres Tamm', '2023-09-15'),
(2, 'Mari Liis', '2023-09-10'),
(3, 'Kati Saar', '2023-10-01'),
(4, 'Jaanus Kallas', '2023-09-20'),
(5, 'Helen Maas', '2023-09-22')

select * from Laenutus

--trigger
Create Trigger RaamatLisamine
On Raamat
for insert
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_USER,
'Raamat on lisatud',
CONCAT(
'Pealkiri: ', i.Pealkiri,  ' , ', 
'Autor: ', a.AutorNimi,  ' , ', 
'LehekülgedeArv: ', i.LehekülgedeArv)
from inserted i
INNER JOIN Autor a ON i.AutorID = a.AutorID;
--trigeri tegevuse kontroll
insert into Raamat(Pealkiri, AutorID, LehekülgedeArv)
Values('text', 2, 342);
select * from Raamat;
select * from logi;

Create Trigger RaamatKustutamine
On Raamat
For delete 
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_USER,
'Raamat on kustuta',
CONCAT(
'Pealkiri: ', d.Pealkiri,  ' , ', 
'Autor: ', a.AutorNimi,  ' , ', 
'LehekülgedeArv: ', d.LehekülgedeArv)
from deleted d
INNER JOIN Autor a ON d.AutorID = a.AutorID;
--kontroll
delete from Raamat where RaamatID = 13;
select * from Raamat;
select * from logi;

--procedure
create procedure RaamatOtsing
@autor varchar(50)
as
begin
select r.RaamatID, r.Pealkiri, a.AutorNimi, r .LehekülgedeArv from Raamat r
inner join Autor a ON r.AutorID = a.AutorID
where a.AutorNimi = @autor;
end;

EXEC RaamatOtsing 'J.R.R. Tolkien'

--transaktsioon
begin Transaction;
SAVE TRANSACTION SP1;
select * from Raamat;
insert into Raamat (Pealkiri, AutorID, LehekülgedeArv)
values ('Text', 1, 1452)
select * from Raamat;

select * from Raamat
rollback Transaction SP1;
select * from Raamat

--13
create table KogusRaamat (
KogusID int identity (1,1) primary key, 
RaamatID int, 
foreign key (RaamatID) references Raamat(RaamatID), 
Kogus int)

insert into KogusRaamat (RaamatID, Kogus)
values (1, 3), (2,8), (3, 4), (4,7), (5,1) 
select * from KogusRaamat

create procedure KogusRaamat_Otsing
@pealkiri varchar(50)
as
begin
select r.Pealkiri AS Raamat, a.AutorNimi AS Autor, k.Kogus
    from Raamat r
    inner join Autor a on r.AutorID = a.AutorID
    inner join KogusRaamat k on k.RaamatID = r.RaamatID
    where r.Pealkiri = @pealkiri 
end;

exec KogusRaamat_Otsing '1984';



--------------------------------------------------------------------------------------------------------------------------------
grant select, insert on Raamat to opilaneNimi
grant select, insert on Autor to opilaneNimi
grant select, insert on Laenutus to opilaneNimi

deny update, delete on Raamat to opilaneNimi
deny update, delete on Autor to opilaneNimi
deny update, delete on Laenutus to opilaneNimi

deny update, delete, select, insert on logi to opilanenimi
