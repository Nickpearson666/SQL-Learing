-- select后的子查询
select dep.*, (
	select count(*)
    from employees emp
    where emp.department_id = dep.department_id
) NUM
from departments dep;

-- from后面的子查询
-- 将子查询的结果充当一张表，要求必须起别名
select ag_dep.*, j.grade_level
from (
	select round(avg(salary), 2) sal, department_id
	from employees
	group by department_id
) ag_dep 
inner join job_grades j
on ag_dep.sal between j.lowest_sal and j.highest_sal;

-- exists后面（相关子查询）
-- exists(子查询) 有结果返回1 否则0

select *
from departments d
where exists(
	select *
    from employees e
    where d.department_id = e.department_id
);

use girls;
select b.boyName
from boys b
where not exists(
	select *
    from beauty
    where beauty.boyfriend_id = b.id
);

use myemployees;
select *
from employees
where employees.department_id = (
	select department_id
	from employees
	where last_name = 'Zlotkey'
);

select *
from employees
where employees.salary > (
	select round(avg(salary), 2)
	from employees
);

select employee_id, last_name, salary
from employees e
inner join (
	select avg(salary) ag, department_id
    from employees emp
    group by emp.department_id
) ag_dep
on e.department_id = ag_dep.department_id
and e.salary > ag_dep.ag;

select * 
from employees
where department_id in(
	select distinct department_id
	from employees
	where employees.last_name like '%u%'
);


select *
from employees
where employees.department_id in(
	select department_id
	from departments
	where location_id = 1700
);






