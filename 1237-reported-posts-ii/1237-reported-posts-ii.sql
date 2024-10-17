# Write your MySQL query statement below

# AVG DAILY PERCENTAGE OF POSTS REMOVED AFTER REPORTED
# ROUND 2 DECIMAL 

WITH TEMP AS (
    SELECT A.POST_ID AS REPORT_POST, A.ACTION_DATE, A.ACTION, A.EXTRA, B.POST_ID AS REMOVED_POST, B.REMOVE_DATE
    FROM ACTIONS AS A
    LEFT JOIN REMOVALS AS B ON A.POST_ID = B.POST_ID
    WHERE A.EXTRA = 'SPAM'), 

DAY_AVG AS (
    SELECT (COUNT(DISTINCT REMOVED_POST) / COUNT(DISTINCT REPORT_POST)) * 100 AS AVG_DAY
    FROM TEMP
    GROUP BY ACTION_DATE)

SELECT ROUND(AVG(AVG_DAY), 2) AS AVERAGE_DAILY_PERCENT
FROM DAY_AVG