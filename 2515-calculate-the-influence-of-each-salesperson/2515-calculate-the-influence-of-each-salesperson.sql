# Write your MySQL query statement below

# SUM OF PRICES PAID BY THE CUSTOMERS OF EACH SALESPERSON 

SELECT A.SALESPERSON_ID, A.NAME, IFNULL(SUM(C.PRICE), 0) AS TOTAL 
FROM SALESPERSON AS A
LEFT JOIN CUSTOMER AS B ON A.SALESPERSON_ID = B.SALESPERSON_ID
LEFT JOIN SALES AS C ON B.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY SALESPERSON_ID