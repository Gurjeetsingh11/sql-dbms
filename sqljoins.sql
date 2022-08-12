create database sqljoin;
use sqljoin;

create table customers(
id int,
cust_name varchar(20),
designation varchar(20));

create table orders(
orderid int,
amount int,
cust_id int);

insert into customers value(1,"abc","A");
insert into customers value(2,"pqr","B");
insert into customers value(3,"skl","C");

insert into orders value(301,10000,1);
insert into orders value(302,8000,4);
insert into orders value(303,9000,5);

select orders.amount , customers.cust_name from customers inner join orders on orders.cust_id=customers.id;
select orders.orderid , customers.cust_name 
from customers inner join orders on orders.cust_id = customers.id;

select orders.orderid ,customers.cust_name from orders 
left join customers on orders.cust_id=customers.id;
select orders.amount ,customers.designation from customers 
left join orders on customers.id=orders.cust_id;

select orders.orderid ,customers.cust_name from orders 
right join customers on orders.cust_id=customers.id;
select orders.amount ,customers.designation from customers 
right join orders on customers.id=orders.cust_id;

select customers.cust_name , orders.amount , customers.designation 
from customers right join orders on orders.cust_id=customers.id order by cust_name desc;

select customers.cust_name , customers.designation ,orders.amount 
from customers full join orders 
on orders.cust_id = customers.id where orderid = 301;

select orders.amount from orders , customers;

create table me(
eid int ,
name varchar(20),
managerid int);

insert into me values(121,"abc",321);
insert into me values(321,"pqr",987);
insert into me values(421,"mno",876);

select * from customers;
select * from orders;

select id from customers union select cust_id from orders;
select id from customers union all select cust_id from orders;
select * from customers where id=2 union select * from orders where cust_id=301;

select * from customers where id=1 group by cust_name;
select count(*) from customers group by cust_name;

select id from customers group by designation having count(id) <= 1;

select amount from orders where exists(select id from customers where id=3);

/*select count(id) from customers =ANY (select count(cust_id) from orders;*/
select all amount from orders where True ;

create table newtable select * from orders;
select * from newtable;

insert into orders select * from customers where id=1;