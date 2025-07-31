'''
1070. Product Sales Analysis III
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row records a sale of a product in a given year.
A product may have multiple sales entries in the same year.
Note that the per-unit price.

Write a solution to find all sales that occurred in the first year each product was sold.

For each product_id, identify the earliest year it appears in the Sales table.
Return all sales entries for that product in that year.
Return a table with the following columns: product_id, first_year, quantity, and price.
Return the result in any order.

'''

WITH FIRST_CTE AS(
    SELECT 
    product_id,
    year as first_year, 
    quantity, 
    price
FROM Sales
GROUP BY 1,3,4
), 

SECOND_CTE AS (
    SELECT product_id, MIN(year) as first_year
    FROM Sales
    GROUP BY 1 
)

SELECT f.product_id, f.first_year, f.quantity, f.price
FROM FIRST_CTE f
JOIN SECOND_CTE s 
ON f.product_id = s.product_id AND s.first_year = f.first_year; 