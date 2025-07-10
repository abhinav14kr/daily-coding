'''

As a Data Analyst on Snowflakes Marketing Analytics team, youre analyzing the CRM to determine what percent of marketing touches were of type webinar in April 2022. Round your percentage to the nearest integer.

Did you know? Marketing touches, also known as touch points are the brands (Snowflakes) point of contact with the customers, from start to finish

'''

WITH FIRST_CTE AS (
  SELECT (
          SELECT COUNT(*) FROM marketing_touches WHERE event_type = 'webinar' 
          AND EXTRACT(MONTH FROM event_date) = 4 
          AND EXTRACT(YEAR FROM event_date) = 2022 ) as webinar_type
        , count(*) as total_type 
  FROM marketing_touches 
  WHERE EXTRACT(MONTH FROM event_date) = 4 AND EXTRACT(YEAR FROM event_date) = 2022
  ) 
  
SELECT ROUND(webinar_type::numeric / NULLIF(total_type, 0) * 100, 0) as webinar_pct
FROM FIRST_CTE ; 