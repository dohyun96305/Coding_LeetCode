# Write your MySQL query statement below

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(CUSTOMER_NUMBER) DESC
LIMIT 1;