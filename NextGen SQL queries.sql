--- All the tables---

select * from attendance
select * from department
select * from employee
select * from performance
select * from salary
select * from turnover


------EMPLOYEE------

--1 Who are the top 5 highest serving employees?
SELECT  e.employee_id, e.first_name, e.last_name, e.job_title, e.hire_date, t.turnover_date, AGE(CURRENT_DATE, e.hire_date) AS years_of_service
FROM employee e
LEFT JOIN turnover t ON e.employee_id = t.employee_id
WHERE t.employee_id IS NULL   -- excludes employees who left
ORDER BY e.hire_date ASC
LIMIT 5;


--  SELECT employee_id, first_name, last_name, job_title, hire_date, AGE(CURRENT_DATE, hire_date) AS years_of_service
FROM employee
ORDER BY hire_date ASC
LIMIT 5;



-- Q2 What is the turnover rate for each department?

SELECT 
    d.department_name, 
    ROUND(
        (COUNT(t.turnover_id)::decimal / NULLIF(COUNT(e.employee_id), 0)) * 100,
        2
    ) AS turnover_rate_percent
FROM department d
LEFT JOIN employee e ON d.department_id = e.department_id
LEFT JOIN turnover t ON e.employee_id = t.employee_id
GROUP BY d.department_name
ORDER BY turnover_rate_percent DESC;


--  SELECT d.department_name,
    EXTRACT(YEAR FROM t.turnover_date) AS year,
    COUNT(t.turnover_id) AS employees_left,
    COUNT(e.employee_id) AS total_employees,
    (COUNT(t.turnover_id)::decimal / NULLIF(COUNT(e.employee_id),0)) * 100 AS turnover_rate_percent
FROM department d
LEFT JOIN employee e ON d.department_id = e.department_id
LEFT JOIN turnover t ON e.employee_id = t.employee_id
GROUP BY d.department_name, EXTRACT(YEAR FROM t.turnover_date)
ORDER BY year, turnover_rate_percent DESC;



---Q3 Which employees are at risk of leaving based on their performance?

SELECT e.employee_id, e.first_name, e.last_name, p.performance_score, p.performance_date, d.department_name
FROM employee e
JOIN performance p ON e.employee_id = p.employee_id
JOIN department d ON e.department_id = d.department_id
LEFT JOIN turnover t ON e.employee_id = t.employee_id
WHERE t.turnover_id IS NOT NULL 
  AND p.performance_score < 4  -- threshold for underperformance 
ORDER BY p.performance_score ASC
LIMIT 5;



--  SELECT e.employee_id, e.first_name, e.last_name,
    ROUND(AVG(p.performance_score), 2) AS avg_performance,
    CASE 
        WHEN AVG(p.performance_score) < 60 THEN 'High Risk'
        WHEN AVG(p.performance_score) BETWEEN 60 AND 75 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM employee e
JOIN performance p ON e.employee_id = p.employee_id
LEFT JOIN turnover t ON e.employee_id = t.employee_id
WHERE t.turnover_id IS NULL   -- only active employees
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY avg_performance DESC
LIMIT 5;



--  SELECT e.employee_id, e.first_name, e.last_name, p.performance_score, p.performance_date, d.department_name
FROM employee e
JOIN performance p ON e.employee_id = p.employee_id
JOIN department d ON e.department_id = d.department_id
LEFT JOIN turnover t ON e.employee_id = t.employee_id
WHERE t.turnover_id IS NULL   -- still active
  AND p.performance_score < 60 -- threshold based on Step 1
ORDER BY p.performance_score ASC;

--  SELECT e.employee_id, e.first_name, e.last_name,
    AVG(p.performance_score) AS avg_performance,
    CASE 
        WHEN AVG(p.performance_score) < 60 THEN 'High Risk'
        WHEN AVG(p.performance_score) BETWEEN 60 AND 75 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM employee e
JOIN performance p ON e.employee_id = p.employee_id
LEFT JOIN turnover t ON e.employee_id = t.employee_id
WHERE t.turnover_id IS NULL   -- only active employees
GROUP BY e.employee_id, e.first_name, e.last_name;



--4 What are the main reasons employees are leaving the company?

SELECT reason_for_leaving,
    COUNT(*) AS total_leavers
FROM turnover
GROUP BY reason_for_leaving
ORDER BY total_leavers DESC;


--  SELECT d.department_name, t.reason_for_leaving,
    COUNT(*) AS total_leavers
FROM turnover t
JOIN employee e ON t.employee_id = e.employee_id
JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name, t.reason_for_leaving
ORDER BY d.department_name, total_leavers DESC;


--  SELECT d.department_name,
    COUNT(t.turnover_id) AS total_leavers
FROM turnover t
JOIN employee e ON t.employee_id = e.employee_id
JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_leavers DESC;


