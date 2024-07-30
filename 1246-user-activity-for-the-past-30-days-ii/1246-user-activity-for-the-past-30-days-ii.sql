# Write your MySQL query statement below

# average number of sessions per user at least one activity
# period of 30 days ending 2019-07-27
# rounded to 2 decimal places 

SELECT IFNULL(ROUND(COUNT(DISTINCT SESSION_ID) / COUNT(DISTINCT USER_ID), 2), 0) AS AVERAGE_SESSIONS_PER_USER
FROM ACTIVITY 
WHERE ACTIVITY_DATE >= '2019-06-28' AND ACTIVITY_DATE <= '2019-07-27'