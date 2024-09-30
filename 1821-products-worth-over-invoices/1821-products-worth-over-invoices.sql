# Write your MySQL query statement below

# EACH PRODUCT_NAME, TOTAL AMOUNT, PAID, CANCELD, REFUNDED
# ORDER BY PRODUCT_NAME

SELECT A.NAME, 
    IFNULL(SUM(REST), 0) AS REST, 
    IFNULL(SUM(PAID), 0) AS PAID, 
    IFNULL(SUM(CANCELED), 0) AS CANCELED, 
    IFNULL(SUM(REFUNDED), 0) AS REFUNDED
FROM PRODUCT AS A
LEFT JOIN INVOICE AS B ON A.PRODUCT_ID = B.PRODUCT_ID
GROUP BY A.PRODUCT_ID
ORDER BY A.NAME