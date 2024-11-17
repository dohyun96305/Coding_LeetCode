# Write your MySQL query statement below

# FIND THE TOP 3 TRENDING HASTAGS IN FEBURARY 2024
# CONTAIN SEVERAL HASTTAG

# REGEXP '#[^\\s]+'

-- # => #으로 시작
-- ^ => 부정문자, 뒤에 오는 ^에 대해 부정 
-- \\s => 공백 문자 
-- [^\\s] => 공백이 아닌 모든 문자 매칭
-- + => 앞의 표현식에 대해 1회 이상 반복, 공백일 때까지 반복 

WITH RECURSIVE HASHTAGS_TWEETS AS (
    SELECT 
        REGEXP_SUBSTR(TWEET, '#[^\\s]+') AS HASHTAG,                -- TWEET에서 '#[^//S+]' 매칭되는 첫번째 반환
        REGEXP_REPLACE(TWEET, "#[^\\s]+", "", 1, 1) AS TWEET_AFTER  -- TWEET에서 '#[^//S+]' 매칭되는 첫번째만 ''로 대체 후 나머지 반환 
    FROM TWEETS
    WHERE DATE_FORMAT(TWEET_DATE, '%Y-%m') = '2024-02'
    UNION ALL
    SELECT         
        REGEXP_SUBSTR(TWEET_AFTER, '#[^\\s]+') AS HASHTAG,                -- TWEET_AFTER '#[^//S+]' 매칭되는 첫번째 반환
        REGEXP_REPLACE(TWEET_AFTER, "#[^\\s]+", "", 1, 1) AS TWEET_AFTER  -- TWEET_AFTER '#[^//S+]' 매칭되는 첫번째만 ''로 대체 후 나머지 반환 
    FROM HASHTAGS_TWEETS
    WHERE HASHTAG IS NOT NULL)

SELECT HASHTAG, 
    COUNT(*) AS COUNT
FROM HASHTAGS_TWEETS
WHERE HASHTAG IS NOT NULL
GROUP BY HASHTAG
ORDER BY COUNT DESC, HASHTAG DESC
LIMIT 3


