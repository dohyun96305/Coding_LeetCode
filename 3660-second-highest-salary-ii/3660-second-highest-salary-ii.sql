# Write your MySQL query statement below

# EMPLOYEES WHO EARN THE SECOND HIGHEST SALARY IN EACH DEPARTMENT
# MULTIPLE => INCLUDE ALL 
# ORDER BY EMP_ID

WITH TEMP AS (
    SELECT DEPT, EMP_ID, 
        DENSE_RANK() OVER (PARTITION BY DEPT ORDER BY SALARY DESC) AS RANK1
    FROM EMPLOYEES
    GROUP BY DEPT, EMP_iD
)

SELECT EMP_ID, DEPT
FROM TEMP
WHERE RANK1 = 2
ORDER BY EMP_ID