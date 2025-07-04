'''
Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
Definition and note:
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.

events Table:
Column Name	Type
app_id	integer
event_type	string
timestamp	datetime

'''

with first_cte as (
  SELECT app_id, count(event_type) as impression
  FROM events
  WHERE event_type = 'impression'
  AND EXTRACT(YEAR FROM timestamp) = 2022
  GROUP BY 1
),

second_cte as (
  SELECT app_id, count(event_type) as click
  FROM events
  WHERE event_type = 'click'
  AND EXTRACT(YEAR FROM timestamp) = 2022
  GROUP BY 1
)

SELECT f.app_id as app_id, ROUND(100 * s.click/f.impression,2) as ctr
FROM first_cte f 
JOIN second_cte s 
ON f.app_id =s.app_id;