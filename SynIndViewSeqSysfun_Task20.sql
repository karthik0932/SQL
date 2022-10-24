use TE

--Synonyms
--It is an alias/ alternative name for our table, view, procedure, function, trigger etc. Like giving another name to the table.
create synonym tle for Title
select * from tle where WORKER_TITLE='Lead'

select * from Title

--index
--clustered index --> Whenever a primary key is created automatically clustered index is created.
create clustered index ref_Id on Title(WORKER_REF_ID)


--non clustered index --> Whenever a unique key is created automatically a non clustered index is created.
create index work_name on Title(WORKER_TITLE)

select * from Worker


--filtered index --> We use an index like a filter using the where keyword.
create index dept on Worker(DEPARTMENT) where DEPARTMENT='Admin'

--views
--simple view --> It affects the Single table.
create view work_dep
as 
select * from Worker where DEPARTMENT = 'Account'

select * from work_dep
select * from Worker
--insert value to view
insert into work_dep values(9, 'Anjali','KR',50000, '2022-06-11 09:00:00.000', 'HR')
insert into work_dep values(10, 'Anju','PR',50000, '2022-06-11 09:00:00.000', 'Account')

--complex view -->It takes more than one table and it affects both the tables.
select * from Worker
select * from bonus

select w.WORKER_ID, w.FIRST_NAME, w.DEPARTMENT, b.BONUS_AMOUNT from Worker as w 
inner join Bonus as b on w.WORKER_ID=b.WORKER_REF_ID;

create view bonus_view
as
select w.WORKER_ID, w.FIRST_NAME, w.DEPARTMENT, b.BONUS_AMOUNT from Worker as w 
inner join Bonus as b on w.WORKER_ID=b.WORKER_REF_ID;

select * from bonus_view

update bonus_view set FIRST_NAME='Roopa'  where BONUS_AMOUNT=4500

-- we can't delete or insert a value to the table in the complex view. It leading to an error.
delete from bonus_view where WORKER_ID =2

--sequence
create table seq_demo1
(
TID_1 int,
TNAME_1 varchar(20)
)

create table seq_demo2
(
TID_2 int,
TNAME_2 varchar(20)
)

create sequence seq_ID as int start with 100 increment by 1

insert into seq_demo1 values(next value for seq_ID, 'Umesha')
insert into seq_demo1 values(next value for seq_ID, 'Roopa')
insert into seq_demo1 values(next value for seq_ID, 'Ujwala')
insert into seq_demo1 values(next value for seq_ID, 'Lavanya')
insert into seq_demo1 values(next value for seq_ID, 'Shreya')


insert into seq_demo2 values(next value for seq_ID, 'Prasad')
insert into seq_demo2 values(next value for seq_ID, 'Swathi')
insert into seq_demo2 values(next value for seq_ID, 'Samarth')
insert into seq_demo2 values(next value for seq_ID, 'Sakshu')
insert into seq_demo2 values(next value for seq_ID, 'Pinky')

select * from seq_demo1
select * from seq_demo2

--truncate -->TRUNCATE TABLE removes all rows from a table, but the table structure and its columns, constraints, indexes, and so on remain
truncate table seq_demo2

--alter 
alter sequence seq_ID restart with 100 increment by 2

--drop
drop sequence seq_ID

--Functions
--String function
SELECT CAST(14.5778 as int) as Cast_Output;
SELECT CONVERT(int, 15.456) as Convert_Output;
SELECT COALESCE(null, null, 'God', 'pure', null, 'Good') as Coalesce_Output
SELECT CHOOSE(3, 'CAT', 'DOG', 'MONKEY', 'RAT') as Choose_Output;
SELECT ascii('t') as Ascii_output;
SELECT RIGHT('Ujwala',3) as Right_Output;
SELECT RTRIM('geeksxyxzyyy           ') as Rtrim_Output;
SELECT CHARINDEX('is','godisgreat') as Charindex_Output;
SELECT CONCAT_WS('_', 'God', 'is', 'Great') as Concat_ws_Output;


--math function
SELECT ABS(-1000.7675) as Abs_Output
SELECT LOG10(100) as Log10_Output
SELECT POWER(25,2) as Power_Output
SELECT SIN(0.5) as Sin_Output
SELECT CEILING(0.566) as Ceiling_Output
SELECT FLOOR(0.566) as Floor_Output
SELECT ROUND(55.7654,3) as Round_Output
SELECT SQUARE(6) as Square_Output
SELECT RADIANS(180) as Radian_Output

--date and time functions
create table DateTime_table
(
TID int,
Date_Time Date 
)

insert into DateTime_table values(next value for seq_ID, '2022/09/30')
insert into DateTime_table values(next value for seq_ID, '2022/09/09')
insert into DateTime_table values(next value for seq_ID, '2021/10/07')
insert into DateTime_table values(next value for seq_ID, '2019/10/10')
insert into DateTime_table values(next value for seq_ID, '2020/08/10')

select * from DateTime_table
drop table DateTime_table

--print the only date of given value
SELECT DAY('2019-08-06 08:10:12') as Day_Output

--print the only month of given value
SELECT MONTH('2019-08-06 08:10:12') as Month_Output

--print the only year of given value
SELECT YEAR('2019-08-06 08:10:12') as Year_Output

--print the current date with time
SELECT CURRENT_TIMESTAMP as Current_Date_Time

--add the 2 year to the given year i.e. 2017/08/25
SELECT DATEADD(year, 2, '2021/08/25') as DateAdd_Output

--Find the difference between the year
SELECT DATEDIFF(year, '2001/03/17', '2022/10/07') as DateDiff_Output

--Check if the enter date is valid or not
SELECT ISDATE('2022-09-25') as Valid_date_Output --1
SELECT ISDATE('Hello!') as Invalid_date_Output --0

--Gives the specific part of date
SELECT DATEPART(month, '2023/08/25') as DatePart_Output

--Gives the date from its part
SELECT DATEFROMPARTS(2022, 10, 31) as DateFrom_Output

--Gives the date and time of SQL server
SELECT SYSDATETIME() as SysDateTime_Output