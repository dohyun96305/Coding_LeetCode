# Write your MySQL query statement below

# REPORT PERCENTAGE OF WORKING DRIVERS FOR EACH MONTH OF 2020
# (DRIVERS ACCEPTED AT LEAST ONE RIDE DURING MONTH) / (AVAILABLE DRIVERS DURING THE MONTH) * 100
# ORDER BY MONTH ASC, ROUND WORKING_PERCENTAGE 2 DECIMAL

WITH RECURSIVE MONTH_2020 AS (
    SELECT 1 AS MONTH
    
    UNION ALL 

    SELECT MONTH + 1 AS MONTH
    FROM MONTH_2020 
    WHERE MONTH < 12),

MONTH_DRIVER AS (
    SELECT MONTH, B.DRIVER_ID
    FROM MONTH_2020 AS A
    LEFT JOIN DRIVERS AS B ON YEAR(B.JOIN_DATE) < '2020' OR ( YEAR(B.JOIN_DATE) = '2020' AND MONTH(B.JOIN_DATE) <= A.MONTH )), 

CNT_MONTH_DRIVERS AS (
    SELECT MONTH, COUNT(DRIVER_ID) AS CNT_AVAILABLE_DRIVERS
    FROM MONTH_DRIVER
    GROUP BY MONTH),

ACCEPTED_DRIVES AS (
    SELECT A.REQUESTED_AT, B.DRIVER_ID
    FROM RIDES AS A
    JOIN ACCEPTEDRIDES AS B ON A.RIDE_ID = B.RIDE_ID AND YEAR(REQUESTED_AT) = '2020'),

CNT_ACCEPTED_DRIVERS AS (
    SELECT A.MONTH, COUNT(DISTINCT B.DRIVER_ID) AS CNT_ACCEPTED_DRIVERS
    FROM MONTH_DRIVER AS A 
    JOIN ACCEPTED_DRIVES AS B ON A.MONTH = MONTH(B.REQUESTED_AT) AND A.DRIVER_ID = B.DRIVER_ID
    GROUP BY A.MONTH)

SELECT A.MONTH, IFNULL(ROUND((CNT_ACCEPTED_DRIVERS / CNT_AVAILABLE_DRIVERS) * 100, 2), 0) AS WORKING_PERCENTAGE
FROM CNT_MONTH_DRIVERS AS A
LEFT JOIN CNT_ACCEPTED_DRIVERS AS B ON A.MONTH = B.MONTH

