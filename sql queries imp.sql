use EMP;
select * from employee;

select distinct age from employee;

select count(age) from employee; 
select count(*) from employee; 

select first(emp_id)from employee;
select last(emp_id)from employee;
select age from employee order by rand() ;

select emp_id,first_name from employee where emp_id>=2 and emp_id <6;

select emp_id,first_name from employee where emp_id=2 or emp_id=4;

update employee set first_name="shyaam" where emp_id=2;
select * from employee;

delete from employee where emp_id=6;
select * from employee;

select * from employee order by first_name;
select * from employee order by last_name desc;

select * from employee where last_name is null;
select * from employee where last_name is not null;

select last_name,first_name from employee limit 2;

select * from employee limit 3;

alter table employee add salary int;
select *from employee;

select min(age) from employee;
select max(age),first_name from employee;

select count(*) from employee;

select avg(age) from employee;

select * from employee where not adress="delhi";

SELECT * FROM employee  limit 5;
select * from employee order by first_name desc limit 2;

select * from employee where first_name like 'a%';
select * from employee where first_name like '%i';
select * from employee where first_name like '%aa%';
select * from employee where first_name like '_b%';
select * from employee where first_name like 's_%';
select *from employee where first_name like 'a__%';
select * from employee where first_name like 'a%i';
select * from employee where first_name like '__f%';
select * from employee where first_name like 's%a';
select * from employee where first_name like 's_f%';
select * from employee where first_name like '%a';

update employee
set first_name="maria" 
where emp_id=3;
select * from employee;

select * from employee where first_name like 'ab%';
select *from employee where first_name like 's_f%';

select * from employee where first_name in(age<=20 );

select * from employee where age between 21 and 22;
select * from employee where emp_id between 3 and 6;

select * from employee where first_name between "abhi" and "maria" order by first_name ;
select * from employee where first_name not between "abhi" and "maria" order by first_name ;

select emp_id As ID from employee;
select emp_id As ID,first_name as naam from employee;
select first_name as "name of person" from employee;
select emp_id,concat(age," ",adress," "," ",emp_id) as details from employee;

SELECT p.productid, e.age, e.first_name
FROM employee AS e, products AS p
WHERE e.first_name='sofia' AND p.category =2;

select p.productid , e.first_name from products as p,
employee as e where productid=1 and first_name="sofia";

select employee.first_name from employee as e;
select e.first_name , e.last_name from employee as e  where first_name="sofia";

create table products (
productid int  not null,
supplierid int ,
 category int,
price int,
product varchar(20) );

select * from products;

insert into products values(1,1,1,200,"chair");
insert into products values(2,1,2,300,"tabal");
insert into products values(3,1,1,150,"sofa");
insert into products values(4,2,2,300,"mirror");
insert into products values(5,2,1,100,"bench");


select count(productid) from products;
select avg(price) from products;
select min(price),(category) from products;
select max(price) from products;
select sum(price) from products;

select * from products where price between 150 and 300  ;
select * from products where price between 100 and 200 and productid not in(1,4);

