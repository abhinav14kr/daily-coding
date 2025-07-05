'''
Amazon is trying to identify their high-end customers. To do so, they first need your help to write a query that obtains the most expensive purchase made by each customer. Order the results by the most expensive purchase first.

'''

SELECT DISTINCT customer_id, MAX(purchase_amount) as  most_expensive_purchase
FROM transactions 
GROUP BY 1
ORDER BY most_expensive_purchase DESC; 