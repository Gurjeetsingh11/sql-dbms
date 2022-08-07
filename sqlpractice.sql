--INSERT INTO query
/*create table Anonymous_customer(id int,name varchar(20),lname varchar(20));
insert into Anonymous_customer(id,name,lname) select customer_id,first_name,last_name from Customers;*/

--create table products(P_Id int,	ProductName	varchar(20),UnitPrice double,UnitsInStock int,	UnitsOnOrder int);	 
/*insert into products values(1,"Jarlsberg",10.45, 16 , 15);
insert into products values(2,"Mascarpone",32.56, 23, '');
insert into products values(3,"Gorgonzola",15.67, 9, 20);*/

--isnull,nvl,iffull
select ProductName, UnitPrice (UnitsInStock+UnitsOnOrder) from products;
