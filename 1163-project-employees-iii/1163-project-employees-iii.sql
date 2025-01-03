# Write your MySQL query statement below

# MOST EXPERIENCED EMPLOYEES IN EACH PROJECT
# IF TIE, REPORT ALL 

WITH PROJECT_RANK AS (
    SELECT A.PROJECT_ID, A.EMPLOYEE_ID, RANK() OVER (PARTITION BY A.PROJECT_ID ORDER BY B.EXPERIENCE_YEARS DESC) AS RANK1
    FROM PROJECT AS A
    JOIN EMPLOYEE AS B ON A.EMPLOYEE_ID = B.EMPLOYEE_ID) 

SELECT PROJECT_ID, EMPLOYEE_ID 
FROM PROJECT_RANK 
WHERE RANK1 = 1