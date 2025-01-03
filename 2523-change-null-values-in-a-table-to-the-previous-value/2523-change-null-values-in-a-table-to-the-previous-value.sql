# Write your MySQL query statement below

# REPLACE NULL WITHE PREVIOUS ROW NAME OF THE DRINK THAT IS NOT NULL


WITH RECURSIVE BASE_RANK AS ( 
    SELECT ID, DRINK, 
        ROW_NUMBER() OVER () AS RANK1 
    FROM COFFEESHOP),

RECU_NULL AS (
    SELECT ID, DRINK, RANK1
    FROM BASE_RANK 
    WHERE RANK1 = 1

    UNION ALL 

    SELECT B.ID, IFNULL(B.DRINK, A.DRINK), B.RANK1
    FROM RECU_NULL AS A
    JOIN BASE_RANK AS B ON B.RANK1 = A.RANK1 + 1)

SELECT ID, DRINK 
FROM RECU_NULL