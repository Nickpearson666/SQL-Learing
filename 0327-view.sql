-- 视图
-- 虚拟表，和普通表一样使用
-- 多个查询结果使用相同的SQL语句
-- 重现SQL语句
use students;
create view v1
as
select stuname, majorname
from stuinfo
inner join major
on stuinfo.majorId = major.id;

select * from v1;

use myemployees;
-- create view 
-- as

create view myv1
as 
select emp.last_name, dep.department_name, jo.job_title
from employees emp
inner join departments dep
inner join jobs jo
on emp.department_id = dep.department_id
and emp.job_id = jo.job_id;

select * 
from myv1
where last_name like '%a%';

create view myv2
as
select avg(salary) agSal, department_id
from employees
group by department_id
order by agSal;

select myv2.agSal, job_grades.grade_level
from myv2
inner join job_grades
on myv2.agSal between job_grades.lowest_sal 
and job_grades.highest_sal;

-- 视图的修改
-- create or replace view 视图名
-- as

create or replace view myv3
as
select avg(salary), job_id
from employees
group by job_id;

-- 方式二
-- alter view myv3

-- 删除视图
drop view myv3;

-- 查看视图
show create view myv3;

create view emp_v1
as 
select emp.last_name, emp.salary, dep.department_id
from employees emp
inner join departments dep
on emp.department_id = dep.department_id;

select * 
from emp_v1
where emp_v1.last_name like '%a%';

create or replace view emp_v2
as
select max(emp.salary) maxSa, departments.*
from employees emp
inner join departments 
on emp.department_id = departments.department_id
group by emp.department_id;

select *
from emp_v2
where emp_v2.maxSa >= 12000;

-- 视图的更新
create or replace view myv4
as
select last_name, email, salary*12*(1+ifnull(commission_pct, 0)) annual
from employees;

select * from myv4;
insert into myv4 
values("KKK", 'FAFA', '101010101');

update myv4
set last_name = 'KKK'
where last_name = '';

-- 对视图的修改会同时修改主表
-- 视图不占用实际的物理空间



