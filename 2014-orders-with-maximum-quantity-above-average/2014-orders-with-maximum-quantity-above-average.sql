# Write your MySQL query statement below

# IMBALANCED ORDERS => MAXIMUM QUANTITY GREATER THAN AVG OF EVERY ORDER
# ORDER_ID OF IMBALANCED ORDERS

WITH AVG_QUANTITY AS (
    SELECT ORDER_ID, (SUM(QUANTITY) / COUNT(DISTINCT PRODUCT_ID)) AS AVG_QUAN
    FROM ORDERSDETAILS
    GROUP BY ORDER_ID), 

MAX_QUANTITY AS (
    SELECT ORDER_ID, MAX(QUANTITY) AS MAX_QUAN 
    FROM ORDERSDETAILS 
    GROUP BY ORDER_ID)

SELECT A.ORDER_ID
FROM AVG_QUANTITY AS A
JOIN MAX_QUANTITY AS B ON A.ORDER_ID = B.ORDER_ID
WHERE MAX_QUAN > (SELECT MAX(AVG_QUAN) FROM AVG_QUANTITY)