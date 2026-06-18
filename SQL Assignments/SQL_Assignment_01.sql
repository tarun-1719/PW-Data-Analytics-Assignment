-- 1 – Introduction to SQL and Basic Queries
-- Objective: Understand the basic concepts of SQL and perform basic queries.

-- Task 1: Setup a Database
-- Create a database named company_db.

Create database company_db;

-- Task 2: Create a Table

use company_db;

-- Create a table employees with the following columns:
-- id (INTEGER, Primary Key)
-- first_name (VARCHAR)
-- last_name (VARCHAR)
-- department (VARCHAR)
-- salary (INTEGER)

Create table employeen (
employee_id int,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
salary int);
select * from employeen;

-- Task 3: Insert Data
-- Insert at least 5 records into the employees table.

insert into employeen (employee_id, first_name, last_name, department, salary)
values
(1, "tarun", "singh", "Data_analyst", 50000),
(2, "Varun", "singh", "Data engneer", 45000),
(3, "arun", "singh", "manager", 40000),
(4, "khushi", "singh", "finance", 55000),
(5, "riya", "singh", "hr", 35000);

-- Task 4: Basic SELECT Query
select * from employeen;

-- Filtering Data Using WHERE Clause

-- Write a query to retrieve all employees from the data analyst  department.

select * from employeen
where department = "Data_analyst";

-- Write a query to find employees with a salary greater than 50000.

select * from employeen
where salary >= 50000;


-- Retrieve all employees from the Sales department and whose salary is greater than 50000.

select * from employeen
where department = "Data engneer" and salary > 50000;


-- Retrieve a list of unique departments from the employees table.

select distinct * from employeen;

-- 3 – Modifying Data (INSERT, UPDATE, DELETE)
-- Insert 3 more employees into the employees table using a single INSERT statement.

INSERT INTO employeen (employee_id, first_name, last_name, department, salary)
VALUES
(6, 'Aman', 'Verma', 'HR', 30000),
(7, 'Sonal', 'Gupta', 'Finance', 48000),
(8, 'Ravi', 'Kumar', 'Data Analyst', 52000);

-- Update the salary of the employee with id = 2 (Jane Smith) to 60000.

set sql_safe_updates = 0;

update employeen set salary = 60000
where employee_id = 2;

-- Delete the employee with id = 1 (John Doe).

delete from employeen
where employee_id = 8;

select * from employeen;

-- 4 – Using Constraints (NOT NULL, UNIQUE, DEFAULT,
-- CHECK)
-- Create a new table employees_v2 with NOT NULL, UNIQUE, and CHECK constraints.

CREATE TABLE employees_v2 (
    employee_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    
    UNIQUE (first_name, last_name),  -- no duplicate full names
    
    CHECK (salary > 0),              -- salary must be positive
    CHECK (department IN ('HR', 'Finance', 'IT', 'Sales', 'Manager', 'Data Analyst', 'Data Engineer'))
);

-- Try inserting data into employees_v2, including a duplicate email to observe the UNIQUE constraint
-- violation.

INSERT INTO employees_v2 (first_name, last_name, department, salary)
VALUES ('Tarun', 'Singh', 'Data Analyst', 50000);

SELECT first_name, last_name, COUNT(*) AS count
FROM employees_v2
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;
