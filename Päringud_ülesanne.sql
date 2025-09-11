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
