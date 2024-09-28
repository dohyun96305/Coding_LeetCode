# Write your MySQL query statement below

# CUSTOMER_ID, CUSTOMER_NAME WHO SPENT AT LEAST 100 IN EACH MONTH OF JUNE AND JULY 2020

WITH TEMP AS (
    SELECT B.CUSTOMER_ID, B.NAME, MONTH(A.ORDER_DATE) AS MONTH1, SUM(A.QUANTITY * C.PRICE) AS PRICE1
    FROM ORDERS AS A
    LEFT JOIN CUSTOMERS AS B ON A.CUSTOMER_ID = B.CUSTOMER_ID
    LEFT JOIN PRODUCT AS C ON A.PRODUCT_ID = C.PRODUCT_ID
    WHERE YEAR(A.ORDER_DATE) = '2020' AND MONTH(A.ORDER_DATE) BETWEEN 6 AND 7
    GROUP BY A.CUSTOMER_ID, MONTH(A.ORDER_DATE))

SELECT CUSTOMER_ID, NAME
FROM TEMP 
WHERE PRICE1 >= 100
GROUP BY CUSTOMER_ID
HAVING COUNT(MONTH1) = 2 