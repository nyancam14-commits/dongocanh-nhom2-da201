USE companydb2;

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);


SELECT * FROM `employees`;


ALTER TABLE `employees`
ADD COLUMN HireDate date;

ALTER TABLE `employees`
ADD COLUMN Salary int;