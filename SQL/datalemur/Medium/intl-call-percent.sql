A phone call is considered an international call when the person calling is in a different country than the person receiving the call.

What percentage of phone calls are international? Round the result to 1 decimal.

Assumption:

The caller_id in phone_info table refers to both the caller and receiver.
Example Input:
caller_id	receiver_id	call_time
1	2	2022-07-04 10:13:49
1	5	2022-08-21 23:54:56
5	1	2022-05-13 17:24:06
5	6	2022-03-18 12:11:49

phone_info Example Input:
caller_id	country_id	network	phone_number
1	US	Verizon	+1-212-897-1964
2	US	Verizon	+1-703-346-9529
3	US	Verizon	+1-650-828-4774
4	US	Verizon	+1-415-224-6663
5	IN	Vodafone	+91 7503-907302
6	IN	Vodafone	+91 2287-664895
Example Output:
international_calls_pct
50.0


SOLUTION: 


WITH FIRST_CTE AS (
SELECT p.caller_id, p.receiver_id, i.country_id as country_id 
FROM phone_calls p 
LEFT JOIN phone_info i 
ON p.caller_id = i.caller_id
), 
SECOND_CTE AS (
SELECT p.caller_id, p.receiver_id, i.country_id as country_id 
FROM phone_calls p 
LEFT JOIN phone_info i 
ON p.receiver_id = i.caller_id
)
, 
THIRD_CTE AS (
SELECT 
CASE 
  WHEN F.country_id != S.country_id then 1 ELSE 0 
  END AS INTERNATIONAL_CALLS 
FROM FIRST_CTE F 
JOIN SECOND_CTE S 
ON F.caller_id = S.caller_id 
AND F.receiver_id = S.receiver_id
), 
FOURTH_CTE AS(
SELECT 
COUNT(CASE WHEN international_calls = 1 THEN 1 ELSE NULL END) AS international_calls_count,
    COUNT(*) AS total_calls
FROM THIRD_CTE
)

SELECT ROUND(100.00 * international_calls_count/total_calls,1) as international_calls_pct
FROM FOURTH_CTE; 