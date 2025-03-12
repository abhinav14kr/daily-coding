New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account. A senior analyst is interested to know the activation rate of specified users in the emails table. Write a query to find the activation rate. Round the percentage to 2 decimal places.

Assumptions:

The analyst is interested in the activation rate of specific users in the emails table, which may not include all users that could potentially be found in the texts table.
For example, user 123 in the emails table may not be in the texts table and vice versa.
Effective April 4th 2023, we added an assumption to the question to provide additional clarity.


email_id	user_id	signup_date
125	7771	06/14/2022 00:00:00
236	6950	07/01/2022 00:00:00
433	1052	07/09/2022 00:00:00

texts Table:
6878	125	Confirmed
6920	236	Not Confirmed
6994	236	Confirmed

'Confirmed' in signup_action means the user has activated their account and successfully completed the signup process.

SOLUTION: 


WITH FIRST_CTE AS (
  SELECT count(user_id) as total_user_counts
  FROM emails
  ), 

SECOND_CTE AS (
  SELECT count(DISTINCT e.user_id) as confirmed_user_counts 
  FROM emails e 
  JOIN texts t 
  ON e.email_id = t.email_id
  WHERE t.signup_action = 'Confirmed'
  )
  
SELECT ROUND((s.confirmed_user_counts/f.total_user_counts::DECIMAL),2) as confirm_rate
FROM FIRST_CTE f, SECOND_CTE s; 
