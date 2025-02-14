# Write your MySQL query statement below

WITH first_cte as 
(SELECT managerId, count(id) as counts
from Employee
WHERE managerId <> id AND managerId IS NOT NULL
GROUP BY 1
HAVING counts >= 5
)

SELECT e.name 
FROM first_cte f
INNER JOIN Employee e
ON f.managerId = e.Id; 