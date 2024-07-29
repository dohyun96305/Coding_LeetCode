# Write your MySQL query statement below
# name and balance of users with balance higher than 10000 (sum of the amounts of all transactions)

SELECT A.NAME, SUM(B.AMOUNT) AS BALANCE 
FROM USERS AS A
LEFT JOIN TRANSACTIONS AS B ON A.ACCOUNT = B.ACCOUNT
GROUP BY B.ACCOUNT
HAVING BALANCE > 10000

