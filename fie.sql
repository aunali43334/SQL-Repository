--Creating a dataabase
CREATE DATABASE data_base;

--Droping a database
--Select another database then create the existing database
--USE dummy_database;
DROP DATABASE data_base;

USE data_base;

--creating a table inside the data_base
--for right now there is no Primary key inside the table

CREATE TABLE studentData (
rollNumber INT,
studentName varchar(50),
studentAge INT,
studentMarks INT

);

--see the table inside the database
SELECT * FROM studentData;					--This will show the column name only

--inserting data into the table
INSERT INTO studentData VALUES(1,'Mr. John', 21, 81);

--see the inserted data from table 
SELECT * FROM studentData;

--inserting data into the table
INSERT INTO studentData VALUES(2,'Mr. Ethan', 19, 71);

--inserting multiple data into the table
INSERT INTO studentData VALUES
(3,'Mr. Robert', 23, 74),
(4,'Ms. Julia', 25, 68),
(5,'Mr. Adam', 27, 61),
(6,'Mrs. Khan', 24, 83);

--see the inserted data from table 
SELECT * FROM studentData;

CREATE TABLE studentData2 (
rollNumber INT PRIMARY KEY,				   --This column has a Primary key
studentName varchar(50) NOT NULL,		   --This column must have a value
studentAge INT NOT NULL,			       --This column must have a value
studentMarks INT NOT NULL				   --This column must have a value

);


--see the second table created 
SELECT * FROM studentData2;				--This will show the column name only


--copy the values from the table studentData into studentData2
INSERT INTO studentData2 
(rollNumber,studentName,studentAge,studentMarks)
SELECT 
rollNumber,studentName,studentAge,studentMarks
FROM studentData;

--to check the data copy from studentData into studentData2
SELECT * FROM studentData2;
	
SELECT * from sys. tables;						 --to see all the tables inside the database


--Constraints
--Unique, Not null, Default, Primary key, Foreign key

CREATE TABLE Department (
dep_ID INT PRIMARY KEY,
dep_Name VARCHAR(50) NOT NULL
); 
		
INSERT INTO Department VALUES						--to insert date into the Department Table
(1, 'MATH'),
(2, 'IT'),
(3, 'SCIENCE');


SELECT * FROM Department;							--to see date from the Department Table

CREATE TABLE staff_table (							--Create a Staff Table having Foreign associated with Department Table
emp_ID INT PRIMARY KEY,										--PRIMARY KEY constarints
emp_Name VARCHAR (50) NOT NULL,
emp_Age INT NOT NULL,
emp_Dep_ID INT FOREIGN KEY references Department (dep_ID));  --FOREIGN KEY constarints


SELECT * FROM staff_table;									 ----to see date from the Department Table

INSERT INTO staff_table (emp_ID, emp_Name, emp_Age, emp_Dep_ID) VALUES  --Inserting values with Foreign key 
(1,'Ethan', 21, 1),
(2,'Michael', 25, 3),
(3,'John', 23, 1);

SELECT * FROM staff_table;									 ----to see date from the Department Table


INSERT INTO staff_table (emp_ID, emp_Name, emp_Age, emp_Dep_ID) VALUES  --Inserting values with Foreign key 
(4,'Robert', 24, 2),
(5,'Tony', 35, 3),
(6,'Sam', 27, 2);


CREATE TABLE test_Table (
name VARCHAR (50),
phone_Number INT ,
email VARCHAR(50),
DOB DATE NOT NULL,												-- not null constarints
salary INT DEFAULT 2500,										 --default constarints
);


SELECT * FROM test_Table ; 

TRUNCATE TABLE test_Table;  -- Only delete the rows inside the table
DROP TABLE test_Table;			--This will delete the entire table along with all rows associated with it



INSERT INTO test_table (name,phone_Number, email, DOB) VALUES 
('Adam', 123456789, 'Adam@yahoo.com','1996-07-23'),
('Steeve', 045212757, 'Steeve@yahoo.com', '1991-01-19'),
('Roger', 0345227575, 'Roger@yahoo.com', '2001-01-20');

SELECT name from test_table;			--get the name column from the table
SELECT DISTINCT name from test_table;		--get the Unique name column from the table

SELECT * FROM sys. TABLES;
SELECT * FROM studentData;

CREATE TABLE std_record (
std_name VARCHAR(50) NOT NULL,
stde_id INT,
stde_city VARCHAR(50) NOT NULL,
stde_age INT NOT NULL,
stde_marks INT NOT NULL,
PRIMARY KEY (stde_id)


);

