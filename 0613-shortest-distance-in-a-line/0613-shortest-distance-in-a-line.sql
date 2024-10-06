# Write your MySQL query statement below
SELECT MIN(ABS(A.X - B.X)) AS SHORTEST
FROM POINT AS A, POINT AS B
WHERE A.X != B.X