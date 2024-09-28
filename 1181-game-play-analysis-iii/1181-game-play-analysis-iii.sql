# Write your MySQL query statement below

# EACH PLAYER AND DATE
# TOTAL NUMBER OF GAMES PLAYED BY PLAYER

SELECT PLAYER_ID, EVENT_DATE, 
    SUM(GAMES_PLAYED) OVER (PARTITION BY PLAYER_ID ORDER BY EVENT_DATE) AS GAMES_PLAYED_SO_FAR
FROM ACTIVITY
ORDER BY PLAYER_ID, EVENT_DATE DESC