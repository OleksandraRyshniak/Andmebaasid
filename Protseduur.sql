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
