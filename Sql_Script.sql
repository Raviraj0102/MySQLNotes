show databases;
use giraffe;

show tables;
select * from student1;
select * from student1 order by student_name desc;
select * from student1 order by student_name asc;
select * from student1 where studet_course = "Java" And course_fee = 3000;

create table employee1(
emp_id  int primary key not null auto_increment,
emp_name varchar(20) unique,
emp_branch varchar(20) default 'undecided',
emp_salary int

);
Describe employee1;
drop table student;
alter table employee1 add gpa decimal(3,2);
alter table employee1 drop gpa;

select * from employee1;
insert into employee1(emp_name,emp_branch,emp_salary)  values("Ravi","IT",30040);
insert into employee1(emp_name,emp_branch,emp_salary)  values("Sagar","Comp",40040);
insert into employee1(emp_name,emp_branch,emp_salary)  values("Nisu","IT",20040);
insert into employee1(emp_name,emp_branch,emp_salary)  values("Bittu","Comp",40040);
insert into employee1 values("Raj","Civil",202020);

update employee1
SET emp_branch = 'Software Development'
 where emp_branch = 'IT' and emp_id = 1 or emp_id =5;

update employee1
SET emp_name = 'Bittu' , emp_branch = 'undecided' 
 where emp_branch = 'IT' and emp_id = 1 or emp_id =5;
 
 delete from employee1 
 where emp_id  = 2;
 
 /*  basic querry ?*/
 
 select emp_name 
 from employee1
 order by emp_name desc
 limit 3;
 
 select emp_name 
 from employee1
 where emp_id > 3;
 
  select *
 from employee1
 where emp_id > 3;
 show tables;
 describe employeee;
 
 create table employeee(
 emp_id int primary key,
 first_name varchar(40),
 last_name varchar(40),
 birth_date date,
 sex varchar(1),
 salary int,
 super_id int,
 branch_id int
 );
 
 create table branch(
 branch_id int primary key,
 branch_name varchar(20),
 mgr_id int,
 mgr_start_date date,
 foreign key(mgr_id) references employeee(emp_id) on delete set null
 );
 
 alter table employeee
 add foreign key(branch_id)
 references branch(branch_id)
 on delete set null;
 
 alter table employeee
 add foreign key(super_id)
 references employeee(emp_id)
 on delete set null;
 
 create table client(
 client_id int primary key,
 client_name varchar(20),
 branch_id  int,
 foreign key (branch_id) references branch(branch_id) on delete set null
 );
 
 create table works_with(
emp_id int,
 client_id int,
 total_sales int,
primary key(emp_id, client_id),
foreign key(emp_id) references employeee(emp_id) on delete cascade,
foreign key( client_id) references client( client_id) on delete cascade
 );
 
 create table branch_supplier(
	branch_id int,
    supplier_name varchar(20),
    supplier_type varchar(20),
    primary key (branch_id,supplier_name),
    foreign key(branch_id) references branch(branch_id) on delete cascade
 );
 select * from employeee;
 select * from branch;
 insert into employeee values(100,"david","wallace","1997-11-23","M",25000,NUll,Null);
  insert into employeee values(101,"jan","laveson","1987-01-29","F",20000,100,1);
   insert into employeee values(102,"Micle","scot","1964-09-03","M",79000,100,null);
    insert into employeee values(103,"Angila","martin","2000-03-10","F",38000,102,2);
 insert into employeee values(104,"kelly","kapoor","1990-02-01","F",40000,102,2);
  insert into employeee values(105,"standly","hunson","1991-04-30","M",55000,102,2);
   insert into employeee values(106,"josh","potter","1995-08-20","M",45000,null,null);
    insert into employeee values(107,"andyy","bernad","1977-07-15","M",65000,106,3);
     insert into employeee values(108,"Jim","helpert","1988-09-03","M",48000,106,3);
 insert into branch values(3,"stampford",106,"1998-02-013");
 
 update employeee
 set branch_id = 3
 where emp_id = 106;
 
 update employeee
 set super_id  = 106
 where emp_id = 106;
 
 
  -- branch supperlier
 insert into branch_supplier values( 2,"hammer mill","paper");
  insert into branch_supplier values( 2,"uni ball","writing utensils");
   insert into branch_supplier values( 3,"patrior paper","paper");
    insert into branch_supplier values( 2,"J T form & lap","Custom form");
     insert into branch_supplier values( 3,"uni ball","writing utensils");
      insert into branch_supplier values( 3,"hammer mill","paper");
       insert into branch_supplier values( 2,"stamford lab","custom form");
     
     select * from branch_supplier;

-- client
insert into client values(400,"dunmore highschool",2);
insert into client values(401,"lakwana country",2);
insert into client values(402,"FedEx",3);
insert into client values(403,"John daly LAW, LLC",3);
insert into client values(404,"Scranton whitepage",2);
insert into client values(405,"Time Newspaper",3);
insert into client values(406,"FedEX",2); 
 select * from client;
 
 -- works with
