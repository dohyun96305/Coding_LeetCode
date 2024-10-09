# Write your MySQL query statement below

# TOTAL QUANTITY SOLD FOR EVERY PRODUCT ID

SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM SALES
GROUP BY PRODUCT_ID