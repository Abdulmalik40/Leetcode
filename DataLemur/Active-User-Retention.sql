WITH CTE1 AS(
SELECT user_id,
    EXTRACT(MONTH FROM event_date) AS cur,
    LAG(EXTRACT(MONTH FROM event_date)) OVER(PARTITION BY user_id ORDER BY event_date) as prev 
FROM user_actions
WHERE EXTRACT(YEAR FROM event_date) = 2022
)
SELECT cur,COUNT(*)
FROM CTE1 
WHERE cur = 7 AND prev = 6
GROUP BY cur
