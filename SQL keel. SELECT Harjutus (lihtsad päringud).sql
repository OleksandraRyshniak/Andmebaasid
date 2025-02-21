use koolRyshniak;
create table autod(
Mark varchar(50),
RegNr varchar(10) primary key,
Aasta int,
RegPiirk int)

insert into autod(Mark, RegNr, Aasta, RegPiirk)
values 
('Audi', '123 ABC', 2000, 1),
('Ford', '777 AAA', 1988, 2),
('Ford', 'FIN 772', 2002, 1),
('Nissan', '111 CCC', 2006, 1),
('Toyota', '128 HGT', 2003, 1),
('VAZ', '544 CCH', 1960, 2);

select * from autod;

insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Mercury', '#e88d7c', 1985, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Chevrolet', '#d63763', 2008, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Toyota', '#01ee97', 1978, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Mazda', '#8b1a52', 1988, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('BMW', '#a82a7f', 2011, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Subaru', '#289bf3', 2011, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Ford', '#809afe', 1988, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('BMW', '#ccd7cb', 2008, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('BMW', '#ffb7b1', 2004, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Dodge', '#f0caef', 2005, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('GMC', '#306ab9', 2010, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('BMW', '#aaa139', 1997, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Ford', '#fc8ea6', 1989, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Pontiac', '#8a2959', 1989, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Lincoln', '#f7b2d8', 2010, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Volkswagen', '#e202e5', 1984, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Dodge', '#8b8c22', 2006, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Ford', '#de4dd5', 2008, 2);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Toyota', '#3687d2', 2004, 1);
insert into autod (Mark, RegNr, Aasta, RegPiirk) values ('Suzuki', '#5f249a', 1998, 1);


--Järjesta autod tootmisaasta järgi kahanevasse järjekorda
select Aasta
from autod
order by Aasta DESC;

--Väljasta kõik erinevad margid (kasuta DISTINCT)
select distinct Mark
from autod;

--Väljasta enne 1993. aastat toodetud autode registrinumbrid
select Aasta
from autod
where Aasta<1993;

--Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
select Aasta, Mark
from autod
where Aasta<1993
order by Mark;

--Väljasta autode kõige varasem väljalaskeaasta (MIN)
select MIN(Aasta) 'kõige varasem'
from autod;

--Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
Update autod set RegNr='333 KKK'
Where RegNr='FIN 772';
select Mark, RegNr from autod;

--Kustuta auto id-ga 4
Delete from autod Where RegNr='#809afe';
select * from autod

-- Lisa uus masin nimekirja. Vaata tabeli sisu.
insert into autod(Mark, RegNr, Aasta, RegPiirk)
values ('Nissan', '555 NNN', 2007, 2)
select * from autod;

--näidake mulle 5 uusimat automarki.
select top 5 Mark, Aasta
from autod
order by Aasta desc

-- näita masina kaubamärke, mis algavad tähega A
select Mark
from autod
where Mark like 'A%';

--automargid, mis sisaldavad a ja aastat (1999; 2005)
select Mark, Aasta
from autod
where (Aasta between 1999 and 2005) and Mark like '%a%';
