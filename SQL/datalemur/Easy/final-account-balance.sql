'''
Given a table containing information about bank deposits and withdrawals made using Paypal, write a query to retrieve the final account balance for each account, taking into account all the transactions recorded in the table with the assumption that there are no missing transactions.
Transactions Table:

Example Input:
transaction_id	account_id	amount	transaction_type
123	101	10.00	Deposit
124	101	20.00	Deposit
125	101	5.00	Withdrawal
126	201	20.00	Deposit
128	201	10.00	Withdrawal

Example Output:
account_id	final_balance
101	25.00
201	10.00

Using account ID 101 as an example, $30.00 was deposited into this account, while $5.00 was withdrawn. Therefore, the final account balance can be calculated as the difference between the total deposits and withdrawals which is $30.00 - $5.00, resulting in a final balance of $25.00.
The dataset you are querying against may have different input & output - this is just an example!

'''

WITH deposit_table AS (
  SELECT *, SUM(amount) OVER (PARTITION BY account_id) as total_deposit
  FROM transactions
  WHERE transaction_type = 'Deposit'
), 

withdrawal_table as (
  SELECT *, SUM(amount) OVER (PARTITION BY account_id) as total_withdrawal
  FROM transactions
  WHERE transaction_type = 'Withdrawal'
), 

final_balance as (
  SELECT d.account_id as account_id, d.total_deposit as total_deposit, w.total_withdrawal as total_withdrawal
  FROM deposit_table D 
  JOIN withdrawal_table W 
  ON d.account_id = w.account_id
)

SELECT DISTINCT account_id, total_deposit - total_withdrawal as final_balance
FROM final_balance
;