INSERT INTO std_record (std_name, stde_id, stde_city, stde_age, stde_marks) VALUES 
('Ali',1,'Karachi', 21, 75),
('Sara',2,'Lahore', 24, 61),
('Kausar',3,'Multan', 23, 90),
('Hadi',4,'Islambad', 26, 85),
('Kareem',5,'Lahore', 21, 68),
('Aleena',6,'Karachi', 20, 81)
;

SELECT * FROM std_record;

SELECT  stde_city FROM std_record;			--list all the cities inside the table

SELECT DISTINCT stde_city FROM std_record;			--list uniques the cities inside the table

SELECT std_name from std_record;					--list all names inside the table

	
SELECT DISTINCT std_name from std_record;			--list uniques the cities inside the table


SELECT * FROM std_record							--list all the data where having name is Ali(not case sensetive)
WHERE std_name='ALI';

SELECT *											--list all the data where marks > 70
FROM std_record	
WHERE stde_marks >= 61;


SELECT std_name, stde_marks						   --list down only std_name & stde_marks columns	
FROM std_record;

SELECT std_name, stde_marks	, stde_city				   --list down only std_name, stde_marks & stde_city columns but stde_city=Karachi	
FROM std_record
WHERE stde_city = 'Karachi';
														--IN operator
SELECT *											   --list down all data where stde_city=Karachi, lahore, multan, quetta, hydrabad	
FROM std_record											--This won't give error if the city is not present inside the table
WHERE stde_city IN ('Karachi', 'LAHORE', 'MULTAN','QUETTA', 'HYDRABAD');


SELECT std_name, stde_marks						--BETWEEN operator
FROM std_record									--List down the data having the marks ranging from 75-to-95
WHERE stde_marks BETWEEN 75 AND 95;


SELECT DISTINCT stde_city
FROM std_record;


SELECT *										--NOT operator
FROM std_record									--List down the data having the marks ranging from 75-to-95
WHERE stde_city NOT IN ('Karachi', 'MULTAN','QUETTA', 'HYDRABAD');


--Operator Types
--Arithmetic Operator	(+, -, *, /, %)
--Logical Operator      (AND, OR , NOT, IN, BETWEEN, LIKE)
--Comparison Operator	(>, >=, <, <= , !=)
--Bitwise Operator		()
		
SELECT *										--list down the data if the final marks will be 100, if we add 10 to original marks
FROM std_record
WHERE stde_marks +10 = 100;

CREATE TABLE dummy (
std_id INT,
stde_name VARCHAR (50)
);

SELECT * FROM dummy;

INSERT INTO dummy (std_id)VALUES (3);
INSERT INTO dummy (stde_name)VALUES ('Ali');

UPDATE dummy								--NULL concept, we use IS NULL or IS NOT NULL for NULL 
SET std_id = 2, stde_name='Sara'
WHERE std_id IS NULL;


--Types of clauses in SQL
--SELECT , FROM , WHERE , GROUP , HAVING , ORDER BY , LIMIT , JOIN , SUBQUERY , UNION , TOP

SELECT TOP 5								--TOP clause fetch the top data from the table, we can use this with ORDER BY
* 
FROM std_record
ORDER BY std_name DESC;

SELECT TOP 2									--Gives the data of Top 5 rows having marks > 76
*
FROM std_record
WHERE stde_marks > 70
ORDER BY stde_marks DESC;

SELECT TOP 3
std_name, stde_marks								--Gives the data of Top 5 rows having marks > 76
FROM std_record
WHERE stde_marks > 70
ORDER BY stde_marks DESC;

SELECT * FROM 
std_record;

SELECT * 
FROM test_table
ORDER BY DOB ASC;

--Agregate=Functions
--Min(), MAX(), SUM(), COUNT(), AVG()


SELECT * 
FROM std_record;

SELECT COUNT(stde_id) AS Total_students
FROM std_record;


SELECT MAX(stde_marks) AS Max_marks
FROM std_record;

SELECT MIN(stde_marks) AS Max_marks
FROM std_record;

SELECT AVG(stde_marks) AS Max_marks
FROM std_record;

--GROUP BY Clause

SELECT stde_city, std_name,COUNT(stde_id)				--gives the total students city wise
FROM std_record
GROUP BY stde_city;

SELECT std_name			--gives the total students city wise
FROM std_record
WHERE stde_city IN (
   SELECT stde_city 
		FROM std_record
);

SELECT
    stde_city,
    STUFF((SELECT ', ' + std_name FROM std_record s2 WHERE s1.stde_city = s2.stde_city ORDER BY std_name FOR XML PATH('')), 1, 2, '') AS Students,
    COUNT(*) AS StudentCount
FROM
    std_record s1
GROUP BY
    stde_city;


SELECT * FROM test_Table;


