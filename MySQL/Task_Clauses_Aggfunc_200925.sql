SHOW databases;
CREATE DATABASE SchoolDB;
USE SchoolDB;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 5),
    Gender VARCHAR(10) DEFAULT 'Unknown',
    Class VARCHAR(20),
    Section CHAR(1),
    Marks INT,
    Email VARCHAR(100) UNIQUE
);
SHOW TABLES;

INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender, Class, Section, Marks, Email) VALUES
(1, 'John', 'Smith', 15, 'Male', '10th', 'A', 85, 'john.smith@email.com'),
(2, 'Emma', 'Johnson', 16, 'Female', '10th', 'B', 92, 'emma.johnson@email.com'),
(3, 'Michael', 'Brown', 14, 'Male', '9th', 'A', 78, 'michael.brown@email.com'),
(4, 'Sophia', 'Davis', 15, 'Female', '10th', 'C', 88, 'sophia.davis@email.com'),
(5, 'William', 'Wilson', 17, 'Male', '11th', 'A', 95, 'william.wilson@email.com'),
(6, 'Olivia', 'Miller', 16, 'Female', '11th', 'B', 91, 'olivia.miller@email.com'),
(7, 'James', 'Taylor', 15, 'Male', '10th', 'A', 82, 'james.taylor@email.com'),
(8, 'Ava', 'Anderson', 14, 'Female', '9th', 'B', 76, 'ava.anderson@email.com'),
(9, 'Robert', 'Thomas', 16, 'Male', '11th', 'C', 89, 'robert.thomas@email.com'),
(10, 'Mia', 'Jackson', 15, 'Female', '10th', 'B', 94, 'mia.jackson@email.com'),
(11, 'David', 'White', 17, 'Male', '12th', 'A', 97, 'david.white@email.com'),
(12, 'Charlotte', 'Harris', 16, 'Female', '11th', 'A', 90, 'charlotte.harris@email.com'),
(13, 'Joseph', 'Martin', 14, 'Male', '9th', 'C', 81, 'joseph.martin@email.com'),
(14, 'Amelia', 'Thompson', 15, 'Female', '10th', 'A', 87, 'amelia.thompson@email.com'),
(15, 'Daniel', 'Garcia', 16, 'Male', '11th', 'B', 93, 'daniel.garcia@email.com'),
(16, 'Evelyn', 'Martinez', 14, 'Female', '9th', 'A', 79, 'evelyn.martinez@email.com'),
(17, 'Ethan', 'Robinson', 17, 'Male', '12th', 'B', 96, 'ethan.robinson@email.com');

SELECT * FROM Students;


-- Section A – Clauses (15 Questions)
-- 1) Display all students who belong to Class '10th'.
SELECT * FROM students WHERE Class = '10th';

-- 2) Find students whose age is between 10 and 15.
SELECT * FROM Students WHERE Age BETWEEN 10 AND 25;

-- 3) Display all distinct classes available in the table.
SELECT DISTINCT Class FROM Students;

-- 4) Show students in ascending order of their Marks.
SELECT * 
FROM Students
ORDER BY Marks ASC;

-- 5) Show students in descending order of Age.
SELECT * 
FROM Students
ORDER BY Age DESC;

-- 6) Display the top 5 students with highest marks.
SELECT * FROM Students
ORDER BY Marks DESC
LIMIT 5;

-- 7) Show students whose name starts with 'A'.
SELECT * FROM Students
WHERE FirstName LIKE 'A%';

-- 8) Show students whose LastName ends with 'n'.
SELECT * FROM Students
WHERE LastName LIKE '%n';

-- 9) Find students who are in Section 'A' or 'B'.
SELECT * FROM Students
WHERE Section IN ('A','B');

-- 10) Find students not in Section 'C'.
SELECT * FROM Students
WHERE Section NOT IN ('C');

-- 11) Display students who have NULL values in Email.
SELECT *
FROM Students
WHERE Email = 'NULL';

-- 12) Display students who are not assigned to any Class.
SELECT *
FROM Students
WHERE Class = 'NULL';

-- 13) Show students where Marks are greater than 75.
SELECT * FROM Students
WHERE Marks > 75;

-- 14) Find students who belong to Class '8th' and Section 'B'.
SELECT * FROM Students
WHERE Class = '10th' AND Section = 'B';

-- 15) Find students who belong to Class '9th' or Class '10th'.
SELECT * FROM Students
WHERE Class = '9th' OR Class = '10th';



