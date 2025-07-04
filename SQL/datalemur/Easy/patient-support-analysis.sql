'''
UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders (or, members) to call an advocate and receive support for their health care needs – whether that's claims and benefits support, drug coverage, pre- and post-authorisation, medical records, emergency assistance, or member portal services.
Write a query to find how many UHG policy holders made three, or more calls, assuming each call is identified by the case_id column.
If you like this question, try out Patient Support Analysis (Part 2)!

callers Table:
Column Name	Type
policy_holder_id	integer
case_id	varchar
call_category	varchar
call_date	timestamp
call_duration_secs	integer
'''


WITH FIRST_CTE AS (
  SELECT COUNT(case_id) as counts, policy_holder_id
  FROM callers 
  GROUP BY 2
)


SELECT COUNT(counts) as policy_holder_count
FROM FIRST_CTE
WHERE counts >=3; 
