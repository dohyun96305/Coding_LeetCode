# Write your MySQL query statement below

SELECT A.TEAM_NAME AS HOME_TEAM, B.TEAM_NAME AS AWAY_TEAM
FROM TEAMS AS A, TEAMS AS B
WHERE A.TEAM_NAME != B.TEAM_NAME