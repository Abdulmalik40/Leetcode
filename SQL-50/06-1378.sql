SELECT 
e.name,
em.unique_id
FROM Employees e
LEFT JOIN EmployeeUNI em
USING(id)