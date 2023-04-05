-- 排序查询
-- asc 升序
-- desc 降序

select *
from employees
order by salary desc;

select *
from employees
where department_id>=90
order by hiredate asc;

select *, salary*12*(1+ifnull(commission_pct, 0)) output
from employees
order by salary*12*(1+ifnull(commission_pct, 0)) desc;

select *, salary*12*(1+ifnull(commission_pct, 0)) output
from employees
order by output desc;

select length(first_name), salary
from employees
order by length(first_name) desc;

select *
from employees
order by salary asc, employee_id desc

-- order by 子句一般放在查询语句的最后面， limit子句除外

select first_name, last_name
from employees
order by salary*12*(1+ifnull(commission_pct, 0)) desc, first_name asc;

select *
from employees
where salary not between 8000 and 17000
order by salary desc;

select *
from employees
where email like '%e%'
order by length(email) desc, employee_id asc;

