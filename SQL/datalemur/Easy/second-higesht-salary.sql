'''
Imagine you aree an HR analyst at a tech company tasked with analyzing employee salaries. Your manager is keen on understanding the pay distribution and asks you to determine the second highest salary among all employees.
Its possible that multiple employees may share the same second highest salary. In case of duplicate, display the salary only once.

'''

SELECT MAX(SALARY) as second_highest_salary
FROM employee
WHERE SALARY < (SELECT MAX(SALARY) FROM employee); 

OR 

WITH FIRST_TABLE AS (
SELECT employee_id, salary
FROM employee
ORDER BY salary 
)
SELECT DISTINCT SALARY as second_highest_salary
FROM FIRST_TABLE 
WHERE SALARY < (SELECT MAX(SALARY) FROM FIRST_TABLE)
ORDER BY second_highest_salary DESC
LIMIT 1; 

