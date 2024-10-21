# Write your MySQL query statement below

# NUMBER OF DRIVERS CURRENTLY WITH HOPPER BY THE END OF THE MONTH
# NUMBER OF ACCEPTED RIDES IN THAT MONTH

WITH RECURSIVE ALL_MONTH AS (
    SELECT 1 AS MONTH 
    UNION 
    SELECT MONTH + 1 AS MONTH 
    FROM ALL_MONTH 
    WHERE MONTH < 12), 

ACCEPTED_MONTH AS (
    SELECT MONTH(A.REQUESTED_AT) AS MONTH, COUNT(B.RIDE_ID) AS ACCEPTED_RIDES
    FROM RIDES AS A
    LEFT JOIN ACCEPTEDRIDES AS B ON A.RIDE_ID = B.RIDE_ID
    WHERE YEAR(A.REQUESTED_AT) = '2020'
    GROUP BY MONTH(A.REQUESTED_AT))

SELECT A.MONTH, COUNT(B.DRIVER_ID) AS ACTIVE_DRIVERS, IFNULL(C.ACCEPTED_RIDES, 0) AS ACCEPTED_RIDES
FROM ALL_MONTH AS A
LEFT JOIN DRIVERS AS B ON 
    (YEAR(B.JOIN_DATE) < 2020 OR MONTH(B.JOIN_DATE) <= A.MONTH) AND 
    YEAR(B.JOIN_DATE) < 2021
LEFT JOIN ACCEPTED_MONTH AS C ON 
    A.MONTH = C.MONTH
GROUP BY A.MONTH
ORDER BY A.MONTH