SELECT ee.employee_id, 
       ee.name, 
       count(e.employee_id) as reports_count,
       round(avg(e.age),0) as average_age
FROM Employees e 
JOIN employees ee
ON e.reports_to = ee.employee_id
GROUP BY employee_id
ORDER BY employee_id; 
