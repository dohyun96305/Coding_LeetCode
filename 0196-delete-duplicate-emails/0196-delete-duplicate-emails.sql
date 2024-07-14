# Write your MySQL query statement below
DELETE A 
FROM PERSON AS A, PERSON AS B 
WHERE A.EMAIL = B.EMAIL AND A.ID > B.ID