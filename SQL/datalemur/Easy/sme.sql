'''
You are tasked with identifying Subject Matter Experts (SMEs) at Accenture based on their work experience in specific domains. An employee qualifies as an SME if they meet either of the following criteria:

They have 8 or more years of work experience in a single domain.
They have 12 or more years of work experience across two different domains.
Write a query to return the employee IDs of all the subject matter experts at Accenture.

Assumption:
An employee can only be considered an SME if they meet the experience requirements in either one or two domains. Cases where an employee has experience in more than two domains can be disregarded.

'''

WITH FIRST_CTE AS (
  SELECT employee_id
  FROM employee_expertise 
  WHERE years_of_experience >= 8 
  GROUP BY employee_id
  HAVING COUNT(domain) = 1
), 

SECOND_CTE AS (
  SELECT employee_id
  FROM employee_expertise 
  GROUP BY employee_id
  HAVING SUM(years_of_experience) >= 12
     AND COUNT(domain) = 2
)

SELECT employee_id 
FROM FIRST_CTE
UNION
SELECT employee_id 
FROM SECOND_CTE
; 