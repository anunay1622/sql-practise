/* Write your T-SQL query statement below */
select COALESCE(E.employee_id,S.employee_id) as employee_id
from Employees E
full join Salaries S
on E.employee_id=S.employee_id
where E.name is NULL or S.salary is NULL
order by COALESCE(E.employee_id,S.employee_id)
