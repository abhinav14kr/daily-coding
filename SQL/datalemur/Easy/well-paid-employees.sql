'''
Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any employees earning more than their direct managers.
As a HR Analyst, you are asked to identify all employees who earn more than their direct managers. The result should include the employee's ID and name.

employee Example Input:

employee_id	name	salary	department_id	manager_id
1	Emma Thompson	3800	1	6
2	Daniel Rodriguez	2230	1	7
3	Olivia Smith	7000	1	8
4	Noah Johnson	6800	2	9
5	Sophia Martinez	1750	1	11
6	Liam Brown	13000	3	NULL
7	Ava Garcia	12500	3	NULL
8	William Davis	6800	2	NULL

Example Output:
employee_id	employee_name
3	Olivia Smith
'''

WITH FIRST_CTE AS (SELECT 
  mgr.employee_id AS manager_id,
  mgr.name AS manager_name,
  mgr.salary AS manager_salary,
  emp.employee_id AS employee_id,
  emp.name AS employee_name,
  emp.salary AS employee_salary
FROM employee AS mgr
INNER JOIN employee AS emp
  ON mgr.employee_id = emp.manager_id
  WHERE emp.salary > mgr.salary
) 

SELECT employee_id, employee_name 
FROM FIRST_CTE; 
