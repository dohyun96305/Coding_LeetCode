# Write your MySQL query statement below

# National team, sorting points desc
# same points => sorting name lexicographical order

WITH TEMP AS (
    SELECT A.TEAM_ID, A.NAME, A.POINTS,
        ROW_NUMBER() OVER (ORDER BY A.POINTS DESC, A.NAME) AS PREV_RANK, 
        ROW_NUMBER() OVER (ORDER BY A.POINTS + B.POINTS_CHANGE DESC, A.NAME) AS CURR_RANK
    FROM TEAMPOINTS AS A
    JOIN POINTSCHANGE AS B ON A.TEAM_ID = B.TEAM_ID
    )

SELECT TEAM_ID, NAME, 
    1.0 * PREV_RANK - 1.0 * CURR_RANK AS RANK_DIFF
FROM TEMP 



