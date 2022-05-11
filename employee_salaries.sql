SELECT 
       d.name as department_name, 
      SUM(CASE WHEN e.salary > 100000 THEN 1 ELSE 0 END)/COUNT(DISTINCT e.id)AS percentage_over_100K,
      COUNT(DISTINCT e.id) AS number_of_employees
FROM employees e JOIN departments d ON  d.id=e.department_id
GROUP BY d.id
HAVING COUNT(DISTINCT e.id) >= 10
ORDER BY SUM(CASE WHEN e.salary > 100000 THEN 1 ELSE 0 END)/COUNT(DISTINCT e.id) DESC
LIMIT 3
