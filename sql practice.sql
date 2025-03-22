show databases ;
use mysql;
use sakila;


create table A1(A char,B char primary key);

create table A2(C char,B char primary key,foreign key(B) references A1(B));

create table indianstock(car_id int primary key,owner_name varchar(100),c_model varchar(100),price int,brand varchar(90));
INSERT INTO indianstock (car_id, owner_name, c_model, price, brand) VALUES
(1, 'John Doe', 'Model S', 80000, 'Tesla'),
(2, 'Jane Smith', 'Civic', 25000, 'Honda'),
(3, 'Mike Johnson', 'Mustang', 55000, 'Ford'),
(4, 'Emily Davis', 'Corolla', 23000, 'Toyota'),
(5, 'Robert Brown', 'A4', 45000, 'Audi'),
(6, 'Sarah Wilson', 'X5', 60000, 'BMW'),
(7, 'David Martinez', 'Camry', 28000, 'Toyota');

select avg(price) from indianstock;

select brand from indianstock where brand > '2';

select owner_name,brand,c_model from indianstock;

select * from indianstock order by price asc limit 2;

select brand,count(*) from indianstock group by brand having count(brand) > 1;

SELECT brand,MAX(price) FROM indianstock group by brand limit 1;




create database practice;

use practice;

create table student(S_id int primary key, S_name varchar(100),course varchar(100));

insert into student(S_id, S_name, course) values
(  01 , "ram", "BCA"),
(   02 , "raju", "MCA"),
(03   , "viraj", "DA"),
(04, "ramu","DA");

select * from student;

desc student;

select S_id,S_name as Student_name,lower(course) as course_name from student;

select S_id,upper(S_name) as Student_name,course from student;

select trim(S_id),trim(S_name) from student;

select ltrim(S_name) from student;

select rtrim(S_name) from student;

-- concat,substr,lower,upper,trim
use practice;


select upper(trim(S_name)) from student;

select lower(trim(S_name)) from student;

select concat(S_name," ",course) from student;

select reverse(S_name) from student;

select replace("ram","ram","skyllx") from student;

select trim(S_name) from student; 

select left("ram",2) from student;

select right(S_name,2) from student;

select reverse("ramaraju");



SELECT INSTR('ram', 'm');
use practice;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    is_manager BOOLEAN
);

INSERT INTO employees (id, name, age, salary, hire_date, is_manager) VALUES
(1, 'Alice Johnson', 30, 65000.00, '2020-06-15', TRUE),
(2, 'Bob Smith', 25, 52000.50, '2021-08-21', FALSE),
(3, 'Charlie Davis', 40, 80000.00, '2018-11-03', TRUE),
(4, 'Diana Lopez', 29, 58000.75, '2019-07-12', FALSE),
(5, 'Ethan Brown', 35, 72000.00, '2017-09-30', TRUE),
(6, 'Fiona Green', 27, 49000.25, '2022-01-05', FALSE),
(7, 'George White', 50, 95000.00, '2015-04-18', TRUE),
(8, 'Hannah Black', 33, 67000.40, '2020-12-22', FALSE),
(9, 'Ian Grey', 28, 54000.60, '2021-06-10', FALSE),
(10, 'Jane Blue',45, 87000.00, '2016-03-14', TRUE);

desc employees;

select * from employees;

alter table employees 
rename column is_manager to manager;

alter table employees
modify column age tinyint;

alter table employees
add state varchar(100)
default "Kerala";

alter table employees
rename column name to student_name;

alter table employees
rename column hire_date to joining_date;

alter table employees 
add institute varchar(100)
default "presidency university";


select student_name,salary from employees;

select * from employees;

select student_name,manager from employees where manager = True;
select student_name,manager from employees where manager = 1;

select student_name,salary from employees where salary > 60000;

select student_name,age,salary,joining_date from employees where joining_date > '2020-01-01';

select count(student_name) from employees;

select avg(salary) from employees;

select max(salary) as maximum_Salary,min(salary) as lowest_salary from employees;

select * from employees order by salary desc;

select * from employees where age between 25 and 35;

select manager,count(*) from employees group by manager;

update employees
set salary = salary * 0.9;

select * from employees;

-- mysql is a open source relational database management system used to manage and manipulate the database
-- where as sql is used to innteract with database

 select curdate();
 
 select now();

select current_date();

select current_time();

select month('2024-11-12');

select year('2024-11-12');

select day('2024-11-12');

select trim(student_name) from employees;

select upper(student_name) from employees;

select lower(trim(student_name)),upper(trim(student_name)) from employees;

select * from employees where student_name = "alice johnson";

select * from employees;

alter table employees
rename column id to student_id;

select * from employees where student_name like "a%";

select * from employees where student_name like "%a%";

alter table employees
drop institute;

select student_name,length(student_name) from employees;

select student_name,length(student_name) from employees order by manager;

select substr(student_name,2,5) from employees;

-- aggregate functions

select student_name,sum(salary) over (partition by student_name order by manager) from employees;

select student_name,rank() over (partition by manager) from employees;

select student_id,student_name,row_number() over (partition by manager) from employees;

select student_name,avg(salary) over (partition by manager) from employees;

select student_name,dense_rank() over (partition by manager) from employees;

select student_name,lead(salary, 10) over (order by joining_date) from employees;

select lag(joining_date,10) over (order by manager) from employees;

select ntile(3) over (partition by salary) from employees;

select * from employees;

delete from employees where salary < 50000;

alter table employees
auto_increment = 1;

select * from employees;

select sum(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;
select count(*) from employees;
select avg(salary) from employees;

select * from employees where joining_date > subdate(curdate(),interval 3 year);

select * from employees where joining_date < subdate(curdate(),interval 2 year);

