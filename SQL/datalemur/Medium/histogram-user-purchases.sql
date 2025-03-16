This is the same question as problem #13 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, write a query that retrieve the users along with the number of products they bought.

Output the user's most recent transaction date, user ID, and the number of products, sorted in chronological order by the transaction date.

user_transactions Example Input:
product_id	user_id	spend	transaction_date
3673	123	68.90	07/08/2022 12:00:00
9623	123	274.10	07/08/2022 12:00:00
1467	115	19.90	07/08/2022 12:00:00
2513	159	25.00	07/08/2022 12:00:00
1452	159	74.50	07/10/2022 12:00:00
Example Output:
transaction_date	user_id	purchase_count
07/08/2022 12:00:00	115	1
07/08/2022 12:00:000	123	2
07/10/2022 12:00:00	159	1
The dataset you are querying against may have different input & output - this is just an example!


SOLUTION: 


WITH latest_transactions AS (
  SELECT user_id, 
         MAX(transaction_date) AS max_transaction_date
  FROM user_transactions
  GROUP BY user_id
)

SELECT u.transaction_date, 
       u.user_id, 
       COUNT(u.product_id) AS purchase_count
FROM user_transactions u
JOIN latest_transactions lt
ON u.user_id = lt.user_id AND u.transaction_date = lt.max_transaction_date
GROUP BY u.transaction_date, u.user_id
ORDER BY u.transaction_date;