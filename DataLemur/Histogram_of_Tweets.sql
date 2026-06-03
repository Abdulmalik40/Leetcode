SELECT user_num, COUNT(*) AS num_users
FROM (
    SELECT user_id, COUNT(msg) AS user_num
    FROM tweets
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022
    GROUP BY user_id
) AS user_counts
GROUP BY user_num
