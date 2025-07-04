'''
Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.

Notes:

Calculate the following percentages:
time spent sending / (Time spent sending + Time spent opening)
Time spent opening / (Time spent sending + Time spent opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.
Effective April 15th, 2023, the solution has been updated and optimised.

activities Example Input
activity_id	user_id	activity_type	time_spent	activity_date
7274	123	open	4.50	06/22/2022 12:00:00
2425	123	send	3.50	06/22/2022 12:00:00
1413	456	send	5.67	06/23/2022 12:00:00
1414	789	chat	11.00	06/25/2022 12:00:00
2536	456	open	3.00	06/25/2022 12:00:00

age_breakdown Example Input
user_id	age_bucket
123	31-35
456	26-30
789	21-25

Example Output
age_bucket	send_perc	open_perc
26-30	65.40	34.60
31-35	43.75	56.25
'''
 

with first_cte as (
  SELECT user_id, SUM(time_spent) as time_spent_send
  FROM activities 
  WHERE activity_type = 'send'
  GROUP BY 1
), 
second_cte as (
  SELECT user_id, SUM(time_spent) as time_spent_open
  FROM activities 
  WHERE activity_type = 'open'
  GROUP BY 1
)

SELECT a.age_bucket as age_bucket,
  ROUND((100.00 * (f.time_spent_send / (f.time_spent_send + s.time_spent_open))), 2) AS send_perc,
  ROUND((100.00 * (s.time_spent_open / (f.time_spent_send + s.time_spent_open))), 2) AS open_perc
  FROM age_breakdown a
  JOIN first_cte f ON f.user_id = a.user_id
  JOIN second_cte s ON s.user_id = f.user_id 
  GROUP BY 1,2,3
;

