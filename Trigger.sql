create database ryshniakTrigerid;
use ryshniakTrigerid;
Create table linnad(
linnID int Identity(1,1) PRIMARY KEY,
linnanimi varchar(15),
rahvaarv int);
--tabel logi näitab adminile kuidas tabel linnad kasutatakse, 
--tabel logi täidab triger
Create table logi(
id int identity(1,1) PRIMARY KEY,
aeg DATETIME,
toiming  varchar(100),
andmed varchar(200),
kasutaja varchar(100),
)
--INSERT TRIGER, mis jälgib tabeli linnad täitmine
Create Trigger linnaLisamine
On linnad
For insert 
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_User,
'linn on lisatud',
inserted.linnanimi
from inserted;
--trigeri tegevuse kontroll
insert into linnad(linnanimi, rahvaarv)
Values('Tallinn', 650000);
select * from linnad;
select * from logi;

--DELETE TRIGER, jälgib linna kustutamine tabelis linnad 
Create Trigger linnaKustutamine
On linnad
For delete
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_User,
'linn on kustutatud',
deleted.linnanimi
from deleted;
--kontroll
DELETE from linnad where linnID=1;
select * from linnad; 
select * from logi;

--UPDATE TRIGER
Create Trigger linnaUuendamine
On linnad
For update
as
insert into logi(aeg, kasutaja, toiming, andmed)
select 
GETDATE(),
SYSTEM_User,
'linn on uuendatud',
Concat ('vanad andmed: ', deleted.linnanimi,' ,', deleted.rahvaarv,
'uued andmed: ', inserted.linnanimi, ' ,', inserted.rahvaarv)
from deleted
inner join inserted
on deleted.linnID=inserted.linnID;
--kontroll
Update linnad set rahvaarv=650001
WHERE linnID=2;
select * from linnad;
select * from logi;

