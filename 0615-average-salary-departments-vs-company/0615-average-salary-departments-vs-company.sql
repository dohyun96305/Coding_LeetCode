# Write your MySQL query statement below

# COMPARISON RESULT OF THE AVERAGE SALARY OF EMPLOYEES DEPARTMENT TO THE COMPANYS

WITH COM_AVG AS (
    SELECT DATE_FORMAT(PAY_DATE, '%Y-%m') AS PAY_MONTH, AVG(AMOUNT) AS AVG_COM
    FROM SALARY
    GROUP BY PAY_MONTH),

DEP_AVG AS (
    SELECT DATE_FORMAT(PAY_DATE, '%Y-%m') AS PAY_MONTH, B.DEPARTMENT_ID, AVG(AMOUNT) AS AVG_DEP
    FROM SALARY AS A
    JOIN EMPLOYEE AS B ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
    GROUP BY PAY_MONTH, B.DEPARTMENT_ID)

SELECT A.PAY_MONTH, A.DEPARTMENT_ID, 
    CASE 
        WHEN A.AVG_DEP > B.AVG_COM THEN 'higher'
        WHEN A.AVG_DEP < B.AVG_COM THEN 'lower'
        ELSE 'same'
    END AS COMPARISON
FROM DEP_AVG AS A
JOIN COM_AVG AS B ON A.PAY_MONTH = B.PAY_MONTH
ORDER BY A.PAY_MONTH, A.DEPARTMENT_ID