insert into  works_with values(105,400,55000);
insert into  works_with values(102,401,267000);
insert into  works_with values(108,402,22500);
insert into  works_with values(107,403,5000);
insert into  works_with values(108,403,12000);
insert into  works_with values(105,404,33000);
insert into  works_with values(107,405,26000);
insert into  works_with values(102,406,15000);
insert into  works_with values(105,406,130000);

-- All select query below 
select * from employeee;
select * from branch;
select * from client;
select * from works_with;
select * from branch_supplier;

-- More about the query 
-- Find the  Employeee order by salary
select * 
from employeee 
order by salary desc;

-- Find all employeee oderr by sex then name

select * 
from employeee
order by sex ,first_name,last_name;

-- find the first 5 employee from table

select * from employeee limit 5;

-- find the first name and last name from  all employeee
select 
first_name ,last_name
from employeee; 
 
 -- find forename lastname from all employeee
 select 
 first_name as foreName ,last_name as surname
 from employeee;
 
 -- find out all the gender
 select distinct sex from 
 employeee;
 
 -- find out all branch_id
 
 select distinct branch_id 
 from employeee;
 
 -- sql FUNCTION
 
 -- find the number of employee 
 select count(emp_id)
 from employeee;
 
 -- find the number of female employee  born after 1970
 
 select count(emp_id)
 from employeee
 where sex ='F'  and  birth_date > '1970-01-01';
 
 -- find the average of all emp salary
 
 select avg(salary)
 from employeee;
 
 -- find the average salary of male employee
 
 select avg(salary)
 from employeee
 where sex = 'M';
 
 -- find the sum of all employee salary
 select sum(salary)
 from employeee;
 
 -- count number of male and female
 select count(sex),sex
 from employeee
 group by sex;
 
 -- find total sales of each salesmen
 
 select sum(total_sales),emp_id
 from works_with 
 group by emp_id;
 
 -- find total sales of each client
 select sum(total_sales), client_id
 from works_with
 group by client_id;
 
 -- wild card
 -- % = any # characters ,    _  = one character
 -- find any client's who are an LLC
 
 select  * 
 from client
 where client_name LIKE '%LLC';
 
 -- find the brach supplier name who are in lable business
 
 select * 
 from branch_supplier
 where supplier_name LIKE '%ball';
 
 -- find employee who born in september
 select *
 from employeee
 where birth_date LIKE '____-09%';
 
 -- Union in sql  
 
 -- find th list of employee and branch name
 
 select  first_name
 from employeee
 union
 select  branch_name
 from branch
 union 
 select client_name
 from client;
 
 -- find the list of all client name and all supplier name
 select client_name ,client.branch_id
 from client
 union
 select supplier_name,branch_supplier.branch_id
 from  branch_supplier;
 
 -- insert  the value in branch table
 insert into branch values (4,'Buffalo',null,null);
 
 -- JOINS 
 -- join are use to commibine two or more row from two different  table
 -- below is inner join
 -- in inner join only common record  from both the table is loaded 
 select employeee.emp_id,employeee.first_name, branch.branch_name 
 from employeee
 join branch
 on employeee.emp_id = branch.mgr_id;
 
 
 -- LEFT join all the record from the left table and only common record from right table is loaded
  select employeee.emp_id,employeee.first_name, branch.branch_name 
 from employeee
 left join branch
 on employeee.emp_id = branch.mgr_id;
 
 
 -- in RIGHT join it load all the record from  right table and common record from left table..
 
  select employeee.emp_id,employeee.first_name, branch.branch_name 
 from employeee
 right join branch
 on employeee.emp_id = branch.mgr_id;
 
 -- NESTED  queries
 -- nested queries having multiple select statement
 
 -- find the name of all employee who have sold over 30000 to a single client
 
 select employeee.first_name
 from employeee
 where employeee.emp_id in (
 
 select works_with.emp_id 
 from works_with
 where works_with.total_sales > 30000
 );
 
 
 -- find the all client who are handle by the branch
 -- that Michel schot  manage
 -- assume you know the Michel Id
 
 select client.client_name
 from client
 where client.branch_id = (
 
 select branch.branch_id
 from branch
 where branch.mgr_id = 102
 Limit 1
 );
 
 
 -- 0n DELETE
 -- on delete set null ---- it will when the data is delete form the column it set the value as null
  
-- on delete cascade  -- it will delete the entire row...


-- =============== TRIGGER in MYSQL ============= 
-- trigger is a block of code when certain operation is happen in data base


create table trigger_test(
message varchar(20)
);

DELIMITER $$
CREATE
	TRIGGER my_trigger BEFORE INSERT
    ON employeee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES('add new employee');
	END $$
DELIMITER ;

insert into employeee values(109,"Osker","Mantes","1981-01-10","M",20000,106,3);

select * from trigger_test;

DELIMITER $$
CREATE
	TRIGGER my_trigger1 BEFORE INSERT
    ON employeee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES(NEW.first_name);
	END $$
DELIMITER ;

insert into employeee values(110,"kilin","molen","1988-09-03","F",35000,106,3);