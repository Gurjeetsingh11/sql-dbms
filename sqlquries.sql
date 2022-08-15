use emp;
/*create table city(
cid int not null ,
cityname varchar(20) not null,
primary key(cid));

insert into city values(1,"indore");
insert into city values(2,"khandwa");
insert into city values(3,"khndwa");
insert into city values(4,"indore");

create table custom(
id int not null ,
firstname varchar(20),
lastname varchar(20),
city int not null,
primary key(id),
foreign key(city) references city(cid));

insert into custom(id , firstname,lastname,city)
values(24,"ajay","rathore",6),
(25,"rohit","sinha",6),
(26,"akash","gupta",1),
(27,"abhishek","gupta",3);*/


/*create table gurjeet select * from custom;
select * from gurjeet;*/

truncate table custom;
select * from custom;
alter table custom add age int;
select * from custom;
alter table custom drop column age;
alter table custom modify id varchar(20) not null;

/*contraints add */
/*create table gurjeet (id int not null unique,name varchar(20));
alter table gurjeet add column age int ;
alter table gurjeet add unique(name);
select * from gurjeet;
drop table gurjeet;*/

/* PRIMARY KEY */
create table gurjeet(id int not null primary key);
drop table gurjeet;
create table gurjeet(id int not null,fname varchar(20),lname varchar(20),age int not null, primary key(id,fname));
alter table gurjeet add primary key(lname);

/* FOREIGN KEY */
create table gurjeet (id int not null,orderid int not null,fname varchar(20),primary key(id));
alter table gurjeet add foreign key(orderid) references cutom(orderid);

/*check and default constraints */
create table student(id int not null,fnmae varchar(20),age int ,city varchar(20) default 'indore');
insert into student values(1,"abs",23,'');
insert into student values(2,"pqr",26,'');
insert into student values(3,"stu",24,'');
alter table student add column doe date default getdate();
select * from student;

/*creating index*/
create index ids on student(id);
alter table student drop index ids;
select distinct id from student;

/* AUTO INCREMENT */
create table gurjeet (Personid int auto_increment PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int);
alter table gurjeet auto_increment=100;
insert into gurjeet(LastName,Firstname)values("sfhsjf","sdms");
select * from gurjeet;

