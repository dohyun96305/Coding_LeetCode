# Write your MySQL query statement below

# REPORT IDS OF THE USERS FIRST LAST CALLS ON ANY DAY IN THE SAME PERSON
# 

WITH TEMP_ALL AS (
    SELECT CALL_TIME, CALLER_ID AS START, RECIPIENT_ID AS END
    FROM CALLS

    UNION 

    SELECT CALL_TIME, RECIPIENT_ID AS START, CALLER_ID AS END
    FROM CALLS),

TEMP_FIRST_LAST AS (
    SELECT CALL_TIME, START, 
        FIRST_VALUE(END) OVER (PARTITION BY START, DATE(CALL_TIME) ORDER BY CALL_TIME) AS FIRST_CALL, 
        FIRST_VALUE(END) OVER (PARTITION BY START, DATE(CALL_TIME) ORDER BY CALL_TIME DESC) AS LAST_CALL
    FROM TEMP_ALL)

SELECT DISTINCT START AS USER_ID
FROM TEMP_FIRST_LAST
WHERE FIRST_CALL = LAST_CALL