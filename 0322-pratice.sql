use myemployees;
select last_name, salary
from employees
order by salary asc
limit 1;

select dep.*, avg(emp.salary) avgSal
from departments dep
inner join employees emp
on dep.department_id = emp.department_id
group by department_id
order by avgSal
limit 1;

select j.*, round(avg(emp.salary), 2) avgSal
from employees emp
inner join jobs j
on j.job_id = emp.job_id
group by job_id
order by avgSal desc
limit 1;

select round(avg(emp.salary), 2) avgSal
from employees emp
group by emp.department_id
having avgSal > (
	select round(avg(emp.salary), 2)
	from employees emp
);

select distinct man.*
from employees emp
inner join employees man
on emp.manager_id = man.employee_id;

select max(emp.salary) maxSal, dep.*
from employees emp
inner join departments dep
on emp.department_id = dep.department_id
group by emp.department_id
order by maxSal
limit 1;

select distinct man.*
from employees emp
inner join employees man
where emp.manager_id = man.employee_id
and man.department_id = (
	select emp.department_id
    from employees emp
	group by emp.department_id
	order by avg(emp.salary) desc
	limit 1
);










