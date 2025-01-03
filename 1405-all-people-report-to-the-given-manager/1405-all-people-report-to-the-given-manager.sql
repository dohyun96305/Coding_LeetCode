# Write your MySQL query statement below

# EMPLOYEE_ID, DIRECTLY OR INDIRECTLY REPORT TO THE HEAD
# NOT EXCEED MORE THAN THREE MANAGERS

# EMPLOYEE_NAME = BOSS => REPORT TO MANAGER_ID

SELECT A.EMPLOYEE_ID
FROM EMPLOYEES AS A
LEFT JOIN EMPLOYEES AS B ON A.MANAGER_ID = B.EMPLOYEE_ID
LEFT JOIN EMPLOYEES AS C ON B.MANAGER_iD = C.EMPLOYEE_ID
WHERE C.MANAGER_ID = 1 AND A.EMPLOYEE_ID != 1