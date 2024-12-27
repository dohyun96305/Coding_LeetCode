# Write your MySQL query statement below

SELECT A.ID, 
    CASE
        WHEN A.P_ID IS NULL THEN 'Root'
        WHEN B.P_ID IS NULL THEN 'Leaf'
        ELSE 'Inner'
    END AS TYPE
FROM TREE AS A
LEFT JOIN TREE AS B ON A.ID = B.P_ID
GROUP BY A.ID