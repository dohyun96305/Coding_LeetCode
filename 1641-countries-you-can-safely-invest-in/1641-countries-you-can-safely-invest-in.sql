# Write your MySQL query statement below

# INTEND TO INVEST IN COUNTRIES WHERE AVG CALL DURATION GREATER THAN THE GLOBAL AVG
# 

WITH TEMP AS (
    SELECT B.ID, B.NAME, A.DURATION, C.NAME AS COUNTRY
    FROM CALLS AS A
    JOIN PERSON AS B ON A.CALLER_ID = B.ID OR A.CALLEE_ID = B.ID
    JOIN COUNTRY AS C ON SUBSTRING(B.PHONE_NUMBER, 1, 3) = C.COUNTRY_CODE), 

AVG_COUNTRY AS (
    SELECT COUNTRY, 
        AVG(DURATION) OVER (PARTITION BY COUNTRY) AS COUNTRY_AVG, 
        AVG(DURATION) OVER () AS ALL_AVG
    FROM TEMP)

SELECT DISTINCT COUNTRY
FROM AVG_COUNTRY
WHERE COUNTRY_AVG > ALL_AVG
ORDER BY COUNTRY

