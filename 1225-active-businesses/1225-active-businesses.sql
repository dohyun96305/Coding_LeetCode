# Write your MySQL query statement below

# ACTIVE BUSINESS BUSINESS THAT HAS MORE THAN ONE EVENT_TYPE 
# OCCURENCES GREATER THAN AVG ACTIVITY FOR EVENT

WITH TEMP AS (
    SELECT EVENT_TYPE, AVG(OCCURRENCES) AS AVG_OCC
    FROM EVENTS
    GROUP BY EVENT_TYPE)

SELECT BUSINESS_ID
FROM EVENTS AS A
JOIN TEMP AS B ON A.EVENT_TYPE = B.EVENT_TYPE AND A.OCCURRENCES > AVG_OCC
GROUP BY BUSINESS_ID
HAVING COUNT(BUSINESS_ID) > 1