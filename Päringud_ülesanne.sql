create database triger2tabelid;
use triger2tabelid;

create table toodekategooria(
toodekategooriaId int not null primary key identity (1,1),
toodekategooria varchar(100) unique,
kirjeldus text);

create table toode(
toodeId int not null primary key identity (1,1),
toodenimetus varchar(100) unique,
hind decimal(5,2),
toodekategooriaId int,
foreign key (toodekategooriaId) references toodekategooria(toodekategooriaId)
);

insert into toodekategooria(toodekategooria)
values ('joogid'), ('köögiviljad'), ('puuviljad'), ('meelelahutus'), ('liha')
select * from toodekategooria

insert into toode(toodenimetus, hind, toodekategooriaId)
values('Kino', 10, 4), ('Õunamahl', 1, 1), ('Kiwi', 4.50, 3), ('Teater', 100, 4),
('Porgand', 0.70, 2)


select * from toodekategooria
select * from toode
--PÄRING
--1
select t.toodeNimetus, tk.toodekategooria
from toode t
inner join toodekategooria tk
on t.toodekategooriaId=tk.toodekategooriaId

--2 leia kallim hind igas kategoorias
select tk.toodekategooria, max(t.hind)as Max_Hind
from toode t
inner join toodekategooria tk
on t.toodekategooriaId=tk.toodekategooriaId
group by tk.toodekategooria;

--3 Kuvada kõik kategooriad ja nende toodete arv.
select tk.toodekategooria, COUNT(t.toodenimetus) as toode_kogus
from toode t 
inner join toodekategooria tk
on t.toodekategooriaId=tk.toodekategooriaId
group by tk.toodekategooria 

--4
select tk.toodekategooria, cast(AVG(t.hind) as decimal(5,2)) as avg_hind
from toodekategooria tk
inner join toode t
on t.toodekategooriaId=tk.toodekategooriaId
group by tk.toodekategooria

--5
select tk.toodekategooria, t.toodenimetus
from toodekategooria tk
left join toode t
on t.toodekategooriaId=tk.toodekategooriaId
where t.toodekategooriaId IS NULL 

--6
select toodenimetus, hind 
from toode
where hind > (select AVG(hind) from toode)

--VIEW vaated
--1	Loo vaade, mis kuvab ainult toodete nime ja hinna.
select toodenimetus, hind from toode
create view Toode_Hind as
select toodenimetus, hind 
from toode
select * from Toode_Hind

--2 Loo vaade, mis näitab kõiki tooteid koos kategooria nimega.
create view toode_toodekategooria as
select t.toodeNimetus, tk.toodekategooria
from toode t
inner join toodekategooria tk
on t.toodekategooriaId=tk.toodekategooriaId
select * from toode_toodekategooria

--tabeli struktuuri muutmine, uue veergu lisamine
alter table toode
add aktiivne bit
update toode set aktiivne = 1
select * from toode
update toode set aktiivne = 0
where toodeId=3
--3 Loo vaade, mis kuvab ainult aktiivseid (nt saadaval olevaid) tooteid.
create view saadav_toode
as
select * from toode
where aktiivne = 1
select * from saadav_toode

--4 Loo vaade, mis koondab info: kategooria nimi, 
--toodete arv, minimaalne ja maksimaalne hind.
create view KategooriadInfo as
select toodekategooria,
COUNT(*) as 'Toodete Arv', 
cast(MIN(t.hind) as decimal(5,1)) as 'Min Hind',
cast(MAX(t.hind) as decimal(5,1)) as 'Max Hind'
from toodekategooria tk
inner join toode t
on t.toodekategooriaId=tk.toodekategooriaId
group by tk.toodekategooria;

select * from KategooriadInfo

--5 Loo vaade, mis arvutab toode käibemaksu (24%) ja iga toode hind käibemaksuga.
create view toode_kaibemaksuga as
select toodenimetus, hind,
CAST((hind * 0.24) as decimal(5,2)) as Kaibemaks,
CAST((hind * 1.24) as decimal(5,2)) as Hind_Kaibemaksuga
from toode

-- 1 Loo protseduur, mis lisab uue toote 
-- (sisendparameetrid: tootenimi, hind, kategooriaID).
create procedure toodesse_panna
@toodenimetus varchar(200),
@hind int,
@toodekategooriaId int,
@aktiivne bit
as
begin
insert into toode(toodenimetus, hind, toodekategooriaId, aktiivne)
values (@toodenimetus, @hind, @toodekategooriaId, @aktiivne);
select * from toode
end

exec toodesse_panna 'kohv', 1, 1, 0

-- 2 Loo protseduur, mis uuendab toote hinda vastavalt tooteID-le.
create procedure update_hind
@toodeId int,
@hind decimal(5,2)
as 
begin 
select * from toode
update toode set hind=@hind
where toodeId = @toodeId
select * from toode
end;

exec update_hind 3, 3.5

-- 3 Loo protseduur, mis kustutab toote ID järgi.
create procedure KustutaToode
@toodeId int
as
begin 
delete from toode
where toodeId=@toodeId;
select * from toode
end;

exec KustutaToode 1;

-- 4 Loo protseduur, mis tagastab kõik tooted valitud kategooriaID järgi.
create procedure LeiaToodekategooriaJargi
@kategooria varchar (30)
as 
begin 
select t.toodeNimetus, t.hind, tk.toodekategooria
from toode t
inner join toodekategooria tk
on t.toodekategooriaId=tk.toodekategooriaId
where tk.toodekategooria = @kategooria
end;

drop procedure LeiaToodekategooriaJargi
exec LeiaToodekategooriaJargi joogid;

-- 5 Loo protseduur, mis tõstab kõigi toodete hindu kindlas
--   kategoorias kindla protsendi võrra.
create procedure Protsenti
@kategooriaId int
as
begin
select * from toode;
update toode set hind = hind * (1 + 0.15)
where toodekategooriaId=@kategooriaId
select * from toode
end;
drop procedure Protsenti

exec Protsenti 1

-- 6 Loo protseduur, mis kuvab kõige kallima toote kogu andmebaasis.
create procedure KallimHind
as 
begin 
select top 1 * from toode
order by hind desc
end;
exec KallimHind


select * from toode


--kustutamine toodeId=3 ja võtme tagasi
begin Transaction;
delete from toode Where toodeId=3;
select * from toode;
Rollback;
select * from toode;


--uuendame terve tabeli ja aktiivne=0 ja võtame tagasi
begin Transaction;
Update toode set aktiivne = 0;
select * from toode;
Rollback;
select * from toode;

--salvestame transaktsiooni ja võtame tagasi
begin Transaction;
insert into toode(toodenimetus, hind, toodekategooriaId, aktiivne)
values ('Bowling', 100, 4, 1);
select * from toode;
Rollback;
select * from toode;
