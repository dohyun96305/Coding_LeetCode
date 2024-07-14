# Write your MySQL query statement below
# MOST MONEY IN EACH OF THE COMPANY
# HIGH EARNER TOP THREE UNIQUE SALARIES

WITH A AS (
    SELECT *, DENSE_RANK() OVER (
        PARTITION BY DEPARTMENTID 
        ORDER BY SALARY DESC) AS DR
    FROM EMPLOYEE)

SELECT B.NAME AS DEPARTMENT, A.NAME AS EMPLOYEE, A.SALARY
FROM A
JOIN DEPARTMENT AS B ON A.DEPARTMENTID = B.ID
WHERE DR <= 3
ORDER BY A.SALARY DESC;
