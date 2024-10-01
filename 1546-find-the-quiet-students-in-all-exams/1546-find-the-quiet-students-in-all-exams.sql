# Write your MySQL query statement below

# TOOK AT LEAST ONE EXAM AND DID NOT SCORE THE HIGHEST OR THE LOWEST
# (STUDENT_ID, STUDENT_NAME)
# ORDER BY STUDENT_ID

WITH MIN_MAX_SCORE AS (
    SELECT *, 
        MIN(SCORE) OVER (PARTITION BY EXAM_ID) AS MIN_SCORE, 
        MAX(SCORE) OVER (PARTITION BY EXAM_ID) AS MAX_SCORE
    FROM EXAM), 

STUDENT_COUNT AS (
    SELECT STUDENT_ID, COUNT(EXAM_ID) AS CNT1 
    FROM EXAM
    GROUP BY STUDENT_ID),

MIN_MAX_STUDENT AS (
    SELECT DISTINCT STUDENT_ID 
    FROM MIN_MAX_SCORE
    WHERE SCORE = MIN_SCORE OR SCORE = MAX_SCORE)

SELECT A.STUDENT_ID, A.STUDENT_NAME
FROM STUDENT AS A
LEFT JOIN STUDENT_COUNT AS B ON A.STUDENT_ID = B.STUDENT_ID
LEFT JOIN MIN_MAX_STUDENT AS C ON A.STUDENT_ID = C.STUDENT_ID
WHERE B.STUDENT_ID IS NOT NULL AND C.STUDENT_ID IS NULL
ORDER BY A.STUDENT_ID