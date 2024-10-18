# Write your MySQL query statement below

# NAME OF MANAGER LARGEST DEPARTMENT 
# ORDER BY DEP_ID ASC

WITH TEMP AS (
    SELECT A.EMP_NAME, A.DEP_ID,
        RANK() OVER (ORDER BY COUNT(B.EMP_ID) DESC) AS RANK1
    FROM EMPLOYEES AS A 
    LEFT JOIN EMPLOYEES AS B ON A.POSITION = 'MANAGER' AND A.DEP_ID = B.DEP_ID
    GROUP BY A.DEP_ID)

SELECT EMP_NAME AS MANAGER_NAME, DEP_ID
FROM TEMP 
WHERE RANK1 = 1
ORDER BY DEP_ID 