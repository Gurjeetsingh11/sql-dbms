create table customers(id int,name varchar(20),age int,city varchar(20),salary float);
insert into customers values(2,'khilan',25,'delhi',1500);
insert into customers values(3,'kaushik',23,'kota',2000);
insert into customers values(4,'chatati',25,'mumbai',6000);
insert into customers values(5,'hardik',28,'bhopal',7000);
insert into customers values(6,'komal',30,'indore',4500);
insert into customers values(7,'muffy',24,'mp',1000);

create table orders(oid int,customerid int ,amount int);
insert into orders values(101,3,3000);
insert into orders values(102,4,5000);
insert into orders values(103,6,2000);
insert into orders values(104,5,4000);

select name,id,age,amount from customers,orders where customers.id=customerid;
select name,id,amount,salary from customers inner join orders on customers.id=customerid;
select name,id,amount,city,oid from customers left join orders on customers.id=customerid;
select name,id,amount,oid from customers right join orders on customers.id=customerid;

select a.name,a.salary from customers a,customers b where a.salary<b.salary;
select id,name,oid,age,city,amount from customers,orders;

select id,name,amount from customers left join orders on customers.id=orders.customerid
union
select id,name,amount from customers right join orders on customers.id=orders.customerid;

select id,name,amount from customers left join orders on customers.id=orders.customerid
union all
select id,name,amount from customers right join orders on customers.id=orders.customerid;

select * from customers where salary is not null;
select id,name,age,salary from customers where salary is null;

select name as cname,id as cid from customers where salary is not null;
 
 alter table customers add sex char(1);
 alter table customers drop sex;
 
create view customer_view as select name,age from customers where age is not null with check option;
update customer_view set age=32 where name='khilan';
select * from customer_view;

delete from customer_view where name='chatati';
select * from customer_view; 

drop view customer_view;

select name,age,city from customers group by age having count(age)>=1;

delete from customers where age>=32;
commit;
delete from customers where age>=32;
rollback;
savepoint sv1;
insert into customers values(8,'ronny',25,'hp',4000);
savepoint sv2;
rollback to sv1;
release savepoint sv1;

select date_add('1998-01-02',interval 31 day);
select adddate('2001-08-06',interval 30 day);
select addtime('1992-12-31 23:23:34.242323','1 1:1:1:.00022');
select convert_tz('2003-01-01 12:00:00','GMT','MET');
select curtime();
select curdate();
select date('2003-12-31 01:02:03');
select datediff('1997-10-31','1997-12-30');
select date_format('1997-10-04 22:23:00','%w %m %y');
select dayname('2001-08-06');
select dayofmonth('2001-08-06');
select dayofweek('2001-08-06');
select dayofyear('2001-08-06');
select extract(year from '1999-07-03');
select from_days(238128);
select hour('10:03=04');
select makedate(2001,31),makedate(2001,32);
select maketime(12,15,30);
select minute('98-02-03 10:05:03');
select monthname('2003-02-03');
select now();
select quarter('98-04-01');
select week('2001-08-06');
select weekday('2001-08-06 22:23:00');
select weekofyear('2001-08-06');
select yearweek('2001-08-06');

create temporary table salessummary(product varchar(10) not null,totalsales int not null,averageunit int,totalunit int);
insert into salessummary values('cucumber',100,90,2);
select * from salessummary;
drop table salessummary;

select * from customers where id in (select id from customers where salary <=2000);
update customers set salary=salary*2.2 where  age in(select oid from orders where age>30);
