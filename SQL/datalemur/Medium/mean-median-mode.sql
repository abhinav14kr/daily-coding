'''

You are given a list of numbers representing the number of emails in the inbox of Microsoft Outlook users. Before the Product Management team can start developing features related to bulk-deleting email or achieving inbox zero, they simply want to find the mean, median, and mode for the emails.
Display the output of mean, median and mode (in this order), with the mean rounded to the nearest integer. It should be assumed that there are no ties for the mode.

'''

WITH FIRST_CTE AS (
  SELECT ROUND(AVG(email_count),0) as mean
  FROM inbox_stats
), 

SECOND_CTE AS (
 SELECT email_count as mode
  FROM (
    SELECT email_count, COUNT(*) as counts
    FROM inbox_stats
    GROUP BY email_count
) AS subquery_result
ORDER BY counts DESC
LIMIT 1
), 

THIRD_CTE AS (
  SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY email_count) AS median
  FROM
  inbox_stats
)


SELECT f.mean, s.mode, t.median
FROM FIRST_CTE f
CROSS JOIN SECOND_CTE s 
CROSS JOIN THIRD_CTE t; 


-- another efficient way to run the query to avoid three separate reading of the entire table is below


WITH stats AS (
  SELECT
    email_count,
    COUNT(*) OVER (PARTITION BY email_count) AS freq,
    AVG(email_count) OVER () AS avg_email,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY email_count) OVER () AS median
  FROM inbox_stats
),
mode_cte AS (
  SELECT email_count
  FROM stats
  ORDER BY freq DESC
  LIMIT 1
)
SELECT
  ROUND(AVG(avg_email)::numeric, 0) AS mean,
  mode_cte.email_count AS mode,
  MAX(median) AS median
FROM mode_cte, stats;
