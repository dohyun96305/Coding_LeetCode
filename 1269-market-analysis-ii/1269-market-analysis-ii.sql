# Write your MySQL query statement below

# EACH USER WHETHER SECOND ITEM(BY DATE) IS THEIR FAVORITE ITEM
# IF LESS THAN TWO ITEMS THAN NO

WITH TEMP AS (
    SELECT SELLER_ID, ITEM_ID,
        RANK() OVER (PARTITION BY SELLER_ID ORDER BY ORDER_DATE) AS RANK1
    FROM ORDERS)

SELECT A.USER_ID AS SELLER_ID, 
    CASE WHEN A.FAVORITE_BRAND = C.ITEM_BRAND THEN 'yes'
    ELSE 'no' END AS '2nd_item_fav_brand'
FROM USERS AS A
LEFT JOIN TEMP AS B ON (A.USER_ID = B.SELLER_ID) AND (B.RANK1 = 2)
LEFT JOIN ITEMS AS C ON B.ITEM_ID = C.ITEM_ID