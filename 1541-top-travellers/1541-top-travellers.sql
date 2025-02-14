# Write your MySQL query statement below

SELECT A.NAME, IFNULL(SUM(B.DISTANCE), 0) AS TRAVELLED_DISTANCE
FROM USERS AS A
LEFT JOIN RIDES AS B ON A.ID = B.USER_ID
GROUP BY A.ID
ORDER BY TRAVELLED_DISTANCE DESC, NAME