--Update the column inside the table
UPDATE test_Table
SET name = NULL 
WHERE email = 'inserted email';

--Delete the column inside the table
DELETE FROM mytable
WHERE id='2';


SELECT * FROM mytable

--Add a column in a table
ALTER TABLE mytable
ADD age INT NOT NULL DEFAULT 19;


--Modify a column
ALTER TABLE mytable
ALTER COLUMN age VARCHAR (2);					--The system will not allow us to Modify the column having constraints
--First we have to delete the constraint from the table
--then we can alter the column

ALTER TABLE mytable 
DROP CONSTRAINT DF__mytable__age__17F790F9;		--all the constarint are deleted associated with that column
--now run the query again to modify the column
ALTER TABLE mytable
ALTER COLUMN age VARCHAR (2);					--Modify the datatype of the column from INT to VARCHAR(50)

--view the table again
SELECT * FROM mytable


--Drop a column in a table
ALTER TABLE mytable
DROP COLUMN age;							--The system will not allow us to delete the column having constraints

--First we have to delete the constraint from the table
--then we can delete the column
ALTER TABLE mytable 
DROP CONSTRAINT DF__mytable__age__151B244E;

--rename the column in a table
EXEC sp_rename 'mytable.age','update_age','COLUMN';

ALTER TABLE mytable
ALTER COLUMN test VARCHAR(20);

ALTER TABLE mytable
DROP COLUMN test;	

UPDATE mytable
set test='dummy_value';



--JOINS IN SQL
--INNER JOIN
--LEFT JOIN
--RIGHT JOIN
--FULL JOIN
--LEFT EXCLUSIVE JOIN
--RIGHT EXCLUSIVE JOIN
--FULL EXCLUSIVE JOIN

CREATE TABLE emp1 (
emp_id INT NOT NULL,
emp_name VARCHAR(50)
);

INSERT INTO emp1 (emp_id, emp_name) VALUES 
(1,'John'),
(2,'Robert'),
(3,'Ethan'),
(4,'Tony'),
(6,'Peter'),
(8,'Harry'),
(9,'Steeve'),
(7,'Burce'),
(11,'Baner'),
(15,'Wong');

SELECT * FROM emp1;

CREATE TABLE emp_salary (
emp_id INT NOT NULL,
emp_salary INT NOT NULL
);

INSERT INTO emp_salary (emp_id, emp_salary) VALUES
(15,10000),
(2,65000),
(3,75000),
(4,35000),
(5,85000),
(6,41000),
(7,76000)
;

SELECT * FROM emp1;
SELECT * FROM emp_salary;

--INNER JOIN
SELECT * FROM emp1
INNER JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id;

--LEFT JOIN
SELECT * FROM emp1
LEFT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id;

--RIGHT JOIN
SELECT * FROM emp1
RIGHT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id;

--FULL JOIN
SELECT * FROM emp1
LEFT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id
UNION
SELECT * FROM emp1
RIGHT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id;

--LEFT EXCLUSIVE JOIN
SELECT * FROM emp1
LEFT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id
WHERE emp_salary.emp_id IS NULL;

--RIGHT EXCLUSIVE JOIN
SELECT * FROM emp1
RIGHT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id
WHERE emp1.emp_id IS NULL;

--FULL EXCLUSIVE JOIN
SELECT *
FROM emp1
FULL OUTER JOIN emp_salary ON emp1.emp_id = emp_salary.emp_id
WHERE emp1.emp_id IS NULL OR emp_salary.emp_id IS NULL;

--FULL EXCLUSIVE JOIN
SELECT * FROM emp1
LEFT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id
WHERE emp_salary.emp_id IS NULL
UNION ALL
SELECT * FROM emp1
RIGHT JOIN emp_salary
ON emp1.emp_id=emp_salary.emp_id
WHERE emp1.emp_id IS NULL;


--SELF JOIN
CREATE TABLE self_table(
emp_id INT,
emp_name VARCHAR(50),
manager_id INT)
;

SELECT * FROM self_table;

INSERT INTO self_table (emp_id, emp_name, manager_id) VALUES 
(101, 'Adam',103),
(102,'Bob',104),
(103,'Casey',NULL),
(104,'Donald',103);

UPDATE self_table
SET emp_id = 101 
WHERE emp_name='Adam';

SELECT * 
FROM self_table as a
JOIN self_table as b
ON a.emp_id=b.manager_id;

SELECT a.emp_name , b.emp_name
FROM self_table as a
JOIN self_table as b
ON a.emp_id=b.manager_id;

SELECT a.emp_name as manager_name, b.emp_name
FROM self_table as a
JOIN self_table as b
ON a.emp_id=b.manager_id;