-- Section B – Constraints (10 Questions)
-- 16) Try inserting a student with a duplicate StudentID. What happens?
INSERT INTO Students (StudentID, FirstName, LastName, Age, Class, Section, Marks, Email)
VALUES (1, 'Tom', 'Hardy', 16, '10th', 'A', 85, 'tom.hardy@email.com');

-- MySQL prevents the insertion because StudentID = 1 already exists for John Smith.
-- The PRIMARY KEY constraint enforces uniqueness and prevents duplicates.

-- 17) Try inserting a student with NULL in FirstName. What happens?
INSERT INTO Students (StudentID, FirstName, LastName, Age, Class, Section, Marks, Email)
VALUES (19, NULL, 'Smith', 15, '10th', 'B', 88, 'null.first@email.com');

-- ❌ Insertion fails
-- Error: Column 'FirstName' cannot be null
-- Reason: NOT NULL constraint on FirstName column

-- 18) Try inserting a student with Age less than 5. What happens?
INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender, Class, Section, Marks, Email)
VALUES (20, 'Leo', 'Small', 4, 'Male', 'KG', 'A', 95, 'leo.small@email.com');
-- Result: ❌ Insertion fails
-- Error: Check constraint 'students_chk_1' is violated
-- Reason: Age must be >= 5 (CHECK constraint enforced)

-- 19) Insert a student without specifying Gender. Which value gets stored?
-- Insert a student without specifying Gender
INSERT INTO Students (StudentID, FirstName, LastName, Age, Class, Section, Marks, Email)
VALUES (21, 'Taylor', 'Swift', 16, '11th', 'A', 92, 'taylor.swift@email.com');

SELECT StudentID, FirstName, Gender FROM Students WHERE StudentID = 21;

-- Result: ✅ Insertion succeeds
-- Gender value stored: 'Unknown' (DEFAULT value)
-- Because the table was created with: Gender VARCHAR(10) DEFAULT 'Unknown'

-- 20) Try inserting duplicate emails. What happens?
-- Try to insert a student with duplicate email
INSERT INTO Students (StudentID, FirstName, LastName, Age, Gender, Class, Section, Marks, Email)
VALUES (22, 'John', 'Doe', 15, 'Male', '10th', 'B', 85, 'john.smith@email.com');

-- Result: ❌ Insertion fails
-- Error: Duplicate entry 'john.smith@email.com' for key 'students.Email'
-- Reason: Email column has UNIQUE constraint, preventing duplicate values

-- 21) Alter the table to add a new column PhoneNumber (VARCHAR(15)) UNIQUE.
ALTER TABLE Students
ADD COLUMN PhoneNumber VARCHAR(15) UNIQUE;

-- Verify the new column structure
DESCRIBE Students;

-- Expected output: PhoneNumber column added with UNIQUE constraint

-- 22) Add a new column AdmissionDate DATE DEFAULT CURRENT_DATE.
-- Add a new column AdmissionDate with DEFAULT CURRENT_DATE
ALTER TABLE Students
ADD COLUMN AdmissionDate DATE DEFAULT (CURRENT_DATE);

-- Verify the new column structure
DESCRIBE Students;

-- Expected output: AdmissionDate column added with DEFAULT current date
-- For existing rows, the AdmissionDate will be NULL unless updated
-- For new insertions, the current date will be automatically inserted

-- 23) Drop the constraint on Age column.

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Students' AND CONSTRAINT_TYPE = 'CHECK';

-- Assuming the constraint name is 'students_chk_1' (common default)
ALTER TABLE Students
DROP CHECK students_chk_1;

-- Verify the constraint is removed
DESCRIBE Students;

-- The Age column will no longer show the CHECK constraint
-- Now values less than 5 can be inserted into the Age column


-- 24) Add a CHECK constraint so Marks should be between 0 and 100.
ALTER TABLE Students
ADD CONSTRAINT chk_marks_range CHECK (Marks BETWEEN 0 AND 100);

-- Verify the constraint was added
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Students';

-- Test the constraint by trying to insert invalid marks
INSERT INTO Students (StudentID, FirstName, LastName, Age, Marks, Email)
VALUES (100, 'Test', 'Student', 15, 105, 'test@email.com');


-- This should fail with a check constraint violation error

-- 25) Drop the constraint on Email.

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Students' AND CONSTRAINT_TYPE = 'UNIQUE';

-- Assuming the constraint name is 'Email' (common default)
ALTER TABLE Students
DROP INDEX Email;

-- Verify the constraint is removed
DESCRIBE Students;

