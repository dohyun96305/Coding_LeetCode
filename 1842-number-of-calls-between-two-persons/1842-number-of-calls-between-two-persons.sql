# Write your MySQL query statement below

# NUMBER OF CALLS AND THE TOTAL CALL DURATION BETWEEN EACH PAIR OF DISTINCT PERSIONS

SELECT LEAST(FROM_ID, TO_ID) AS PERSON1, GREATEST(FROM_ID, TO_ID) AS PERSON2, COUNT(*) AS CALL_COUNT, SUM(DURATION) AS TOTAL_DURATION
FROM CALLS
GROUP BY PERSON1, PERSON2