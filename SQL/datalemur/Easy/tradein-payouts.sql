'''

Apple has a trade-in program where their customers can return the old iPhone device to Apple and Apple gives the customers the trade-in value (known as payout) of the device in cash.
For each store, write a query of the total revenue from the trade-in. Order the result by the descending order.

'''

SELECT store_id, SUM(payout_amount) as payout_total
FROM trade_in_transactions t 
JOIN trade_in_payouts p 
ON t.model_id = p.model_id 
GROUP BY 1 
ORDER BY 2 DESC; 
