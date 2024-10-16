# Write your MySQL query statement below

SELECT ROUND(POW((POW((A.X-B.X), 2) + POW((A.Y-B.Y), 2)), 1/2), 2) AS SHORTEST
FROM POINT2D AS A
CROSS JOIN POINT2D AS B 
HAVING SHORTEST != 0
ORDER BY SHORTEST
LIMIT 1