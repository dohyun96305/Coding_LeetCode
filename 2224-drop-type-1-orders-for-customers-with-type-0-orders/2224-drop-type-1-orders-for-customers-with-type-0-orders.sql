# Write your MySQL query statement below

# IF CUSTOMER AT LEAST ONE ORDER OF TYPE 0
# THEN NOT REPORT ANY ORDER OF TYPE 1

# REPORT ALL THE ORDERS OF THE CUSTOMER

WITH TEMP AS (
    SELECT DISTINCT CUSTOMER_ID
    FROM ORDERS
    WHERE ORDER_TYPE = 0
)

SELECT *
FROM ORDERS
WHERE (CUSTOMER_ID IN (SELECT * FROM TEMP) AND ORDER_TYPE != 1) OR (CUSTOMER_ID NOT IN (SELECT * FROM TEMP))