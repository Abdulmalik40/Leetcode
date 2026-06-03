SELECT COUNT(*) 
FROM(
SELECT
COUNT(*) as policy_holder_count
FROM callers 
GROUP BY policy_holder_id
HAVING COUNT(*) >= 3
)T