# Write your MySQL query statement below

# NUMBER OF DRIVERS CURRENTLY WITH HOPPER BY THE END OF THE MONTH
# NUMBER OF ACCEPTED RIDES IN THAT MONTH

WITH RECURSIVE ALL_MONTH AS (
    SELECT 1 AS MONTH 
    UNION
    SELECT MONTH + 1 AS MONTH 
    FROM ALL_MONTH 
    WHERE MONTH < 12), 

DRIVER_MONTH AS (
    SELECT (CASE WHEN YEAR(JOIN_DATE) < '2020' THEN 1 ELSE MONTH(JOIN_DATE) END) AS MONTH1, 
        COUNT(DRIVER_ID) AS ACTIVE_DRIVER
    FROM DRIVERS
    WHERE YEAR(JOIN_DATE) < 2021
    GROUP BY MONTH1), 

ACCEPTED_MONTH AS (
    SELECT MONTH(A.REQUESTED_AT) AS MONTH, COUNT(B.RIDE_ID) AS ACCEPTED_RIDES
    FROM RIDES AS A
    JOIN ACCEPTEDRIDES AS B ON A.RIDE_ID = B.RIDE_ID
    WHERE YEAR(A.REQUESTED_AT) = '2020'
    GROUP BY MONTH(A.REQUESTED_AT))

SELECT A.MONTH, 
    SUM(IFNULL(B.ACTIVE_DRIVER, 0)) OVER (ORDER BY A.MONTH) AS ACTIVE_DRIVERS, 
    IFNULL(C.ACCEPTED_RIDES, 0) AS ACCEPTED_RIDES
FROM ALL_MONTH AS A
LEFT JOIN DRIVER_MONTH AS B ON A.MONTH = B.MONTH1
LEFT JOIN ACCEPTED_MONTH AS C ON A.MONTH = C.MONTH