use TE

create table Students
(
SID int Primary Key,
SName varchar(20) Not Null,
SDept int Unique Not null -- DID int unique Not Null
)

create table Student_Dept
(
DID int Primary Key,
DName varchar(20),
DHead varchar(20)
)

select * from Students
select * from Student_Dept

insert into Students values(1,'John',101),(2,'Peter',102),(3,'Sam',103),(4,'Lea',104),(5,'Lee',105),(6,'Shaun',106)
insert into Student_Dept values(101,'BCA','Jancy'),(102,'BBA','Dwayne'),(103,'BCOM','Jose'),(104,'BSC','Prince'),(105,'BBA','Stella'),(106,'BBM','Lisa')

--Inner Joins
select SID,SName,DID,DName,DHead from Students inner join Student_Dept on SDept=DID;

select Students.SID,Students.SName,Student_Dept.DID,Student_Dept.DName,Student_Dept.DHead 
from Students inner join Student_Dept on Students.SDept=Student_Dept.DID;

--Outer Joins
--left 
select s.SID,s.SName,sd.DID,sd.DName,sd.DHead 
from Students as s LEFT join Student_Dept as sd on s.SDept=sd.DID;
--right
select s.SID,s.SName,sd.DID,sd.DName,sd.DHead 
from Students as s RIGHT join Student_Dept as sd on s.SDept=sd.DID;

insert into Student_Dept values(110,'MCA','JOANNE'),(111,'MBA','DEREK')
--full
select s.SID,s.SName,sd.DID,sd.DName,sd.DHead 
from Students as s FULL join Student_Dept as sd on s.SDept=sd.DID;

alter table Students add SRep varchar(20)
update Students set SRep = 'Giri' where SID=1
update Students set SRep = 'Raj' where SID=2
update Students set SRep = 'Vaman' where SID=3
update Students set SRep = 'Laxmi' where SID=4
update Students set SRep = 'Soorya' where SID=5
update Students set SRep = 'Adhya' where SID=6
update Students set SRep = 'Sushan' where SID=7
update Students set SRep = 'Sakshu' where SID=8
update Students set SRep = 'Lakumi' where SID=9

create table Student_Rep
(
SID int Primary Key,
SName varchar(20) unique Not Null
)

insert into Student_Rep values(10,'Giri'),(11,'Laxmi'),(12,'Soorya')

select * from Student_Rep
select * from Students
select * from Student_Dept

--3 table joining
select s.SID,s.SName,s.SRep,sd.DID,sd.DName,sd.DHead 
from Students as s 
inner join Student_Dept as sd on s.SDept=sd.DID 
inner join Student_Rep as sr on s.SRep=sr.SName

--sequence
create table demo
(
TID int,
TName varchar(20)
)

create table demo1
(
TID int,
TName varchar(20)
)

create sequence TraineeID as int start with 1000 increment by 1

insert into demo values(NEXT VALUE FOR TraineeID,'John')
insert into demo values(NEXT VALUE FOR TraineeID,'Sam')
insert into demo values(NEXT VALUE FOR TraineeID,'Paul')
insert into demo values(NEXT VALUE FOR TraineeID,'James')

insert into demo1 values(NEXT VALUE FOR TraineeID,'Laxmi')
insert into demo1 values(NEXT VALUE FOR TraineeID,'Jan')
insert into demo1 values(NEXT VALUE FOR TraineeID,'Vikram')
insert into demo1 values(NEXT VALUE FOR TraineeID,'Ganesh')

select * from demo
select * from demo1

alter sequence TraineeID restart with 1000 increment by 1
drop sequence TraineeID