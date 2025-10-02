SELECT
p.product_name , s.year,s.price
FROM product p
LEFT JOIN Sales s
USING(product_id)
WHERE price IS NOT NULL