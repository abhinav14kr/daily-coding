'''
Assume you are given the table below containing information on user reviews. Write a query to obtain the number and percentage of businesses that are top rated. A top-rated busines is defined as one whose reviews contain only 4 or 5 stars.
Output the number of businesses and percentage of top rated businesses rounded to the nearest integer.
Assumption:
Each business has only one review (which is the business average rating).

'''

SELECT 
  (SELECT COUNT(business_id) as business_count FROM reviews WHERE review_stars >=4 ),
  CAST ((COUNT(DISTINCT CASE WHEN review_stars >= 4 THEN business_id END) * 1.0 
  / COUNT(DISTINCT business_id) * 100) as INT) AS top_rated_pct
FROM reviews;