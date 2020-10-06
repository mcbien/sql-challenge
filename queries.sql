--Michael Bien sql-challenge
--Queries

--Once you have a complete database, do the following:

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", employees.sex as "Sex", salaries.salary as "Salary"
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employees
WHERE EXTRACT(year from hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.															
SELECT dept_manager.dept_no as "Department Number", departments.dept_name as "Department Name", dept_manager.emp_no as "Manager Employee Number", employees.last_name as "Manager Last Name", employees.first_name as "Manager Fist Name"
FROM dept_manager, departments, employees
WHERE (dept_manager.dept_no = departments.dept_no AND dept_manager.emp_no = employees.emp_no);

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name as "Department Name"
FROM employees, departments, dept_emp
WHERE(employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no);

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name as "First Name", employees.last_name as "Last Name", employees.sex as "Sex"
FROM employees
WHERE(employees.first_name = 'Hercules' AND employees.last_name like 'B%');

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name as "Department Name"
FROM employees, dept_emp, departments
WHERE(departments.dept_name = 'Sales' AND employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no);

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.last_name as "Last Name", departments.dept_name as "Department Name"
FROM employees, dept_emp, departments
WHERE (employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no AND (departments.dept_name = 'Sales' OR departments.dept_name = 'Development'));

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
