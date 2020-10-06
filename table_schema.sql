--Table Schema

--Drop talbes
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE departments;
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE titles;

--Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

--Create titles table
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL
);

--Create employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL REFERENCES titles(title_id),
	birthdate DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

--Create salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	salary INT NOT NULL
);

--Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) REFERENCES departments(dept_no),
	emp_no INT NOT NULL PRIMARY KEY REFERENCES employees(emp_no)
);

--Create dept_employee table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT *
FROM dept_emp