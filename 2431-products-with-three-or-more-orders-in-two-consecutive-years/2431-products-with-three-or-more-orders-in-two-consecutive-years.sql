# Write your MySQL query statement below

# REPORT THE ID OF ALL PRODUCTS ORDERED THREE OR MORE TIMES IN TWO CONSECUTIVE YEARS

WITH TEMP AS (
    SELECT PRODUCT_ID, YEAR(PURCHASE_DATE) AS YEAR1, COUNT(*) AS CNT 
    FROM ORDERS
    GROUP BY PRODUCT_ID, YEAR(PURCHASE_DATE)
    HAVING CNT >= 3
    ORDER BY PRODUCT_ID, YEAR(PURCHASE_DATE)),

TEMP1 AS (
    SELECT PRODUCT_ID, YEAR1,  
        LEAD(YEAR1, 1, 0) OVER (PARTITION BY PRODUCT_ID ORDER BY YEAR1) AS NEXT_YEAR
    FROM TEMP)

SELECT DISTINCT PRODUCT_ID 
FROM TEMP1
WHERE NEXT_YEAR - YEAR1 = 1
