-- top 2 highest products spend for each category in 2022
WITH CTE AS (
    SELECT 
        category,
        product,
        ROUND(SUM(spend)::NUMERIC, 2) AS total_spend
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product
),
CTE2 AS (
    SELECT 
        category,
        product,
        total_spend,
        RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS ranking
    FROM CTE 
)
SELECT 
    category,
    product,
    total_spend
FROM CTE2
WHERE ranking <= 2
ORDER BY category, ranking
