WITH user_post_dates AS (
  SELECT
    user_id,
    MIN(post_date) AS first_post,
    MAX(post_date) AS last_post,
    COUNT(*) AS total_posts
  FROM posts
  WHERE YEAR(post_date) = 2021
  GROUP BY user_id
  HAVING COUNT(*) > 1
)

SELECT
  user_id,
  DATEDIFF(last_post, first_post) AS days_between
FROM user_post_dates;