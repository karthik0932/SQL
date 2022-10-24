create database Kanopi_app
use Kanopi_app
create table kanopi_page
(
Id int primary key Identity(1,1),
FirstName varchar(25),
LastName varchar(25),
Email varchar(25)
)

select * from kanopi_page
set identity_insert kanopi_page on

delete from kanopi_page where Id=7
drop table kanopi_page



