create database TE_API_Angular
use TE_API_Angular
create table Registration
(
id int primary key Identity(1,1),
username varchar(25),
useremail varchar(40),
password varchar(25),
mobile varchar(25)
)
select * from Registration

set identity_insert Registration on

delete from Registration where id=4





