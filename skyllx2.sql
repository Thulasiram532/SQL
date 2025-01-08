create database college;
use college;
show tables;
create table students(student_id int primary key auto_increment,first_name varchar(100),
last_name varchar(100),date_of_birth date,email varchar(100),phone_number varchar(15),address varchar(255),
date_joined timestamp);
INSERT INTO students (first_name, last_name, date_of_birth, email, phone_number, address, date_joined) VALUES
('John', 'Doe', '2000-05-14', 'john.doe@example.com', '123-456-7890', '123 Elm St, Springfield', '2023-01-01 09:15:00'),
('Jane', 'Smith', '1998-09-22', 'jane.smith@example.com', '987-654-3210', '456 Oak St, Springfield', '2023-01-05 14:30:00'),
('Michael', 'Brown', '1999-11-10', 'michael.brown@example.com', '555-234-5678', '789 Pine St, Springfield', '2023-01-10 11:00:00'),
('Emily', 'Davis', '2001-07-08', 'emily.davis@example.com', '333-456-7891', '321 Maple St, Springfield', '2023-01-15 10:45:00'),
('David', 'Wilson', '2002-03-18', 'david.wilson@example.com', '444-555-6666', '654 Birch St, Springfield', '2023-01-20 16:20:00'),
('Sarah', 'Taylor', '2000-12-25', 'sarah.taylor@example.com', '222-333-4444', '987 Cedar St, Springfield', '2023-01-25 13:00:00'),
('James', 'Anderson', '1997-08-30', 'james.anderson@example.com', '777-888-9999', '123 Walnut St, Springfield', '2023-01-30 09:30:00'),
('Laura', 'Thomas', '2003-02-14', 'laura.thomas@example.com', '111-222-3333', '456 Chestnut St, Springfield', '2023-02-01 15:45:00'),
('Robert', 'Jackson', '2001-05-20', 'robert.jackson@example.com', '888-999-0000', '789 Redwood St, Springfield', '2023-02-05 11:25:00'),
('Jessica', 'White', '1999-01-17', 'jessica.white@example.com', '999-111-2222', '321 Sycamore St, Springfield', '2023-02-10 08:50:00');
select * from students;

create table students_academics(academic_id int primary key auto_increment,student_id int, 
CONSTRAINT fk_students_id FOREIGN KEY (student_id) REFERENCES students(student_id),
semester int,gpa decimal(3,2),major varchar(100),graduation_year int);

INSERT INTO students_academics (student_id, semester, gpa, major, graduation_year) VALUES
(1, 1, 3.80, 'Computer Science', 2024),
(2, 2, 3.65, 'Mechanical Engineering', 2023),
(3, 1, 3.90, 'Electrical Engineering', 2025),
(4, 3, 3.75, 'Civil Engineering', 2024),
(5, 4, 3.85, 'Business Administration', 2023),
(6, 2, 3.60, 'Psychology', 2025),
(7, 1, 3.70, 'Biology', 2024),
(8, 3, 3.95, 'Mathematics', 2023),
(9, 2, 3.80, 'Physics', 2025),
(10, 4, 3.88, 'Economics', 2024);

select * from students_academics;

desc students_academics;

select * from students;

desc students;

select max(gpa) from students_academics;

select avg(gpa) from students_academics;


SELECT * 
FROM students 
WHERE student_id IN (
    SELECT student_id 
    FROM students_academics
    WHERE gpa > (SELECT AVG(gpa) FROM students_academics)
);

select semester,count(*) from students_academics group by semester having count(*) > 1;


select student_id,first_name,last_name from students where student_id in (
select semester,count(*) from students_academics 
group by semester having count(*) > 1);

select * from students_academics;

select max(gpa) from students_academics;

select student_id,first_name,last_name from students 
where student_id in (select max(gpa) from students_academics );

select * from students;

select min(gpa) from students_academics;
select * from students where student_id < (select min(gpa) from students_academics);

select semester,count(*) from students_academics group by semester having count(*) > 1;

select graduation_year from students_academics where gpa = (select max(gpa) from students_academics);

select * from students where student_id in (select student_id from students_academics where graduation_year= (
	select graduation_year 
	from students_academics 
	where gpa = 
(
	select max(gpa) 
    from students_academics
)));


select * from students where student_id = (select max(gpa) from students_academics);

select * from students where student_id in (select student_id from students_academics where graduation_year= (
	select graduation_year 
	from students_academics 
	where gpa = 
(
	select max(gpa) 
    from students_academics
))) limit 1;

