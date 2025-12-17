-- 📘 SQL Practice Task – Complete Commands

-- Task 1: Creating Database and Table (DDL Commands)
-- Create Database (DDL)
CREATE DATABASE CompanyDB;

-- Use the Database
USE CompanyDB;

-- Create Employees Table (DDL)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15)
);

-- Verify table structure
DESCRIBE Employees;



-- Task 2: Altering the Table (DDL Commands)

-- Use the Database
USE CompanyDB;

-- 1. Add a column JobTitle (VARCHAR(50))
ALTER TABLE Employees
ADD COLUMN JobTitle VARCHAR(50);

-- 2. Modify the column Salary to increase precision → DECIMAL(12,2)
ALTER TABLE Employees
MODIFY COLUMN Salary DECIMAL(12,2);

-- 3. Rename column Department to DeptName
ALTER TABLE Employees
RENAME COLUMN Department TO DeptName;

-- 4. Drop column PhoneNumber
ALTER TABLE Employees
DROP COLUMN PhoneNumber;

-- 5. Add a CHECK constraint on Salary so it cannot be less than 20000
ALTER TABLE Employees
ADD CONSTRAINT chk_salary_min CHECK (Salary >= 20000);

-- 6. Drop the CHECK constraint
ALTER TABLE Employees
DROP CHECK chk_salary_min;

-- Verify the final table structure
DESCRIBE Employees;


-- Task 3: Data Manipulation (DML Commands)

-- Use the Database
USE CompanyDB;

-- 1. Insert 10 rows using normal INSERT
INSERT INTO Employees (EmployeeID, FirstName, LastName, DeptName, Salary, HireDate, Email, JobTitle)
VALUES
(1, 'John', 'Doe', 'HR', 50000.00, '2020-05-15', 'john.doe@company.com', 'HR Manager'),
(2, 'Jane', 'Smith', 'IT', 65000.00, '2019-08-20', 'jane.smith@company.com', 'Software Engineer'),
(3, 'Mike', 'Johnson', 'Finance', 55000.00, '2021-01-10', 'mike.johnson@company.com', 'Accountant'),
(4, 'Sarah', 'Wilson', 'HR', 45000.00, '2022-03-05', 'sarah.wilson@company.com', 'HR Specialist'),
(5, 'David', 'Brown', 'IT', 70000.00, '2018-11-12', 'david.brown@company.com', 'Senior Developer'),
(6, 'Emily', 'Davis', 'Marketing', 48000.00, '2023-02-18', 'emily.davis@company.com', 'Marketing Analyst'),
(7, 'Robert', 'Miller', 'Finance', 60000.00, '2020-07-22', 'robert.miller@company.com', 'Financial Analyst'),
(8, 'Lisa', 'Anderson', 'HR', 42000.00, '2022-09-30', 'lisa.anderson@company.com', 'Recruiter'),
(9, 'James', 'Taylor', 'IT', 58000.00, '2021-04-15', 'james.taylor@company.com', 'DevOps Engineer'),
(10, 'Amanda', 'Thomas', 'Marketing', 52000.00, '2023-01-08', 'amanda.thomas@company.com', 'Content Strategist');

-- 2. Create dummy table EmployeesTemp
CREATE TABLE EmployeesTemp (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DeptName VARCHAR(50),
    Salary DECIMAL(12,2),
    HireDate DATE,
    Email VARCHAR(100) UNIQUE,
    JobTitle VARCHAR(50)
);

-- Insert sample data into EmployeesTemp
INSERT INTO EmployeesTemp (EmployeeID, FirstName, LastName, DeptName, Salary, HireDate, Email, JobTitle)
VALUES
(11, 'Chris', 'Evans', 'IT', 75000.00, '2023-05-20', 'chris.evans@company.com', 'Data Scientist'),
(12, 'Jessica', 'Parker', 'Finance', 53000.00, '2023-06-15', 'jessica.parker@company.com', 'Auditor');

-- Insert from EmployeesTemp into Employees using INSERT INTO SELECT
INSERT INTO Employees (EmployeeID, FirstName, LastName, DeptName, Salary, HireDate, Email, JobTitle)
SELECT EmployeeID, FirstName, LastName, DeptName, Salary, HireDate, Email, JobTitle
FROM EmployeesTemp;

