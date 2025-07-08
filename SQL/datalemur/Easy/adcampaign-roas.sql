'''
Google marketing managers are analyzing the performance of various advertising accounts over the last month. They need your help to gather the relevant data.
Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns. Round your answer to 2 decimal places, and order your output by the advertiser_id.
Hint: ROAS = Ad Revenue / Ad Spend

'''

WITH FIRST_CTE AS (
  SELECT 
    advertiser_id, 
    SUM(revenue) as total_revenue, 
    SUM(spend) as total_spend
FROM ad_campaigns 
GROUP BY 1
)

SELECT 
  advertiser_id, 
  ROUND(total_revenue::NUMERIC / NULLIF(total_spend, 0), 2) AS roas
FROM FIRST_CTE 
ORDER BY 1
; 