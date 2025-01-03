# Write your MySQL query statement below

# NUMBER OF TASKS THAT SUBMITTED DURING THE WEEKEND_CNT
# NUMBER OF TASKS THAT SUBMITTED DURING THE WORKING_CNT

SELECT 
    SUM(CASE WHEN WEEKDAY(SUBMIT_DATE) >= 5 THEN 1 ELSE 0 END) AS WEEKEND_CNT, 
    SUM(CASE WHEN WEEKDAY(SUBMIT_DATE) < 5 THEN 1 ELSE 0 END) AS WORKING_CNT
FROM TASKS