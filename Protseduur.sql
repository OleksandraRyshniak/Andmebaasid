--SQl salvestatud protseduur - funktsioon, mis käivitab serveris mitu SQL tegevust järjest.
Kasutame SQL Server

Create database protseduurRyshniak;
use protseduurRyshniak;
Create table linn(
linnId int primary key identity(1,1),
linnNimi varchar(30),
rahvaArv int);
select * from linn;
insert into linn(linnNimi, rahvaArv)
Values('Tallinn', 60000), ('Tartu', 40000), ('Narva', 30000);

--Protseduuri loomine
--protseduur(fünksiion), mis lisab uus linn ja kohe näitab tabelis

create procedure lisaLinn
@lnimi varchar(30),
@rArv int
AS
Begin
insert into linn(linnNimi, rahvaArv)
Values(@lnimi, @rArv);
SELECT * FROM linn;
end;

--protseduuri kutse
EXEC lisaLinn @lnimi='Pärnu', @rARv=1234
--lihtsam
EXEC lisaLinn 'Rakvere', 7895

-- kirje kustutamine
DELETE From linn Where linnID=5

--protseduur, mis kustutab linn id järgi
Create procedure kustutaLinn
@deleteID int
AS
begin
select * from linn;
DELETE From linn Where linnID=@deleteID;
select * from linn;
end;

--kutse
EXEC kustutaLinn 4;
--proceduri kustutamine
DROP procedure kustutaLinn;

--Protseduur, mis otsib linn esimese tähte järgi
Create procedure linnaOtsing
@taht char(1)
AS
begin
SELECT * from linn
Where linnNimi LIKE @taht + '%';
--% - kõik teised tähed
end;
--kutse
EXEC linnaOtsing T;

create procedure rahvaArvuUuendus
@linnID int,
@koef decimal(2,1)
AS
begin
select * from linn;
UPDATE linn SET rahvaArv=rahvaArv*@koef
Where linnId=@linnID;
select * from linn;
end;
--
drop procedure rahvaArvuUuendus;

exec rahvaArvuUuendus 1, 1.2


--------------------------------------------------------------------------------------------------
kasutame XAMPP / localhost

Create table linn(
linnId int primary key AUTO_INCREMENT,
linnNimi varchar(30),
rahvaArv int);
insert into linn(linnNimi, rahvaArv)
Values('Tallinn', 60000), ('Tartu', 40000), ('Narva', 30000);
 ------------------------------------------------------------------------------------------------

create database protseduurryshniak
use protseduurryshniak
Create table linn(
linnId int primary key identity(1,1),
linnNimi varchar(30),
rahvaArv int);
select * from linn;
insert into linn(linnNimi, rahvaArv)
Values('Tallinn', 60000), ('Tartu', 40000), ('Narva', 30000);

create procedure lisalinn
@lnimi varchar(30),
@rArv int
As
Begin
insert into linn(linnNimi, rahvaArv)
Values(@lnimi, @rArv);
End;
exec lisalinn 'Pärnu', 35000

--uue veeru lisamine
Alter table linn Add test int;
--veeru kustutamine
alter table linn drop Column test;

create procedure veeruLisaKustuta
@valik varchar(20),
@veerunimi varchar(20),
@tyyp varchar (20) =null


as
begin
declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('Alter table linn  Add ', @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('Alter table linn  drop column  ', @veerunimi)
end;
print @sqltegevus;
begin
exec (@sqltegevus);
end;
end;

--kutse
exec veeruLisaKustuta @valik='drop', @veerunimi='test3';
select * from linn;

exec veeruLisaKustuta @valik='add', @veerunimi='test3', @tyyp='int';
select * from linn;


create procedure veeruLisaKustutaTabelis
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tyyp varchar (20) =null

as
begin
declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('Alter table ', @tabelinimi, ' Add ', @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('Alter table ', @tabelinimi, ' drop column ', @veerunimi)
end;
print @sqltegevus;
begin
exec (@sqltegevus);
end;
end;

--kutse
exec veeruLisaKustutaTabelis @valik='add', @tabelinimi='linn', @veerunimi='test3', @tyyp='int';
select * from linn;

exec veeruLisaKustutaTabelis @valik='drop', @tabelinimi='linn', @veerunimi='test3';
select * from linn;

--protseduur tingimusega
Create procedure rahvaHinnang
@piir int
as
begin
select linnNimi, rahvaArv, Iif(rahvaArv<@piir, 'väike linn', 'suur linn') as Hinnang
From linn;
end;

drop procedure rahvaHinnang;

exec rahvaHinnang 40000;
--Agregaat funksioonid: sum(), AVG(), MIN(), MAX(), COUNT()
--*- количество заполненых строчек  в таблице

Create procedure kokkuRahvaarv

As
Begin
select SUM(rahvaArv) as 'kokku rahvaArv', AVG(rahvaArv) as 'keskmine rahvaArv', count(*) as 'linna'
From linn;
end;

exec kokkuRahvaarv;
