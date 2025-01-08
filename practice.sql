create table student
(
	student_id int primary key auto_increment,
	s_name varchar(10),
	s_age tinyint,
	DOB date,
	mobile bigint,
	email varchar(50),
	state varchar(50)
);

INSERT INTO student (s_name, s_age, DOB, mobile, email, state)
VALUES 
('John Doe', 20, '2004-05-10', 9876543210, 'johndoe@example.com', 'AP'),
('Jane Smith', 22, '2002-07-15', 9871234567, 'janesmith@example.com', 'TN'),
('Johnson', 21, '2003-09-12', 9878901234, 'mikejohnson@example.com', 'KA'),
('Davis', 19, '2005-03-22', 9876547890, 'emilydavis@example.com', 'AP'),
('Robert', 23, '2001-11-05', 9876123456, 'robertbrown@example.com', 'TN'),
('Wilson', 20, '2004-06-30', 9876234567, 'sophiawilson@example.com', 'AP'),
('James', 21, '2003-12-01', 9877890123, 'jamesmiller@example.com', 'KA');

alter table student
drop state;

desc student;

select * from student;

alter table student
add column state varchar(100);

desc student;

alter table student 
add column state varchar(100)
after email;

update student 
set state = "AP"
where student_id=1;


select * from student;
update student 
set state = "TN"
where student_id = 3;

update student 
set state = "KA"
where student_id = 2;

update student 
set state = "TN"
where student_id = 4;

update student 
set state = "AP"
where student_id = 5;

update student 
set state = "AP"
where student_id = 6;

update student 
set state = "KA"
where student_id = 7;

alter table student 
add institute varchar(100);

select * from student;

select student_id,s_age,state from student;

select student_id,s_age,state from student where student_id=4;

select student_id,s_age,state from student where institute="SV";

select student_id,s_age,state from student where s_age >= 20;

update student set institute="MITS" where student_id = 2;
update student set institute="MITS" where student_id = 3;
update student set institute="VIT" where student_id = 5;

alter table student
add primary key(student_id);

delete student_id from student where s_age=20; --- delete command

alter table student 
modify column institute varchar(10) not null;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    departmentid int,
    salary int
);

INSERT INTO employee(emp_id, name, departmentid, salary) VALUES
(1, 'John Doe', 101, 50000),
(2, 'Jane Smith', 102, 60000),
(3, 'Alice Johnson', null, 70000),
(4, 'Bob Brown', 103, 55000);

select * from employee;

desc employee;

CREATE TABLE department (
    departmentid INT, 
    departmentname VARCHAR(50),
    manager VARCHAR(50)
);



desc department;

select * from department;

alter table department
add constraint fk_departmentid
foreign key(departmentid) references employees(departmentid);

ALTER TABLE department
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager) REFERENCES employee(emp_id);







INSERT INTO depart(departmentid, departmentname, manager) VALUES
(101, 'HR', Jhn),
(102, 'Finance', Sarah),
(103, 'IT', Mike),
(104, 'Marketing', Anna);




CREATE TABLE a (
    employeeid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    departmentid INT UNIQUE,
    salary INT
);

INSERT INTO a(name, departmentid, salary) 
VALUES 
('Alice', 101, 50000),
('Bob', 102, 60000),
('Charlie', NULL, 70000),
('Diana', 103, 55000);


CREATE TABLE v (
    departmentid INT PRIMARY KEY,
    departmentname VARCHAR(30),
    manager VARCHAR(40),
    FOREIGN KEY (departmentid) REFERENCES aa(departmentid)
);


INSERT INTO v(departmentid, departmentname, manager) 
VALUES 
(101, 'HR', 'John'),
(102, 'finance', 'Sarah'),
(103, 'IT', 'Mike'),
(104, 'marketing', 'Anna');

SELECT * FROM a;
SELECT * FROM v;



CREATE TABLE e (
    employeeid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    departmentid INT UNIQUE,
    salary INT
);

-- Insert data into 'aa'
INSERT INTO e(name, departmentid, salary) 
VALUES 
('Alice', 101, 50000),
('Bob', 102, 60000),
('Charlie', NULL, 70000),
('Diana', 103, 55000);

CREATE TABLE f (
    departmentid INT PRIMARY KEY,
    departmentname VARCHAR(30),
    manager VARCHAR(40),
    FOREIGN KEY (departmentid) REFERENCES aa(departmentid)
);

INSERT INTO f(departmentid, departmentname, manager) 
VALUES 
(12, 'HR', 'John'),
(21, 'finance', 'Sarah'),
(13, 'IT', 'Mike'),
(24, 'marketing', 'Anna');

select * from vv;
select * from e;










SELECT * FROM e;
SELECT * FROM f;

select * from e
inner join f on
e.name=f.departmentname;

alter table e
add constraint fk_f
foreign key(id) references e(departmentid);





