-- The Email column will no longer show UNIQUE key in the Key column
-- Now duplicate emails can be inserted into the Email column


-- Section C – Aggregation Functions (15 Questions)

SELECT * FROM Students;
-- 26) Find the total number of students in the table.
SELECT COUNT(*) FROM Students;

-- 27) Find the average marks of all students.
SELECT AVG(Marks) FROM Students;

-- 28) Find the maximum marks scored by any student.
SELECT MAX(Marks) FROM Students;

SELECT
StudentID,
FirstName,
LastName,
Marks
FROM Students
WHERE Marks = (SELECT MAX(Marks) FROM Students);

-- 29) Find the minimum marks scored by any student.
SELECT MIN(Marks) FROM Students;

SELECT
StudentID,
FirstName,
LastName,
Marks
FROM Students
WHERE Marks = (SELECT MIN(Marks) FROM Students);


-- 30) Find the total marks scored by all students combined.
SELECT SUM(Marks) FROM Students;

-- 31) Count how many students are in Class '10th'.
SELECT
COUNT(*)
FROM Students
WHERE Class = '10th';

-- 32) Find the average age of students in Section 'A'.
SELECT
AVG(Age)
FROM Students
WHERE Section = 'A';

-- 33) Display the total number of students in each Class.
SELECT
Class,
COUNT(*)
FROM Students
GROUP BY Class;

-- 34) Display the highest marks obtained in each Class.
SELECT
Class,
MAX(Marks)
FROM Students
GROUP BY Class
ORDER BY Class;

-- 35) Display the lowest marks obtained in each Section.
SELECT
Class,
MIN(Marks)
FROM Students
GROUP BY Class
ORDER BY Class;

-- 36) Find the number of male and female students.
SELECT
Gender,
COUNT(*)
FROM Students
GROUP BY Gender;

-- 37) Display the average marks per Section.
SELECT
Section,
AVG(Marks)
FROM Students
GROUP BY Section;

-- 38) Display the sum of marks per Class.
SELECT
Class,
SUM(Marks)
FROM Students
GROUP BY Class;

-- 39) Find which Section has the maximum average marks.
SELECT
Section,
AVG(Marks)
FROM Students
GROUP BY Section
ORDER BY AVG(Marks) DESC
LIMIT 1;

-- 40) Find which Class has the highest number of students.
SELECT
Class,
COUNT(*)
FROM Students
GROUP BY Class
ORDER BY COUNT(*) DESC
LIMIT 1;



-- Section D – Order of Execution & HAVING (10 Questions)

SELECT * FROM studentS;
-- 41) Display each Class and count of students, but only those Classes having more than 3 students.
SELECT
Class,
COUNT(*)
FROM Students
GROUP BY Class
HAVING COUNT(*) > 3;

-- 42) Find average marks of students per Section where average marks are greater than 60.
SELECT
Section,
AVG(Marks)
FROM Students
GROUP BY Section
HAVING AVG(Marks) > 60;

-- 43) Show Class-wise maximum marks, but only display Classes where maximum marks > 90.
SELECT
Class,
MAX(Marks)
FROM Students
GROUP BY Class
HAVING MAX(Marks) > 90;

-- 44) Display Class-wise student count, order results by Class in ascending order.
SELECT
Class,
COUNT(*)
FROM Students
GROUP BY class
ORDER BY COUNT(*) ASC;

-- 45) Show Section-wise total marks, order results in descending order of total marks.
SELECT
section,
SUM(Marks)
FROM Students
GROUP BY Section
ORDER BY SUM(Marks) DESC;

-- 46) Display Section-wise average age, only for Sections having average age less than 14.
SELECT
section,
AVG(age)
FROM Students
GROUP BY Section
HAVING AVG(age) < 20 ;

-- 47) Find the number of students in each Section, but exclude Section 'C'.
SELECT
Section,
COUNT(*)
FROM Students
WHERE section != 'C'
GROUP BY section;

-- 48) Find Classes where total students are between 5 and 10.
SELECT
Class,
COUNT(*)
FROM Students
GROUP BY Class
HAVING COUNT(*) BETWEEN 5 AND 10;

-- 49) Show average marks of each Class, display only top 3 Classes with highest averages.
SELECT
Class,
AVG(Marks)
FROM Students
GROUP BY Class
ORDER BY AVG(Marks) DESC
LIMIT 3;

-- 50) Display Class-wise minimum marks, but only for Classes where minimum marks > 40.
SELECT
Class,
MIN(Marks)
FROM Students
GROUP BY Class
HAVING MIN(Marks) > 40;








