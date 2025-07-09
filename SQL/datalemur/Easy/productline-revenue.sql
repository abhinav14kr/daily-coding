'''

As a business analyst on the revenue forecasting team at NVIDIA, you are given a table of NVIDIA transactions in 2021.
Write a query to summarize the total sales revenue for each product line. The product line with the highest revenue should be at the top of the results.

Assumption:
There will be at least one sale of each product line.

'''

SELECT p.product_line, SUM(t.amount) as total_revenue 
FROM product_info p 
JOIN transactions t 
ON p.product_id = t.product_id
GROUP BY 1
ORDER BY 2 DESC; 
