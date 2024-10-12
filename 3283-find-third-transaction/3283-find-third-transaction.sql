WITH TEMP AS (
    -- Filter users with at least 3 transactions
    SELECT USER_ID
    FROM TRANSACTIONS
    GROUP BY USER_ID
    HAVING COUNT(TRANSACTION_DATE) >= 3
), 

USER_RANK AS (  
    -- Rank each user's transactions by transaction date
    SELECT USER_ID, SPEND, TRANSACTION_DATE, 
           RANK() OVER (PARTITION BY USER_ID ORDER BY TRANSACTION_DATE) AS RANK1
    FROM TRANSACTIONS
    WHERE USER_ID IN (SELECT USER_ID FROM TEMP)
)

SELECT A.USER_ID,
       A.SPEND AS THIRD_TRANSACTION_SPEND, 
       A.TRANSACTION_DATE AS THIRD_TRANSACTION_DATE
FROM USER_RANK AS A
JOIN USER_RANK AS B 
  ON A.USER_ID = B.USER_ID 
     AND B.RANK1 IN (1, 2)  -- Join with first two transactions
     AND A.RANK1 = 3        -- Focus on the third transaction
     AND A.SPEND > B.SPEND   -- Condition for spend comparison
GROUP BY A.USER_ID, A.SPEND, A.TRANSACTION_DATE
HAVING COUNT(B.RANK1) = 2   -- Ensure both first and second transactions exist
ORDER BY A.USER_ID;