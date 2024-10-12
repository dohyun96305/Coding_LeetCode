# Write your MySQL query statement below

# NUMBER OF STREAMING SESSIONS FOR USERS WHOSE FIRST SESSION AS A VIEWER
# ORDER BY COUNT OF STREAMING SESSIONS, USER_ID DESC

WITH TEMP AS (
    SELECT USER_ID, SESSION_TYPE,  
        ROW_NUMBER() OVER (PARTITION BY USER_ID ORDER BY SESSION_START) AS RANK1
    FROM SESSIONS),

VIEWER_ID AS (
    SELECT USER_ID
    FROM TEMP
    WHERE RANK1 = 1 AND SESSION_TYPE = 'VIEWER')

SELECT USER_ID, COUNT(USER_ID) AS SESSIONS_COUNT
FROM TEMP 
WHERE USER_ID IN (SELECT USER_ID FROM VIEWER_ID) AND RANK1 != 1 AND SESSION_TYPE = 'STREAMER'
GROUP BY USER_ID
ORDER BY SESSIONS_COUNT DESC, USER_ID DESC