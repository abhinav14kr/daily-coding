# Write your MySQL query statement below
WITH FIRST_TABLE AS (
    SELECT id, recordDate, temperature,
    LAG(temperature, 1, 0) OVER (ORDER BY recordDate) as prev_day_temperature,
    LAG(recordDate, 1, 0) OVER (ORDER BY recordDate) as prev_record_day
    FROM Weather
)

SELECT id 
FROM FIRST_TABLE 
WHERE temperature > prev_day_temperature
AND  recordDate = DATE_ADD(prev_record_day, INTERVAL 1 DAY);
