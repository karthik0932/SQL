create database TE_Core_MVC

use TE_Core_MVC 

create table TOrder
(
OID int Primary key,
OName varchar(25),
OItem varchar(25),
OQuant int 
)

select * from TOrder