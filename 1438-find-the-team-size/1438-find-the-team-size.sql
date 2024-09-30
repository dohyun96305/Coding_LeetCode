# Write your MySQL query statement below

# FIND TEAM SIZE OF EACH EMPLOYEES

SELECT A.EMPLOYEE_ID, B.TEAM_SIZE
FROM EMPLOYEE AS A
LEFT JOIN (
    SELECT TEAM_ID, COUNT(EMPLOYEE_ID) AS TEAM_SIZE
    FROM EMPLOYEE
    GROUP BY TEAM_ID) AS B ON A.TEAM_ID = B.TEAM_ID