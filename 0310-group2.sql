-- group by 子句支持单个字段分局， 多个字段分组
-- 也支持表达式和函数
-- 同时也支持排序

select count(*) num, length(last_name) len
from employees
group by length(last_name)
having num >=5;

select avg(salary), job_id, department_id
from employees
group by job_id, department_id
order by avg(salary) desc;

select max(salary), min(salary), job_id
from employees
group by job_id
order by job_id asc;

select max(salary)- min(salary) DIFF
from employees;

select min(salary) minsa
from employees
where manager_id is not null
group by manager_id
having minsa > 6000;

select department_id, count(*) num, avg(salary) sa
from employees
group by department_id
order by sa asc;


 


