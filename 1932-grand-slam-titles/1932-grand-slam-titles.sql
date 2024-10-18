# Write your MySQL query statement below

# NUMBER OF GRAND SLAM TOURNAMENTS WON BY EACH PLAYER
# NOT INCLUDE WHO DID NOT WIN 

SELECT A.PLAYER_ID, A.PLAYER_NAME, 
    SUM(B.WIMBLEDON = A.PLAYER_ID) + SUM(B.FR_OPEN = A.PLAYER_ID) + SUM(B.US_OPEN = A.PLAYER_ID) + SUM(B.AU_OPEN = A.PLAYER_ID) AS GRAND_SLAMS_COUNT
FROM PLAYERS AS A, CHAMPIONSHIPS AS B
GROUP BY A.PLAYER_ID
HAVING GRAND_SLAMS_COUNT > 0