--  SELECT reason_for_leaving, d.department_name,
    COUNT(*) AS total_leavers
FROM turnover t
JOIN department d ON t.department_id = d.department_id
GROUP BY d.department_name, t.reason_for_leaving
ORDER BY total_leavers DESC;


--  SELECT 
    d.department_name,
    t.reason_for_leaving,
    COUNT(*) AS total_leavers
FROM turnover t
JOIN department d ON t.department_id = d.department_id
GROUP BY d.department_name, t.reason_for_leaving
ORDER BY d.department_name, total_leavers DESC;




------PERFORMANCE------

--Q1 How many employees has left the company?

Select Count(turnover_id) As "Turnover"
From turnover
WHERE turnover_date IS NOT NULL;


--  SELECT COUNT(*) AS total_employees_left
FROM turnover;



--Q2 How many employees have a performance score of 5.0 / below 3.5?

SELECT 
    COUNT(DISTINCT CASE WHEN performance_score = 5.0 THEN employee_id END) AS perfect_score_employees,
    COUNT(DISTINCT CASE WHEN performance_score < 3.5 THEN employee_id END) AS low_score_employees
FROM performance;


--SELECT
    COUNT(*) FILTER (WHERE performance_score = 5.0) AS employees_with_5_score,
    COUNT(*) FILTER (WHERE performance_score < 3.5) AS employees_below_3_5
FROM (
    SELECT 
        employee_id, performance_score
    FROM performance
    ORDER BY employee_id, performance_date DESC
) AS Review;


--  SELECT 
    SUM(CASE WHEN performance_score = 5.0 THEN 1 ELSE 0 END) AS perfect_score_employees,
    SUM(CASE WHEN performance_score < 3.5 THEN 1 ELSE 0 END) AS low_score_employees
FROM performance;

SELECT 
    COUNT(DISTINCT CASE WHEN performance_score = 5.0 THEN employee_id END) AS perfect_score_employees,
    COUNT(DISTINCT CASE WHEN performance_score < 3.5 THEN employee_id END) AS low_score_employees
FROM performance;



--Q3 Which department has the most employees with a performance of 5.0 / below 3.5?

SELECT d.department_name,
    COUNT(CASE WHEN p.performance_score = 5.0 THEN 1 END) AS score_5_0_count,
    COUNT(CASE WHEN p.performance_score < 3.5 THEN 1 END) AS score_below_3_5_count
FROM public.performance p
JOIN public.department d ON p.department_id = d.department_id
GROUP BY d.department_name
ORDER BY score_5_0_count DESC, score_below_3_5_count DESC
limit 1;


--  SELECT d.department_name,
    SUM(CASE WHEN p.performance_score = 5.0 THEN 1 ELSE 0 END) AS perfect_score_employees,
    SUM(CASE WHEN p.performance_score < 3.5 THEN 1 ELSE 0 END) AS low_score_employees
FROM performance p
JOIN department d ON p.department_id = d.department_id
GROUP BY d.department_name
ORDER BY low_score_employees DESC, perfect_score_employees DESC;



--Q4 What is the average performance score by department?

SELECT 
    d.department_name,
    ROUND(AVG(p.performance_score), 2) AS avg_performance_score
FROM performance p
JOIN department d ON p.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_performance_score DESC;




------SALARY------

--Q1  What is the total salary expense for the company?

--SELECT SUM(salary_amount) AS total_salary_expense
FROM salary;

SELECT TO_CHAR(SUM(salary_amount), 'FM$999,999,999,999') AS "Total Salary Expense"
FROM salary;



---Q2 What is the average salary by job title?

SELECT e.job_title, TO_CHAR(ROUND(AVG(s.salary_amount), 2), 'FM$999,999,999.00') AS average_salary
FROM employee e
JOIN salary s ON s.employee_id = e.employee_id
GROUP BY e.job_title
ORDER BY AVG(s.salary_amount) DESC;


--  SELECT e.job_title,
    ROUND(AVG(s.salary_amount), 2) AS avg_salary
FROM employee e
JOIN salary s ON e.employee_id = s.employee_id
GROUP BY e.job_title
ORDER BY avg_salary DESC;



---Q3 How many employees earn above 80,000?

SELECT COUNT(*) AS employees_above_80k
FROM salary
WHERE salary_amount > 80000;



---Q4 How does performance correlate with salary across departments?

SELECT 
    d.department_name,
    TO_CHAR(ROUND(AVG(s.salary_amount), 2), 'FM$999,999,999.00') AS avg_salary,
    ROUND(AVG(p.performance_score), 2) AS avg_performance
FROM employee e
JOIN salary s ON e.employee_id = s.employee_id
JOIN performance p ON e.employee_id = p.employee_id
JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;










































































































