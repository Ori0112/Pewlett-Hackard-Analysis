--Challenge
-- Part 1: Number of Retiring Employees by Title

-- Create retirement titles table
select e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into retirement_titles
from employees as e
	inner join titles as ti
		on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     order by emp_no asc;
-- Delete Duplicates
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;
--Count retirement_age employees by most recent title
select count(ut.emp_no), ut.title
into retiring_titles
from unique_titles as ut
group by title
order by count(title) desc;
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentor_eligibilty
FROM employees as e
 INNER JOIN dept_emp as de
 	ON(e.emp_no=de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no=ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
