-- 连接查询
-- sql92：仅仅支持内连接
-- sql99[推荐]
-- 内连接：
-- 	等值链接
-- 	非等值连接
-- 	自连接
-- 外连接：
-- 	左外连接
-- 	右外连接
-- 	全外连接
-- 交叉连接：

-- 1.等值链接
select name 'name', boyName
from boys, beauty
where beauty.boyfriend_id = boys.id;

-- 起别名 有别名之后 只能用别名
select first_name, department_name
from employees e, departments d
where e.department_id = d.department_id;

select first_name, department_name
from employees e, departments d
where e.department_id = d.department_id
and e.commission_pct is not null;

select city, department_name
from departments d, locations lo
where d.location_id = lo.location_id
and city like '_o%';

select count(*) num, city
from  departments d, locations lo
where d.location_id = lo.location_id
group by city;

select de.department_id, de.department_name, min(salary), de.manager_id
from employees e, departments de
where e.department_id = de.department_id
and e.commission_pct is not null
group by e.department_id;

select job_title, count(*) num
from employees e, jobs j
where e.job_id = j.job_id
group by j.job_id
order by num asc;

-- 等值链接结果是多个表的交集部分
-- 一般需要为表起别名

-- 非等值连接
select e.salary, j.grade_level
from job_grades j, employees e
where e.salary between j.lowest_sal and j.highest_sal;

-- 自连接
select e.employee_id, e.last_name, m.employee_id, m.last_name
from employees e, employees m
where e.manager_id = m.employee_id;


select last_name, departments.department_id, departments.department_name
from departments, employees
where departments.department_id = employees.department_id;

select emp.job_id, de.location_id
from employees emp, departments de
where emp.department_id = de.department_id
and emp.department_id = 90;

select emp.last_name, de.department_name, lo.location_id, lo.city
from locations lo, departments de, employees emp
where emp.commission_pct is not null 
and emp.department_id = de.department_id 
and de.location_id =  lo.location_id;

select emp.last_name, emp.job_id, emp.department_id, de.department_name
from employees emp, departments de, locations lo
where emp.department_id = de.department_id
and de.location_id = lo.location_id
and lo.city = 'Toronto';

select emp.department_id, dep.department_name,min(salary)
from employees emp, departments dep, jobs j
where emp.department_id = dep.department_id
and emp.job_id = j.job_id
group by emp.department_id;

select lo.country_id, count(dep.department_id)
from employees emp, departments dep, locations lo
where emp.department_id = dep.department_id
and lo.location_id = dep.location_id
group by lo.country_id
having count(dep.department_id) > 2;






