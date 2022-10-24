use TE

create table salesman
(
salesman_id int,
s_name varchar(25),
S_city varchar(25),
S_commission float 
)

insert into salesman values( 5001, 'James Hoog', 'New York', 0.15)
insert into salesman values( 5002, 'Nail Knite', 'Paris', 0.13)
insert into salesman values( 5005, 'Pit Alex', 'London', 0.11)
insert into salesman values( 5006, 'Mc Lyon', 'Paris', 0.14)
insert into salesman values( 5007, 'Paul Adam', 'Rome', 0.13)
insert into salesman values( 5003, 'Lauson Hen', 'San Jose', 0.12)

--1.From the following table, create a view for those salespeople who belong to the city of New York. 
create view salesman_view 
as 
select * from salesman where S_city='New York'

select * from salesman_view 

--2.From the following table, create a view for all salespersons. Return salesperson ID, name, and city.  
create view salespeople_view 
as 
select salesman_id,s_name,S_city from salesman 

select * from salespeople_view 

--3. From the following table, create a view to count the number of salespeople in each city. Return city, number of salespersons.
create view salescount_view
as
select S_city, count(distinct salesman_id) as Salesman_count from salesman group by S_city

select * from salescount_view

create table customer
(
customer_id int,
cust_name varchar(25),
c_city varchar(25),
c_grade int,
salesman_id int
)

insert into customer values( 3002, 'Nick Rimando', 'New york', 100, 5001)
insert into customer values( 3007, 'Brad Davis', 'New york', 200, 5001)
insert into customer values( 3005, 'Graham Zusi', 'California', 200, 5002)
insert into customer values( 3008, 'Julian Green', 'London', 300, 5002)
insert into customer values( 3004, 'Fabian Johnson', 'Paris', 300, 5006)
insert into customer values( 3009, 'Geoff Cameron', 'Berlin', 100, 5003)
insert into customer values( 3003, 'Jozy Altidor', 'Moscow', 200, 5007)

--4.From the following table, create a view that counts the number of customers in each grade.
create view customer_view1
as
select customer_id, count(distinct customer_id ) as Custormer_count from customer group by c_grade having c_grade > (SELECT AVG(c_grade) FROM customer WHERE c_city='New york'  );


create view customer_view ( c_grade, num)
as 
select c_grade, count(*) from customer group by c_grade

select * from customer_view

--5.From the following tables, create a view to get the salesperson and customer by name. Return order number, purchase amount, salesperson ID, name, customer name.

create table orders
(
ord_no int,
purch_amt float,
order_date date, 
customer_id int,
salesman_id int
)

insert into orders values(70001, 150.5, '2012/10/05', 3005, 5002)
insert into orders values(70009, 270.65, '2012/09/10', 3001, 5005)
insert into orders values(70002, 65.26, '2012/10/05', 3002, 5001)
insert into orders values(70004, 110.5, '2012/08/17', 3009, 5003)
insert into orders values(70007, 948.5, '2012/09/10', 3005, 5002)
insert into orders values(70005, 2400.6, '2012/07/27', 3007, 5001)
insert into orders values(70008, 5760.0, '2012/09/10', 3002, 5001)

create view sales_customer_view
as
select o.ord_no, o.purch_amt, o.salesman_id, s.s_name, c.cust_name from orders as o 
inner join customer as c on o.customer_id = c.customer_id 
inner join salesman as s on o.salesman_id = s.salesman_id


create  view orderDetails_andOp_view
as 
select o.ord_no, o.purch_amt, o.salesman_id, s.s_name, c.cust_name 
from orders as o, customer as c,salesman as s
where o.customer_id = c.customer_id and o.salesman_id = s.salesman_id


select * from sales_customer_view

select * from orderDetails_andOp_view