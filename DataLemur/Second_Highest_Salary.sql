SELECT salary AS second_highest_salary FROM(
SELECT 
salary,
RANK() OVER( ORDER BY Salary DESC) AS Mark
FROM employee

)t
WHERE Mark = 2