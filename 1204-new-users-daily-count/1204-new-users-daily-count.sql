# Write your MySQL query statement below

# EVERY DATE WITHIN MOST 90 DAYS FROM TODAY (2019-06-30)
# NUMBER OF USERS LOGGED IN FIRST TIME ON THAT DATE

WITH TEMP AS (
    SELECT USER_ID, MIN(ACTIVITY_DATE) AS FIRST_LOGIN
    FROM TRAFFIC
    WHERE ACTIVITY = 'LOGIN'
    GROUP BY USER_ID)

SELECT FIRST_LOGIN AS LOGIN_DATE, COUNT(*) AS USER_COUNT
FROM TEMP 
WHERE DATEDIFF('2019-06-30', FIRST_LOGIN) <= 90
GROUP BY FIRST_LOGIN    