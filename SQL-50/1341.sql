SELECT name AS results
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM MovieRating mr
    WHERE mr.user_id = u.user_id   
) = (
    SELECT MAX(rating_count)
    FROM (
        SELECT COUNT(*) AS rating_count
        FROM MovieRating
        GROUP BY user_id
    )
) 
ORDER BY name ASC
LIMIT 1