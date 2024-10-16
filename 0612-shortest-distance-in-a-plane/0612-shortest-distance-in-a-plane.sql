# Write your MySQL query statement below

SELECT ROUND(POW((POW((A.X-B.X), 2) + POW((A.Y-B.Y), 2)), 1/2), 2) AS SHORTEST
FROM POINT2D AS A
LEFT JOIN POINT2D AS B ON (A.X, A.Y) != (B.X, B.Y)
ORDER BY SHORTEST
LIMIT 1
