SELECT
candidate_id
FROM candidates 
WHERE UPPER(skill) IN ( UPPER('Python') , UPPER('Tableau') , ('PostgreSQL'))
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) >= 3;