USE companydb2;

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);


SELECT * FROM `employees`;


ALTER TABLE employees
ADD COLUMN HireDate date;

ALTER TABLE employees
ADD COLUMN Salary int;

insert into employees(firstname,lastname,hiredate,salary)
values ('Nguyen','A','2021-3-8',1000 );
update employees 
set salary =4800
where employeeid =2;
update employees
set hiredate =2021-08-01
where firstname ='David';
delete from employees
where empoyeeid =1;
delete from employees
where salary <500;
select * from employees
where Salary >5000;
select * from employees
order by hiredate desc;





