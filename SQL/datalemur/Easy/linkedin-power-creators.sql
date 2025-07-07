'''
The LinkedIn Creator team is seeking out individuals who have a strong influence on the platform, utilizing their personal profiles as a company or influencer page. To identify such power creators, we can compare the number of followers on their LinkedIn page with the number of followers on the company they work for. If a persons LinkedIn page has more followers than their company, we consider them to be a power creator.
Write a query to retrieve the profile IDs of these LinkedIn power creators ordered in ascending order based on their IDs.

Assumptions:

Each individual in the database has a LinkedIn profile associated with a single company.
The personal_profiles and company_pages tables are connected via the employer_id and company_id columns, respectively.

'''

WITH FIRST_CTE AS (
  SELECT profile_id, employer_id, followers as person_followers 
  FROM personal_profiles 
), 

SECOND_CTE AS (
  SELECT company_id, followers as company_followers
  FROM company_pages 
)

SELECT f.profile_id as profile_id
FROM FIRST_CTE f 
JOIN SECOND_CTE s 
ON f.employer_id = s.company_id
WHERE f.person_followers > s.company_followers
ORDER BY profile_id; 