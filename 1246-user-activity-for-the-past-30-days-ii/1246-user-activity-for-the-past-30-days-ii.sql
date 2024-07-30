# Write your MySQL query statement below

# average number of sessions per user at least one activity
# period of 30 days ending 2019-07-27
# rounded to 2 decimal places 

SELECT IFNULL(ROUND(AVG(COUNT_SESSION), 2), 0) AS AVERAGE_SESSIONS_PER_USER
FROM (
    SELECT USER_ID, COUNT(DISTINCT SESSION_ID) AS COUNT_SESSION
    FROM ACTIVITY 
    WHERE DATEDIFF('2019-07-27', ACTIVITY_DATE) < 30 AND ACTIVITY_DATE <= '2019-07-27'
    GROUP BY USER_ID
    HAVING COUNT_SESSION > 0) AS A