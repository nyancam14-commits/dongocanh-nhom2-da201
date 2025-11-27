      
create table employees(
employee_id int primary key,
full_name varchar(100),
department varchar(100),
salary decimal,
hire_date date
);
insert into employees
values
(101, 'Nguyễn Văn A', 'Sales', 55000.00, '2020-08-15'),
(102, 'Trần Thị B', 'IT', 68000.50, '2018-05-20'),
(103, 'Lê Văn C', 'HR', 48000.00, '2021-01-10'),
(104, 'Phạm Thị D', 'Marketing', 62500.25, '2019-11-01'),
(105, 'Hoàng Văn E', 'IT', 75000.00, '2017-03-25');

-- 1 sử dụng count 
select count(employee_id) 
as number_of_employees
from employees;

-- 2 sử dụng sum
select sum(salary) 
as total_monthly_salary
from employees;

-- 3 sử dụng AVG 
select avg(salary)
as average_salary
from employees;

-- 4 sử dụng min và max với số 
select max(salary) 
as highest_salary
from employees;

-- 5 sử dụng max min với ngày tháng
select min(hire_date)
as earliest_hire_date
from employees;

-- 6 kết hợp với where 
select sum(salary)
as it_department_salary
from employees
where department like 'IT';