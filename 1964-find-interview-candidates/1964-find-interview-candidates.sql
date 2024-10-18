# Write your MySQL query statement below

# NAME, MAIL OF ALL INTERVIEW CANDIDATES
# WON ANY MEDAL IN THREE OR MORE CONSECUTIVE CONTESTS 
# WON GOLD MEDAL IN THREE OR MORE DIFFERENT CONTESTS

WITH USER_MEDAL AS (
    SELECT GOLD_MEDAL AS USER_ID, CONTEST_ID
    FROM CONTESTS 
    UNION ALL 
    SELECT SILVER_MEDAL AS USER_ID, CONTEST_ID
    FROM CONTESTS 
    UNION ALL 
    SELECT BRONZE_MEDAL AS USER_ID, CONTEST_ID
    FROM CONTESTS), 

USER_MEDAL_RANK AS (
    SELECT USER_ID, CONTEST_ID, 
        CONTEST_ID - ROW_NUMBER() OVER (PARTITION BY USER_ID ORDER BY CONTEST_ID) AS RANK1
    FROM USER_MEDAL), 

USER_INTERVIEW AS (
    SELECT DISTINCT USER_ID
    FROM USER_MEDAL_RANK
    GROUP BY USER_ID, RANK1
    HAVING COUNT(*) >= 3

    UNION 

    SELECT GOLD_MEDAL AS USER_ID
    FROM CONTESTS
    GROUP BY GOLD_MEDAL
    HAVING COUNT(*) >= 3)

SELECT A.NAME, A.MAIL
FROM USERS AS A
JOIN USER_INTERVIEW AS B ON A.USER_ID = B.USER_ID
