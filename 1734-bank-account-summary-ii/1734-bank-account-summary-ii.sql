# Write your MySQL query statement below
# name and balance of users with balance higher than 10000 (sum of the amounts of all transactions)

SELECT A.NAME, B.BALANCE 
FROM USERS AS A 
JOIN ( 
    SELECT ACCOUNT, SUM(AMOUNT) AS BALANCE
    FROM TRANSACTIONS 
    GROUP BY ACCOUNT
    HAVING SUM(AMOUNT) > 10000) AS B ON A.ACCOUNT = B.ACCOUNT
