# Write your MySQL query statement below

# FIRST LOGIN DATE FOR EACH PLAYER

SELECT PLAYER_ID, MIN(EVENT_DATE) AS FIRST_LOGIN
FROM ACTIVITY
GROUP BY PLAYER_ID