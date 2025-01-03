# Write your MySQL query statement below

# THREE OR MORE ROWS WITH CONSECUTIVE IDS, NUMBER OF PEOPLE IS GREATER THAN OR EQUAL 100 FOR EACH
# VISIT_DATE ASC ORDER

WITH TEMP AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY ID) AS ROW_NUM
    FROM STADIUM
    WHERE PEOPLE >= 100),

ROW_COUNT AS (
    SELECT (ID - ROW_NUM) AS DIFF_ID
    FROM TEMP
    GROUP BY DIFF_ID
    HAVING COUNT(*) >= 3)

SELECT ID, VISIT_DATE, PEOPLE
FROM TEMP
WHERE (ID - ROW_NUM) IN (SELECT * FROM ROW_COUNT)
ORDER BY VISIT_DATE ASC