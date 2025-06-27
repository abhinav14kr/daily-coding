183. Table: Customers
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+

Table: Orders
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+

Write a solution to find all customers who never order anything. Return the result table in any order.
The result format is in the following example.

 # SOLUTION:

import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    result_df = pd.merge(
    customers,
    orders,
    how='left',
    left_on='id',
    right_on='customerId'
    )

    result_df = result_df[result_df['customerId'].isnull()][['name']].rename(columns={'name':'customers'})
    
    return result_df
    
