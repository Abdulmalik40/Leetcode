SELECT user_id,spend,transaction_date from (
SELECT
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS Mark , *
FROM transactions
)t
WHERE Mark = 3
