-- 流程控制函数
select if(10 < 5 , 'BIG', 'SMALL');

select last_name, commission_pct,
if(commission_pct is null, 'BAD', 'GOOD') output
from employees;

-- case when then else;
select last_name, salary, department_id, 
case department_id
when 30 then salary*1.1
when 40 then salary*1.2
when 50 then salary*1.3
else salary
end as newSalary
from employees;

select salary,
case
when salary>20000 then 'A'
when salary>15000 then 'B'
when salary>10000 then 'C'
else 'D'
end as `level`
from employees;

select employee_id, first_name, salary*(1.2) as newSal
from employees;

select first_name, length(first_name)
from employees
order by first_name asc;

select concat(last_name, ' earns ', salary, ' monthly but wants ', salary*3)
from employees;

select first_name, job_id,
case job_id
when 'AD_PRES' then 'A'
when 'ST_MAN' then 'B'
when 'IT_PROG' then 'C'
else 'F'
end as degree
from employees;