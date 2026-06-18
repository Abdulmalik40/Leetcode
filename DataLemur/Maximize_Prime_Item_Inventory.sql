WITH summary AS (
    SELECT
        item_type,
        SUM(square_footage)  AS total_sqft,
        COUNT(*)             AS item_count
    FROM inventory
    GROUP BY item_type
),
enriched AS (
    SELECT
        item_type,
        total_sqft,
        item_count,
        MAX(FLOOR(500000 / total_sqft) * total_sqft)
            FILTER (WHERE item_type = 'prime_eligible') OVER () AS prime_area,
        MAX(FLOOR(500000 / total_sqft) * item_count)
            FILTER (WHERE item_type = 'prime_eligible') OVER () AS prime_item_count
    FROM summary
)
SELECT
    item_type,
    CASE
        WHEN item_type = 'prime_eligible'
            THEN prime_item_count
        WHEN item_type = 'not_prime'
            THEN FLOOR((500000 - prime_area) / total_sqft) * item_count
    END AS item_count
FROM enriched
ORDER BY item_type DESC;
