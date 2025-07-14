'''

CVS Health is trying to better understand its pharmacy sales, and how well different drugs are selling.
Write a query to find the top 2 drugs sold, in terms of units sold, for each manufacturer. List your results in alphabetical order by manufacturer.

'''

WITH FIRST_CTE AS (
  SELECT 
    manufacturer, 
    drug,
    ROW_NUMBER () OVER(PARTITION BY manufacturer ORDER BY units_sold DESC) as ranked 
  FROM pharmacy_sales
  )

SELECT 
  manufacturer, 
  drug
FROM FIRST_CTE
WHERE ranked <= 2 
ORDER BY 1; 