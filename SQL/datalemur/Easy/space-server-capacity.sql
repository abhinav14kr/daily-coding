'''
Microsoft Azures capacity planning team wants to understand how much data its customers are using, and how much spare capacity is left in each of its data centers. You’re given three tables: customers, data centers, and forecasted_demand.
Write a query to find each data centre’s total unused server capacity. Output the data center id in ascending order and the total spare capacity.

Definitions:

monthly_capacity is the total monthly server capacity for each centers.
monthly_demand is the server demand for each customer.

'''

WITH FIRST_CTE AS (
  SELECT datacenter_id, SUM(monthly_demand) as total_consumption 
  FROM forecasted_demand 
  GROUP BY 1
), 
  
SECOND_CTE AS (
  SELECT d.datacenter_id, d.monthly_capacity - f.total_consumption as spare_capacity
  FROM FIRST_CTE f 
  JOIN datacenters d 
  ON f.datacenter_id = d.datacenter_id
)

SELECT * FROM SECOND_CTE
ORDER BY datacenter_id ASC, spare_capacity DESC; 
