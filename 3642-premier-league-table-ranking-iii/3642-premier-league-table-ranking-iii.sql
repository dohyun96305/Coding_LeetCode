# Write your MySQL query statement below

# CALCULATE POINTS, GOAL DIFFERENCE, RANK FOR EACH TEAM IN EACH SEASON
# FIRST RANKED BY THEIR TOTAL POINTS DESC
# RANKED BY THEIR GOAL DIFFERENCE DESC
# RANKED ALPHABETICALLY

WITH TEMP AS (
    SELECT SEASON_ID, TEAM_ID, TEAM_NAME, (3 * WINS + DRAWS) AS POINTS, 
        (GOALS_FOR - GOALS_AGAINST) AS GOAL_DIFFERENCE
    FROM SEASONSTATS
    GROUP BY SEASON_ID, TEAM_NAME
)

SELECT *, 
    ROW_NUMBER() OVER (PARTITION BY SEASON_ID 
                       ORDER BY POINTS DESC, GOAL_DIFFERENCE DESC, TEAM_NAME) AS POSITION
FROM TEMP

