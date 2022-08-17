CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME varchar(25),
	LAST_NAME varchar(25),
	SALARY INT,
	JOINING_DATE datetime,
	DEPARTMENT varchar(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE varchar(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
/*1 question*/

select FIRST_NAME as WORKERS_NAME from worker;

/*2 QUESTION*/
select upper(FIRST_NAME) from worker;

/*3 QUESTION*/
select distinct DEPARTMENT from worker;

/*4 QUESTION*/
select substring(FIRST_NAME,1,3) from worker;

/*5 QUESTION*/
select instr(FIRST_NAME,BINARY'a') from worker where FIRST_NAME='Amitabh';

/*6 QUESTION*/
select rtrim(FIRST_NAME) from worker;

/*7 QUESTION*/
select ltrim(DEPARTMENT) from worker;

/*8 QUESTION*/
select distinct length(DEPARTMENT) from worker;

/*9 QUESTION*/
select replace(FIRST_NAME,'a','A') from worker;

/* 10 QUESTION */
select concat(FIRST_NAME," ",LAST_NAME) as COMPLETE_NAME from worker;

/*11 question */
select * from worker order by FIRST_NAME asc;

/*12 question*/
select * from worker order by FIRST_NAME asc,DEPARTMENT desc;

/*13 question*/
select * from worker where FIRST_NAME in ('vipul','satish');

/*14 question*/
select * from worker where FIRST_NAME not in('vipul','satish');

/*15 question*/
select * from worker where DEPARTMENT like ('Admin%');

/*16 question*/
select * from worker where FIRST_NAME like ('%a%');

/*17 question*/
select * from worker where FIRST_NAME like ('%a');

/*18 question*/
select * from worker where FIRST_NAME like('_____h');

/*19 question*/
select * from worker where SALARY between 100000 and 500000;

/*20 question*/
select * from worker where year(JOINING_DATE)=2014 and month(JOINING_DATE)=2;

/*21 question*/
select count(*) from worker where DEPARTMENT='Admin';