select * from students where student_id = (select max(gpa) from students_academics where student_id=5);

select gpa from students_academics where student_id=5;

select student_id from students_academics
where gpa > (
select gpa 
from students_academics 
where student_id=5);


select * from students where student_id in (select student_id from students_academics
where gpa > (
select gpa 
from students_academics 
where student_id=5));

select gpa from students_academics where student_id=3 and semester = "current";

select gpa from students_academics where gpa > (
select gpa from students_academics where student_id=3);

select * from students_academics where gpa in (select gpa from students_academics 
where gpa  > (
select gpa from students_academics where student_id=3));

use college;

create table emp(emp_id int primary key auto_increment,emp_name varchar(20),emp_age int);

INSERT INTO emp (emp_name, emp_age) VALUES 
('Alice', 25),
('Bob', 30),
('Charlie', 28),
('Diana', 35),
('Eve', 40);

select * from emp;

create table projects(p_id int primary key auto_increment,p_name varchar(100),p_duration int,
p int,foreign key (p) references emp(emp_id)); 

INSERT INTO projects (p_name, p_duration, p)
VALUES 
  ('Project Alpha', 12, 1),
  ('Project Beta', 6, 2),
  ('Project Gamma', 18, 3),
  ('Project Delta', 24, 4),
  ('Project Epsilon', 8, 5);
  
  select * from emp 
  inner join projects on
  emp.emp_id=projects.p;

select emp_name,p_name from emp 
  inner join projects on
  emp.emp_id=projects.p;

select * from emp 
  right join projects on
  emp.emp_id=projects.p;
  
  
  
  select emp_name,p_name from emp 
  right join projects on
  emp.emp_id=projects.p;


select * from emp 
  left join projects on
  emp.emp_id=projects.p;



select * from emp 
  left join projects on
  emp.emp_id=projects.p
union
select * from emp 
  right join projects on
  emp.emp_id=projects.p;
  
  select emp.emp_name,projects.p_name from emp 
  right join projects on
  emp.emp_id=projects.p;

select * from emp 
where emp_id in (
select p_name from projects where p=2);


select * from emp 
where emp_id in 
(
	select p_name 
	from projects
);

use employe;

CREATE TABLE bank (
    bank_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_name VARCHAR(100),
    location VARCHAR(100),
    established_year INT,
    total_assets DECIMAL(15, 2)
);


INSERT INTO bank (bank_name, location, established_year, total_assets)
VALUES ('Bank of America', 'USA', 1784, 3400000000.00),
       ('HSBC', 'UK', 1865, 2600000000.00),
       ('Citigroup', 'USA', 1812, 3200000000.00);

select * from bank;

ALTER TABLE bank
ADD COLUMN balance DECIMAL(15, 2);

UPDATE bank
SET balance = 500000000.00
WHERE bank_name = 'Bank of America';

UPDATE bank
SET balance = 350000000.00
WHERE bank_name = 'HSBC';

UPDATE bank
SET balance = 420000000.00
WHERE bank_name = 'Citigroup';


select * from bank;
use employe;
select * from employe.employe;

start transaction;
select balance from bank 
where bank_id = 1 and balance > 10000;
update bank set balance = balance - 5000
where bank_id = 1;
update bank set balance = balance + 5000
where bank_id = 2;
commit;

select * from bank;
use employe; 
use bank;


CALL insert_bank(1, 'Bank of America', 'USA', 1784, 3400000000.00, -5000);

use college;

create table customer(cid int primary key,c_name varchar(40),email varchar(50));
insert into customer values(1,"Akhil","akhil@gmail.com"),(2,"Siddu","siddu@gmail.com");
select * from customer;

create table orders(o_id int primary key,product varchar(40),cid int,foreign key(cid) references customer(cid),total int);

insert into orders values(1,"laptop",1,20000),(2,"mobile",1,10000),(3,"tab",2,10000),(4,"bench",2,10000); 

SELECT * FROM orders;

create table orderlogs(orderlog_ld int primary key,cid int,foreign key(cid) references orders(cid),order_log date);

insert into orderlogs values(1,1,"2024-10-12"),(2,1,"2025-10-12"),(3,2,"2025-01-01");

select * from orderlogs;

DELIMITER $$
use employee $$
create trigger afterinsert_orders
after insert on orders
for each row
begin
	insert into orderlogs(oid,cid,date)
    select orders.oid,orders.cid,orders.now()
    from inserted orders;
end; $$
	DELIMITER ;

employee














