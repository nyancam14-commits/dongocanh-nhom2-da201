create database HR;
use HR_Management;
create table Department(
dept_id int primary key auto_increment,
dept_name varchar(100) not null unique);
create table employee(
emp_id int primary key auto_increment,
emp_fullname varchar(100) not null,
emp_mail varchar(100) not null unique,
emp_hire_date date,
emp_id int);
insert into department(dept_name)
values('nhân sự'),
('kế toán'),
('it');
select * from department;
insert into employee(emp_fullname, emp_mail, emp_hire_date, dept_id)
values('Trịnh Mai Hương', 'huongt@gmail.com', '2025-06_20',1),
('Nguyễn Quốc An', 'annq@gmail.com', '2024-10_29', 3);
select * from employee;
set sql_safe_update =0;
select * from employee
where dept_id = 3;
set sql_safe_update=0; 
update employee
set dept_id = 2
where emp_fullname = 'Nguyễn quốc an';
delete from employee 
where emp_fullname = ' trịnh mai hương ';
delete from department
where dept_name = 'Nhân sự';