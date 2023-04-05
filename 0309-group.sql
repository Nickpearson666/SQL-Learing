-- 分组函数
-- sum avg max min count

select sum(salary)
from employees;

select avg(salary)
from employees;

select min(salary)
from employees;

select max(salary)
from employees;

select count(salary), max(salary), min(salary)
from employees;

-- 使用数值型参数

-- sum, avg, min, max忽略null值

-- 和distinct搭配
select sum(distinct salary)
from employees;

select count(2)
from employees;

-- 和分组函数一同查询的字段有限制
-- 要求是group by 的字段

select count(*)
from employees
where department_id = 90;

select datediff(now(), '1996-12-20');

-- 分组查询
select avg(salary) sa, department_id
from employees
group by department_id
order by sa;

select max(salary) sa, job_id
from employees
group by job_id
order by sa;

select count(*), location_id
from  departments
group by location_id;
 
select avg(salary) sa, department_id
from employees
where email like '%a%'
group by department_id;

select max(salary), manager_id
from employees
where commission_pct is not null
group by manager_id;


-- 分组后的筛选用having
select count(*) num, department_id
from employees
group by department_id
having num > 2;

select job_id, max(salary) maxsa
from employees
where commission_pct is not null
group by job_id
having maxsa > 12000;

select min(salary) minsa, manager_id
from employees
where manager_id > 120
group by manager_id
having minsa > 5000;

-- 分组前筛选 原始表 where groupby 前面 效率高
-- 分组后筛选 分组后的结果集 having groupby 后面





