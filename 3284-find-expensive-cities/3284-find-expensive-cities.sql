# Write your MySQL query statement below

# AVG HOME PRICES EXCEED THE NATIONAL AVG HOME PRICE
# ORDER BY CITY ASC

WITH TEMP AS (
    SELECT *, AVG(PRICE) AS AVG1
    FROM LISTINGS
    GROUP BY CITY)

SELECT CITY
FROM TEMP
WHERE AVG1 > (SELECT AVG(PRICE) FROM LISTINGS)
ORDER BY CITY ASC