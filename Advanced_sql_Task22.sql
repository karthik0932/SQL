use TE

--1.Scalar Function with 2 parameters 

create function Fn_Distance_from_origin(@x int, @y int)
returns float
as 
begin
return Sqrt(square(@x)+square(@y))
end

select dbo.Fn_Distance_from_origin(3,4) as Result
select dbo.Fn_Distance_from_origin(3,2) as Result

--2.Procedure with OUTPUT parameter

create procedure Proc_find(@ans int output)
as
begin
 select @ans= avg(BONUS_AMOUNT) from Bonus
end

--execute procedure
Declare @Avg_amt int
exec Proc_find @Avg_amt output
Print @Avg_amt

select * from Bonus


--3.Trigger to restrict DML access between 6:00PM to 10.00AM

alter trigger Trg_deny
on Orders
for insert,update, delete
as 
begin 
	if (DATEPART(HH , GETDATE()) > 24) or (DATEPART(HH , GETDATE()) < 10)
	begin
		print 'You cannot Order between 6:00PM to 10.00AM'
		Rollback transaction
	end
end 

select * from orders

delete from orders where ord_no=70009

insert into orders values( 70009, 5647, '2022-10-10', 3005, 5001)


--4.Server-scope trigger to restrict DDL access

create trigger trg_server_scope
on All Server
for Create_table, Alter_table, Drop_table
as
begin
	print 'You cannot perform DDL operation in any of the database'
	rollback transaction
end

create table demo3
(
TID int,
Salary int
)

create database APP
use APP
create table demo3
(
TID int,
Salary int
)

drop table demo3

--5.Working of explicit transaction with Save transaction

insert into seq_demo1 values(105, 'Tom')
insert into seq_demo1 values(106, 'Jerry')
insert into seq_demo1 values(107, 'Satya')
select * from seq_demo1

begin transaction
	update seq_demo1 set TNAME_1='Keerthy' where TID_1=107
	insert into seq_demo1 values(108, 'Teju')
	save transaction upd
	insert into seq_demo1 values(109, 'Soorya')
	rollback transaction upd
commit transaction

delete from seq_demo1 where TID_1=107 
delete from seq_demo1 where TID_1=108 


--6.Difference between throw and Raiserror in exception handling
alter procedure Proc_exp_hand 
@a int
as
begin 
	declare @cube  int	
	begin try
			begin 
				if(@a<0)
				--Raiserror('If we u caluculate the cube for -ve value u get negative ans. So, can you change number', 16,1)
				throw 50001, 'If we u caluculate the cube for -ve value u get negative ans. So, can you change number', 16;
				set @cube=power(@a,3)
				print 'Cube of given number is:' + cast(@cube as varchar)			
			end
	end try
	begin catch
			begin 
			print error_number()
			print error_message()
			print error_severity()
			print error_state()
			end
	end catch
end
	
exec Proc_exp_hand 5

exec Proc_exp_hand -1