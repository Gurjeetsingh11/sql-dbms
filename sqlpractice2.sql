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
 

/*22 question*/
select concat(FIRST_NAME," ",LAST_NAME) as WORKER_NAME, SALARY 
FROM worker 
where WORKER_ID in(select WORKER_ID from worker where SALARY between 50000 and 100000);

/*23 question*/
select count(WORKER_ID) NO_OF_WORKER from worker group by DEPARTMENT order by NO_OF_WORKER desc;

/*24*/
select WORKER_TITLE,AFFECTED_FROM,count(*) from Title Group by WORKER_TITLE,AFFECTED_FROM having count(*) > 1;

/*25*/
select * from worker where mod(WORKER_ID,2)<>0;

/*26*/
create table workerclone like worker;

/*27*/
/*select * from worker intersect select * from wokerclone;*/

/*28*/
/*select * from worker minus select * from Title;*/

/*29*/
select curdate();
select now();

/*30*/
select * from worker order by salary desc limit 10;

/*31*/
select salary from worker order by salary desc limit 5,1;

/*32*/
/*select salary from worker w1 where 4=(select count(distinct(w2.salary) from w2 where w2.salary>=w1.salary);*/

/*33*/
select distinct w.worker_id,w.first_name,w.salary from worker w,worker w1
where w.salary=w1.salary and w.worker_id != w1.worker_id;

/*34*/
select max(salary) from worker where salary not in (select max(salary) from worker);

/*35*/
select first_name,department from worker w where w.department='HR'
union all
select first_name,department from worker w1 where w1.department="HR";

/*36*/
select * from worker where worker_id in(select count(worker_id)/2 from worker);

/*37*/
select department,count(worker_id) as "number of worker" from worker group by department having count(worker_id)<5;

/*38*/
select department,count(department) as "number of worker" from worker group by department;

/*39*/
select * from worker where worker_id=(select max(worker_id) from worker);

/*40*/
select * from worker where worker_id=(select min(worker_id) from worker);

/*41*/
select * from worker where worker_id>=5 
union
select * from (select * from worker w order by w.worker_id desc) as w1 where w1.worker_id <=5;

/*42*/
select distinct salary from worker a where 3>=(select count(distinct salary) from worker b where a.salary <= b.salary) order by a.salary desc;

/*43*/
select distinct salary from worker a where 3>=(select count(distinct salary) from worker b where a.salary >= b.salary) order by a.salary desc;

/*44*/
select department,sum(salary) from worker order by department;

/*45*/
select first_name from worker where salary=(select max(salary) from worker);