# Write your MySQL query statement below

# FINAL PRICE OF EACH PRODUCT AFTER APPLYING DISCONT
# NO DISCOUT => REMAINING
# ORDER BY PRODUCT_ID ASC

SELECT A.PRODUCT_ID, (IFNULL((100-B.DISCOUNT), 100) * A.PRICE) / 100 AS FINAL_PRICE, A.CATEGORY
FROM PRODUCTS AS A
LEFT JOIN DISCOUNTS AS B ON A.CATEGORY = B.CATEGORY
ORDER BY PRODUCT_ID 