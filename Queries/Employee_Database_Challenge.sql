-- Creating the retirement_titles table
SELECT emp.emp_no, emp.first_name, emp.last_name, ti.title, ti.from_date, ti.to_date

INTO retirement_titles
FROM employees as emp
LEFT JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ti.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title

INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

-- Creating the retiring_titles table
SELECT COUNT(title),title

INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;