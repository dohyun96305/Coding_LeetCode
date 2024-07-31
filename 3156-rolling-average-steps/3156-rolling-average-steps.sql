# Write your MySQL query statement below
WITH TEMP AS (
    SELECT A.USER_ID, B.STEPS_DATE AS GROUP1, A.STEPS_COUNT AS COUNT1
    FROM STEPS AS A
    JOIN STEPS AS B ON A.USER_ID = B.USER_ID AND A.STEPS_DATE <= B.STEPS_DATE AND DATEDIFF(B.STEPS_DATE, A.STEPS_DATE) <= 2)

SELECT USER_ID, GROUP1 AS STEPS_DATE, ROUND(AVG(COUNT1),2) AS ROLLING_AVERAGE 
FROM TEMP
GROUP BY USER_ID, GROUP1
HAVING COUNT(*) = 3
ORDER BY USER_ID ASC, STEPS_DATE ASC