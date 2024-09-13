# Write your MySQL query statement below

# MAKE EQUATIONS 
WITH TEMP_0 AS (
    SELECT *
    FROM TERMS 
    ORDER BY POWER DESC
), 

TEMP_1 AS (
    SELECT POWER, 
        CASE 
            WHEN POWER = 0 THEN FACTOR
            WHEN POWER = 1 THEN CONCAT(FACTOR, 'X')
            ELSE CONCAT(FACTOR, 'X^', POWER)
        END AS EQ1
    FROM TEMP_0), 

TEMP_2 AS (
    SELECT POWER,
        CASE    
            WHEN SUBSTRING(EQ1, 1, 1) = '-' THEN EQ1
            ELSE CONCAT('+', EQ1) 
        END AS EQ2
    FROM TEMP_1)

SELECT CONCAT(GROUP_CONCAT(EQ2 ORDER BY POWER DESC SEPARATOR ''), '=0') AS EQUATION
FROM TEMP_2