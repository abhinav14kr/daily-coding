'''
Assume that you are given the table below containing information on various orders made by eBay customers. Write a query to obtain the user IDs and number of products purchased by the top 3 customers; these customers must have spent at least $1,000 in total.

Output the user id and number of products in descending order. To break ties (i.e., if 2 customers both bought 10 products), the user who spent more should take precedence.

'''

WITH FIRST_CTE AS (
  SELECT COUNT(product_id) as counts, SUM(spend) as total_spend, user_id
  FROM user_transactions 
  GROUP BY 3
  )
  
SELECT user_id, counts as product_num
FROM FIRST_CTE 
WHERE total_spend > 1000 
ORDER BY product_num DESC, total_spend DESC 
LIMIT 3
; 