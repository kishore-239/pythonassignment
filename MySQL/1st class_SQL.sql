-- create a new database
CREATE DATABASE INNOMATICS;

-- to display all databases
show databases;

-- to select particular database
use innomatics;

-- create a table
create table students(stdid int , sname varchar(20), age decimal(4,2), sdoj date);

-- to display all tables from database
show tables;

-- description about table
desc students;

-- Deleting entire database or table use DROP
DROP DATABASE innomatics;
DROP TABLE students;

show databases;

-- Alter - add is used to add new columns
ALTER TABLE students
add column email varchar(25);

-- Alter -drop
ALTER TABLE students
DROP COLUMN email;

-- alter -modify
ALTER TABLE students
MODIFY age INT;

-- Alter - Rename is used to rename both column names and table names
ALTER TABLE students
RENAME COLUMN stdid TO rollno;

ALTER TABLE students
RENAME TO student;

show tables;

-- Truncate - It erases all records from the table
TRUNCATE TABLE student;


-- DML - Data Manipulation Language
-- Insert - It is used to insert records or values into the table
-- Two ways to Insert 
-- 1) Implicit method - Insert all records at a time
-- 2) Explicit method - Insert only specific records

-- Insert (Implicit)
INSERT INTO student
VALUES
(1001,'Alice',34,'2024-4-12');

INSERT INTO student 
VALUES
(1002,'Bob',32,'2024-5-23'),
(1003,'Charlie',25,'2024-7-27'),
(1004,'David',15,'2024-8-14');



-- DQL - Data Query Language
-- SELECT

SELECT * 
FROM student;

SELECT 
	rollno,
    sname
FROM student;


-- Insert (Explicit)
INSERT INTO student(sname,age)
VALUES
('Reeta',24),
('Seetha',26);



-- UPDATE - It is used to modify in a table with the help of WHERE condition
UPDATE student SET sname = 'swathi' WHERE rollno = 1001;


DELETE FROM student
WHERE rollno = 1004;

SELECT *
FROM student;

-- Constraints in SQL
-- These are the rules that we can set for the columns.

-- 1) Not Null - doesnt allow Null values
-- 2) Unique - doesnt allow duplicates
-- 3) Primary Key -> combination of [ unique + Not Null ]
-- 4) Foreign Key - ........
-- 5) Check - to check the conditions
-- 6) Default - It is used to set a default value for a specific column

CREATE TABLE staff(
id INT PRIMARY KEY,
name VARCHAR(30) UNIQUE,
mobile BIGINT NOT NULL,
age INT CHECK(age >= 18),
dept VARCHAR(20) DEFAULT "DS"
);

SHOW TABLES;
DESC staff;

INSERT INTO staff(id,name,mobile,age)
VALUES
(1001,'alice',9087654321,23);

INSERT INTO staff(id,name,mobile,age)
VALUES
(1002,'bob',9807654321,25);

select * from staff;

-- Auto Increment along with Primary Key
CREATE TABLE x(
id INT auto_increment primary key,
name varchar(30)
);

INSERT INTO x(name)
VALUES
("hgh");


INSERT INTO x(name)
VALUES
("hgfsdfh");

desc x;

SELECT * FROM x;

-- Import and Export tables
-- Export table from sql to local machine
show tables;

SELECT *
FROM train;

SELECT DISTINCT
Embarked 
FROM train;

-- WHERE clause and operators

-- conditional operators
SELECT * FROM student
WHERE age>25;

SELECT 
Name,
Age As 'age>60'
FROM train
WHERE Age>60;


-- Logical operators
SELECT * FROM student
WHERE sname = 'swathi' AND age > 20;















