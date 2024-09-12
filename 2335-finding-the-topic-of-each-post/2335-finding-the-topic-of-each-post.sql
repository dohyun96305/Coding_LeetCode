# Write your MySQL query statement below

# FIND THE TOPICS OF EACH POST
# KEYWORD OF CERTAIN TOPIC => CONTENT OF A POST

# IF POST HAVE NO KEYWORDS => 'Ambiguous!'
# IF POST HAVE KEYWORDS => STRING OF IDS OF TOPICS, SEPERATED BY ',', NOT CONTAIN DUPLICATE IDS

SELECT A.POST_ID, IFNULL(GROUP_CONCAT(DISTINCT B.TOPIC_ID ORDER BY B.TOPIC_ID), 'Ambiguous!') AS TOPIC
FROM POSTS AS A
LEFT JOIN KEYWORDS AS B ON CONCAT(' ', LOWER(A.CONTENT), ' ') LIKE CONCAT('% ', LOWER(B.WORD), ' %')
GROUP BY POST_ID
