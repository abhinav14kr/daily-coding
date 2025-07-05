'''
IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September). Additionally, it should count the number of employees who did not run any queries during this period.
Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.
Assume that the table below displays all employees in the table:

employees Example Input:
employee_id	full_name	gender
1	Judas Beardon	Male
2	Lainey Franciotti	Female
3	Ashbey Strahan	Male

Example Output:
unique_queries	employee_count
0	191
1	46
2	12
3	1
The output indicates that 191 employees did not run any queries, 46 employees ran exactly 1 unique queries, 12 employees ran 2 unique queries, and so on.

'''


WITH FIRST_CTE AS (
  SELECT e.employee_id, COUNT(DISTINCT q.query_id) AS unique_queries
  FROM employees e
  LEFT JOIN queries q 
  ON e.employee_id = q.employee_id
  AND q.query_starttime >= '2023-07-01' AND q.query_starttime < '2023-10-01'
  GROUP BY e.employee_id
),
SECOND_CTE AS (
  SELECT unique_queries,COUNT(employee_id) AS employee_count
  FROM FIRST_CTE 
  GROUP BY unique_queries
)

SELECT * FROM SECOND_CTE
ORDER BY unique_queries;
