CREATE DATABASE lab_3;
USE lab_3;
CREATE TABLE employee
(empid INT PRIMARY KEY,
name VARCHAR(50),
deptid INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO employee VALUES
(1, 'Arun', 101, 60000, 'Bangalore'),
(2, 'Rahul', 102, 45000, 'Chennai'),
(3, 'Priya', 103, 70000, 'Bangalore'),
(4, 'Sneha', 101, 55000, 'Mumbai'),
(5, 'Kiran', 104, 40000, 'Chennai'),
(6, 'Divya', NULL, 35000, 'Bangalore');
UPDATE employee 
SET deptid = 106
WHERE empid = 6;
CREATE TABLE Department 
(
    deptid INT PRIMARY KEY,
    deptname VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO Department VALUES
(101, 'IT', 'Bangalore'),
(102, 'HR', 'Chennai'),
(103, 'Finance', 'Mumbai'),
(104, 'Sales', 'Delhi'),
(105, 'Marketing', 'Hyderabad');

SELECT * FROM employee;
SELECT * FROM Department;

#1. Display employee names along with their department names using INNER JOIN.
SELECT employee.name , Department.deptname 
FROM employee INNER JOIN Department
ON employee.deptid = Department.deptid;

#2. Display employee ID, employee name and department ID from both tables.
SELECT employee.empid , employee.name , Department.deptid 
FROM employee JOIN Department
ON employee.deptid = Department.deptid;

#3. Display employee names and department locations.
SELECT employee.name , Department.location 
FROM employee JOIN Department 
ON employee.deptid = Department.deptid;

#4. Display employees working in the IT department.
SELECT * FROM employee JOIN Department 
ON employee.deptid = Department.deptid
WHERE Department.deptname = 'IT';

#5. Display employees working in the HR department.
SELECT * FROM employee JOIN Department 
ON employee.deptid = Department.deptid
WHERE Department.deptname = 'HR';

#6. Display employee names, salaries and department names.
SELECT employee.name, employee.salary, Department.deptname
FROM employee JOIN Department
ON employee.deptid = Department.deptid;

#7. Display employees who belong to the Finance department.
SELECT * FROM employee JOIN Department 
ON employee.deptid = Department.deptid
WHERE Department.deptname = 'Finance';

#8. Display all employee names and department names using LEFT JOIN.
SELECT employee.name , Department.deptname 
FROM employee LEFT JOIN department 
ON employee.deptid = Department.deptid;

#9. Display all department names and employee names using RIGHT JOIN.
SELECT employee.name , Department.deptname 
FROM employee RIGHT JOIN department 
ON employee.deptid = Department.deptid;

#10. Display employees working in Bangalore along with their department names.
SELECT * FROM employee JOIN Department
ON employee.deptid = Department.deptid
WHERE employee.city = 'Bangalore';

#11. Display employees whose salary is greater than ₹50,000 along with their department
#names.
SELECT employee.name , employee.salary , Department.deptname
FROM employee JOIN Department
ON employee.deptid = Department.deptid
WHERE employee.salary > 50000;

#12. Display employees who belong to either IT or HR departments.
SELECT * FROM employee JOIN Department
ON employee.deptid = Department.deptid
WHERE Department.deptname IN ('IT','HR');

#13. Display all employees, 
#including those who are not assigned to any department.
SELECT *
FROM employee
LEFT JOIN Department
ON employee.deptid = Department.deptid;

#14. Display departments that do not have any employees.
SELECT Department.deptname
FROM employee
RIGHT JOIN Department
ON Department.deptid = employee.deptid
WHERE employee.empid IS NULL;

#15. Display the total number of employees in each department.
SELECT Department.deptname, COUNT(*)
FROM employee
RIGHT JOIN Department
ON Department.deptid = employee.deptid
GROUP BY Department.deptname;

#16. Display the average salary of employees in each department.
SELECT Department.deptname, AVG(employee.salary)
FROM employee
RIGHT JOIN Department
ON Department.deptid = employee.deptid
GROUP BY Department.deptname;

#17. Display the maximum salary in each department.
SELECT Department.deptname, MAX(employee.salary)
FROM employee
RIGHT JOIN Department
ON Department.deptid = employee.deptid
GROUP BY Department.deptname;

#18. Display departments having more than one employee.
SELECT Department.deptname
FROM employee
RIGHT JOIN Department
ON Department.deptid = employee.deptid
GROUP BY Department.deptname
HAVING COUNT(employee.name)>1;

#19. Display employees whose department location is different from their city.
SELECT employee.name ,employee.city, Department.location
FROM employee JOIN Department
ON Department.deptid = employee.deptid
WHERE employee.city != Department.location;

#20. Display employee names and department names in descending order of salary.
SELECT employee.name , Department.deptname, employee.salary 
FROM employee JOIN Department
ON Department.deptid = employee.deptid
ORDER BY employee.salary DESC;




