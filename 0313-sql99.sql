-- sql99语法
-- select 
-- from 
-- join  inner/left/outer/full outer/cross
-- on
-- where


select emp.last_name, dep.department_name
from employees emp
inner join departments dep
on emp.department_id = dep.department_id;

select emp.last_name, j.job_title
from employees emp
inner join jobs j
on emp.job_id = j.job_id
where emp.last_name like "%a%";

select count(*), lo.city
from departments dep
inner join locations lo
on dep.location_id = lo.location_id
group by lo.city
having count(*) > 3;

select count(*) num, dep.department_name
from employees emp
inner join departments dep
on emp.department_id = dep.department_id
group by dep.department_name
having num > 3
order by num desc;

-- inner可省略

select emp.last_name, dep.department_name, j.job_title
from departments dep
inner join employees emp
on dep.department_id = emp.department_id
inner join jobs j
on emp.job_id = j.job_id
order by dep.department_name desc;

select salary, grade_level
from employees emp
inner join job_grades j
on emp.salary between j.lowest_sal and j.highest_sal;

select emp.last_name, ma.last_name
from employees emp
inner join employees ma
on emp.manager_id = ma.employee_id;

