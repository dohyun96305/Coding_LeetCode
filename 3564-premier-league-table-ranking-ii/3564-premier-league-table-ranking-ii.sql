# Write your MySQL query statement below

# CALCULATE POINTS, POSITION, TIER FOR EACH TEAM IN LEAGUE
# WIN => 3, DRAW => 1, LOSS => 0
# TIER 1,2,3 BASED ON POINTS PERCENTAGE

WITH TEMP AS (
    SELECT TEAM_NAME, (3 * WINS + 1 * DRAWS) AS POINTS
    FROM TEAMSTATS), 

TEMP_RANK AS (
    SELECT TEAM_NAME, POINTS, 
    RANK() OVER (ORDER BY POINTS DESC) AS POSITION, 
    PERCENT_RANK() OVER (ORDER BY POINTS DESC) AS PERC
    FROM TEMP)

SELECT TEAM_NAME, POINTS, POSITION, 
    CASE
         WHEN position < (0.33 * (SELECT MAX(position) FROM TEMP_RANK)+1) THEN 'Tier 1'
         ELSE
         CASE
            WHEN position < (0.66 * (SELECT MAX(position) FROM TEMP_RANK)+1) THEN 'Tier 2'
            ELSE 'Tier 3'
         END
    END AS tier
FROM TEMP_RANK
ORDER BY POINTS DESC, TEAM_NAME
