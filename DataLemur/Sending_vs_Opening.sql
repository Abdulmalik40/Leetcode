WITH CTE AS (
SELECT
b.age_bucket  AS age_bucket , 
 SUM(CASE WHEN activity_type = 'open'THEN time_spent ELSE 0 END )AS t_o ,
      SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END ) AS t_s
FROM activities AS a 
LEFT JOIN age_breakdown AS b 
USING(user_id)
GROUP BY b.age_bucket
)
SELECT age_bucket , 
ROUND(t_s / (t_s + t_o) * 100.0,2) as send_prec,
ROUND(t_o / (t_s + t_o) * 100.0,2) as open_perc
FROM CTE
GROUP BY age_bucket