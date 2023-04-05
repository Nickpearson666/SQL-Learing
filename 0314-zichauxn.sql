-- 子查询
-- 出现在其他语句中的select语句， 成为子查询或内查询
-- 外部的查询语句， 成为主查询或外查询
-- 分类：
-- 按照子查询出现的位置：
-- select后面：
-- 仅支持标量子查询
-- from:
-- 支持表子查询
-- where or having:
-- 标量子查询/列子查询/行子查询
-- exists:
-- 列子查询

-- 按结果集的行列数不同：
-- 标量子查询： 一行一列
-- 列子查询：一列多行
-- 行子查询：一行多列
-- 表子查询：多行多列


-- where/having 后面
-- 1.标量子查询（单行子查询）
-- 2.列子查询（多行子查询）
-- 3.行子查询（多列多行）

-- 特点：
-- 标量子查询， 搭配单行操作符使用
-- >= <= > < <>
-- 列子查询， 搭配多行操作符使用
-- in, any/some, all

select * 
from employees
where salary > (
	select salary
	from employees
	where last_name = 'Abel'
);

select * 
from employees
where job_id = (
	select job_id
	from employees
	where employee_id = 141
)
and salary > (
	select salary
	from employees
	where employee_id = 143
);

select *
from employees
where salary = (
	select min(salary)
	from employees
);
select min(salary) sal, department_id depID
from employees
group by department_id
having sal > 
( 
	select min(salary) sal
	from employees
	group by department_id
    having department_id = 50
);


-- 子查询优先执行
-- 列子查询

-- in/not in
-- any/some
-- all

select *
from employees
where department_id in (
	select department_id depID
	from departments dep
	where dep.location_id in (1400, 1700)
);

select * 
from employees
where salary < any(
	select salary
	from employees
	where job_id = 'IT_PROG'
);

select * 
from employees
where salary < all(
	select salary
	from employees
	where job_id = 'IT_PROG'
);
-- 行子查询
select min(employee_id)
from employees;

select max(salary)
from employees;

select *
from employees
where (employee_id, salary) = (
	select min(employee_id), max(salary)
    from employees
);



