create database retseptiRaamatRyshniak;
use retseptiRaamatRyshniak;
create table kasutaja (
kasutaja_id int primary key identity (1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
email varchar(150));
insert into kasutaja(eesnimi, perenimi, email)
values('Nikita', 'Nikita', 'nikita@tthk.ee'),
('Mark', 'Mark', 'mark@tthk.ee'),
('Roman', 'Roman', 'roman@tthk.ee'),
('Marija', 'Marija', 'marija@tthk.ee'),
('Nikita', 'Nikita', 'nikita@tthk.ee');
select * from kasutaja

create table kategooria (
kategooria_id int primary key identity (1,1),
kategooria_nimi varchar (50));
insert into kategooria (kategooria_nimi)
values('supp'), ('magus'), ('soolane'), ('jook'), ('köögiviljad');
select * from kategooria

create table toiduaine (
toiduaine_id int primary key identity (1,1),
toiduaine_nimi varchar(100));
insert into toiduaine (toiduaine_nimi)
values ('munad'), ('juust'), ('piim'), ('õlu'), ('soola');

select * from toiduaine

create table yhik (
yhik_id int primary key identity (1,1),
yhik_nimi varchar(100));
insert into yhik (yhik_nimi)
values ('ml'), ('g'), ('kg'), ('tl'), ('sl');

select * from yhik

create table retsept (
retsept_id int primary key identity (1,1),
retsepti_nimi varchar (100),
kirjendus varchar(200),
juhend varchar (500),
sisestatud_kp date,
kasutaja_id int,
foreign key (kasutaja_id) references kasutaja(kasutaja_id),
kategooria_id int,
foreign key (kategooria_id) references kategooria(kategooria_id));
insert into retsept (retsepti_nimi, kirjendus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
values('porgandikook', 'väga magus', 'kasuta porgandid', '2025-02-14', 2, 2),
('pannkoogid', 'väga magus', 'kasuta elektripliit', '2025-02-14', 3, 2),
('grill', 'nii soola', 'kasuta grillpott', '2025-02-14', 4, 2),
('supp', 'nii sola', 'kasuta elektripliit', '2025-02-12', 5, 1);

select * from retsept
select * from yhik
select * from kategooria


create table koostis(
koostis_id int primary key identity (1,1),
kogus int,
retsept_retsept_id int,
foreign key (retsept_retsept_id) references retsept(retsept_id),
toiduaine_id int,
foreign key (toiduaine_id) references toiduaine(toiduaine_id),
yhik_id int,
foreign key (yhik_id) references yhik(yhik_id));
insert into koostis (kogus, retsept_retsept_id, toiduaine_id, yhik_id)
values (3, 1, 2, 2), (1, 2, 3, 1), (12, 3, 3, 1), (2, 4, 5, 2), (1, 5, 1, 2);

select * from koostis

create table tehtud (
tehtud_id int primary key identity (1,1),
tehtud_kp date,
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id));
insert into tehtud(tehtud_kp, retsept_id)
values ('2024-02-15', 1), ('2025-01-15', 2), ('2025-02-01', 3), ('2025-02-02', 4), ('2024-01-18', 5);

select * from tehtud

create procedure lisakasutaja
@eesnimi varchar(50),
@perenimi varchar(50),
@email varchar(150)
AS
BEGIN
insert into kasutaja(eesnimi, perenimi, email)
values (@eesnimi, @perenimi, @email);
select * from kasutaja
END;
exec lisakasutaja 'nikita2', 'nikita2', 'nikita2@tthk.ee'

create procedure lisaretsept
@retsepti_nimi varchar (100),
@kirjendus varchar(200),
@juhend varchar (500),
@sisestatud_kp date,
@kasutaja_id int,
@kategooria_id int
as 
begin
insert into retsept(retsepti_nimi, kirjendus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
values (@retsepti_nimi, @kirjendus, @juhend, @sisestatud_kp, @kasutaja_id, @kategooria_id);
end;

exec lisaretsept 'pizza', 'nii soola', 'kasuta elektripliit', '2025-02-14', 6, 2 


create procedure lisakoostis
@kogus int,
@retsept_retsept_id int,
@toiduaine_id int,
@yhik_id int
as
begin
insert into koostis(kogus, retsept_retsept_id, toiduaine_id, yhik_id)
values (@kogus, @retsept_retsept_id, @toiduaine_id, @yhik_id );
select * from koostis
end;

exec lisakoostis 7, 6, 2, 2

create procedure lisatehtud
@tehtud_kp date,
@retsept_id int 
as
begin
insert into tehtud(tehtud_kp, retsept_id)
values (@tehtud_kp,
@retsept_id);
select * from tehtud
end;
exec lisatehtud '2025-02-02', 6

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

exec veeruLisaKustutaTabelis @valik='add', @tabelinimi='kasutaja', @veerunimi='number', @tyyp='varchar(20)'; 
exec veeruLisaKustutaTabelis @valik='drop', @tabelinimi='kasutaja', @veerunimi='number'; 


create table hind(
id int primary key identity (1,1),
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id),
hind decimal (2,1));
insert into hind (retsept_id, hind)
values (1, 7.5), (2, 9.9), (3, 4.5), (4, 7.5), (5, 3.7), (6, 6.9);
select * from hind

create procedure lisahind
@retsept_id int,
@hind decimal (2,1)
as
begin
insert into hind(retsept_id, hind)
values (@retsept_id, @hind);
select * from hind
end;
exec lisahind 5, 4.4

Create procedure kustutahind
@deleteID int
AS
begin
select * from hind;
DELETE From hind Where id=@deleteID;
select * from hind;
end;

exec kustutahind 7;
