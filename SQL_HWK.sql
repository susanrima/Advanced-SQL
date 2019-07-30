--SQL HOMEWORK | EMPLOYEE DATABASE
--#1 List the following details of each employee: 
--employee number, last name, first name, gender, and salary.


SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--#2 List employees who were hired in 1986.

SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01T00:00:00'
  and hire_date < '1987-01-01T00:00:00'
  
--#3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dm.dept_no, dept.dept_name, dm.emp_no as "Manager Emp No", emp.last_name as "Manager LastName", emp.first_name as "Manager FirstName",
dm.from_date as "Start date of Employment", dm.to_date as "Last date of Employment" 
FROM dept_manager dm
JOIN departments dept
ON dm.dept_no = dept.dept_no
JOIN employees emp
on dm.emp_no = emp.emp_no;


--#4 List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no;

--#5 List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--#6 List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--#7 List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'OR d.dept_name = 'Development';

--#8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY last_name;





