'''
1164. Product price at a given date
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date. 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
Return the result table in any order.

'''

SOLUTION: 

-- Write your PostgreSQL query statement below

WITH FIRST_CTE AS (
    SELECT *, RANK() OVER(PARTITION BY PRODUCT_ID ORDER BY CHANGE_DATE DESC) AS ranked
    FROM PRODUCTS 
    WHERE CHANGE_DATE <= '2019-08-16'
)

SELECT DISTINCT product_id, new_price as price 
FROM FIRST_CTE 
WHERE ranked = 1
UNION 
SELECT product_id, 10 as price
FROM Products 
WHERE product_id NOT IN (SELECT product_id FROM FIRST_CTE); 