-- 3. Update salary of HR employees by 10%
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DeptName = 'HR';

-- 4. Delete all employees with salary less than 25000
DELETE FROM Employees
WHERE Salary < 25000;

-- Verify the final data
SELECT * FROM Employees ORDER BY EmployeeID;



-- Task 4: Querying Data (SELECT Statements)

-- Use the Database
USE CompanyDB;

-- 1. Display all employees in ascending order of Salary
SELECT * FROM Employees
ORDER BY Salary ASC;

-- 2. Display employees hired after 2020-01-01
SELECT * FROM Employees
WHERE HireDate > '2020-01-01'
ORDER BY HireDate;

-- 3. Find the total number of employees in each department
SELECT DeptName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptName
ORDER BY EmployeeCount DESC;

-- 4. Find the maximum, minimum, and average salary
SELECT 
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary,
    AVG(Salary) AS AvgSalary
FROM Employees;

-- 5. Display employees whose FirstName starts with 'A'
SELECT * FROM Employees
WHERE FirstName LIKE 'A%'
ORDER BY FirstName;

-- 6. Create Departments table and join with Employees
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) UNIQUE,
    Location VARCHAR(100)
);

-- Insert sample data into Departments
INSERT INTO Departments (DeptName, Location) VALUES
('HR', 'Floor 1, Building A'),
('IT', 'Floor 2, Building B'),
('Finance', 'Floor 3, Building A'),
('Marketing', 'Floor 1, Building C');

-- Display employee details with department location using JOIN
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.DeptName,
    d.Location,
    e.Salary,
    e.HireDate,
    e.JobTitle
FROM Employees e
INNER JOIN Departments d 
ON e.DeptName = d.DeptName
ORDER BY e.DeptName, e.LastName;



-- Task 5: TCL Commands (Transaction Control)
-- Use the Database
USE CompanyDB;

-- 1. Begin a transaction
START TRANSACTION;

-- 2. Update an employee's salary, then use ROLLBACK to undo it
-- Check current salary
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE EmployeeID = 1;

-- Update salary
UPDATE Employees 
SET Salary = 60000.00 
WHERE EmployeeID = 1;

-- Verify the update
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE EmployeeID = 1;

-- Rollback to undo the change
ROLLBACK;

-- Verify salary is back to original after rollback
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE EmployeeID = 1;

-- 3. Update another employee's salary, then use COMMIT to save it
START TRANSACTION;

-- Check current salary
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE EmployeeID = 2;

-- Update salary
UPDATE Employees 
SET Salary = 70000.00 
WHERE EmployeeID = 2;

-- Verify the update
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE EmployeeID = 2;

-- Commit to save the change permanently
COMMIT;

-- Verify salary remains changed after commit
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE EmployeeID = 2;

-- 4. Use SAVEPOINT and ROLLBACK TO SAVEPOINT
START TRANSACTION;

-- Check current state
SELECT EmployeeID, FirstName, LastName, Salary, JobTitle 
FROM Employees 
WHERE EmployeeID = 3;

-- First update
UPDATE Employees 
SET Salary = 60000.00 
WHERE EmployeeID = 3;

-- Create savepoint after first update
SAVEPOINT after_salary_update;

-- Second update
UPDATE Employees 
SET JobTitle = 'Senior Accountant' 
WHERE EmployeeID = 3;

-- Verify both changes
SELECT EmployeeID, FirstName, LastName, Salary, JobTitle 
FROM Employees 
WHERE EmployeeID = 3;

-- Rollback to savepoint (undo only the job title change)
ROLLBACK TO SAVEPOINT after_salary_update;

-- Verify only salary change remains, job title reverted
SELECT EmployeeID, FirstName, LastName, Salary, JobTitle 
FROM Employees 
WHERE EmployeeID = 3;

-- Commit the remaining changes
COMMIT;

-- Final verification
SELECT EmployeeID, FirstName, LastName, Salary, JobTitle 
FROM Employees 
WHERE EmployeeID = 3;

























