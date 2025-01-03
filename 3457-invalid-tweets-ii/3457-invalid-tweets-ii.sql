# Write your MySQL query statement below

# EXCEEDS 140, MORE THAN 3 MENTIONS(@), INCLUDES MORE THAN 3 HASTAGS(#)


SELECT TWEET_ID
FROM TWEETS 
WHERE LENGTH(CONTENT) > 140 OR
    LENGTH(CONTENT) - LENGTH(REPLACE(CONTENT, '#', '')) > 3 OR
    LENGTH(CONTENT) - LENGTH(REPLACE(CONTENT, '@', '')) > 3

-- SELECT TWEET_ID
-- FROM TWEETS
-- WHERE CHAR_LENGTH(CONTENT) > 140 OR
--     CONTENT LIKE '%#%#%#%#%' OR 
--     CONTENT LIKE '%@%@%@%@%'