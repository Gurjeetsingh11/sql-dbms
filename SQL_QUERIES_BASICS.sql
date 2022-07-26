create table student(
    rollno int not null primary key,
    firstname varchar(20),
    lastname varchar(20),
    city varchar(20),
    marks int);
insert into student values(1,"gurjeet","singh","indore",80);
insert into student values(2,"riya","saxena","panna",85);
insert into student values(3,"nikita","anand","khandwa",60);
insert into student values(4,"aditi","jain","sanawad",60);
insert into student values(5,"kushal","gujrati","dewas",25);
insert into student values(6,"nakul","dave","dewas",38);
insert into student values(7,"aniket","tiwari","satna",50);
insert into student values(8,"amol","paliwal","rau",70);
insert into student values(9,"rajat","singh","bheelgao",20);
insert into student values(10,"kratika","patil","nimad",55);


#select * from student;

#select rollno,firstname from student;

#select * from student where firstname="gurjeet";
#select * from student where city="indore";

#select distinct firstname,lastname from student;

#select * from student where marks>75 and marks<=85;

#select * from student where city="khandwa" or city="panna";

#select * from student where not city="indore";

#select * from student where city="indore" and not(city="khandwa");
#select * from student where city="panna" and (city="indore" or city="panna");

#select * from student order by marks desc;
#select * from student order by city asc;
#select * from student order by firstname,lastname,city;
#select firstname,city from student order by city asc, firstname desc;

#select * from student where firstname is null;
#select * from student where firstname is not null;

/*update student
set firstname="surjeet",city="kalapur" where rollno=1;
select * from student;*/
/*update student
set firstname="riyanshi" where marks=85;
select * from student where marks=85;*/

delete from student where city="bheelgao";
select * from student;
update student
set rollno=9 where firstname="kratika"; 