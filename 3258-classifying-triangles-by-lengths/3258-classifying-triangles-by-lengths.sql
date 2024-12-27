# Write your MySQL query statement below

SELECT 
    CASE 
        WHEN (A+B+C) <= 2 * GREATEST(A, B, C) THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral' 
        WHEN A != B AND B != C AND A != C THEN 'Scalene'
        ELSE 'Isosceles'
    END AS TRIANGLE_TYPE
FROM TRIANGLES


