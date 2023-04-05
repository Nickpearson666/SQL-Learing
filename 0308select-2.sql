-- 条件查询
/*
select 查询列表
from  表
where 筛选条件
1. 按照条件表达式筛选 <> !=
2. 按照逻辑表达式筛选 && || ! and or not 
3. 模糊查询 like between and  in is null
*/
use myemployees;
select salary
from employees
where employees.salary > 12000;

select first_name `name`, department_id dep
from employees
where employees.department_id <> 90;

select first_name `name`, department_id dep
from employees
where employees.salary >= 10000 and employees.salary <= 20000;


select first_name `name`, department_id dep
from employees
where not(department_id >= 90 and  department_id <= 110) or salary > 15000;

-- %任意多个字符
-- _任意单个字符
select first_name `name`
from employees
where employees.first_name like '%a%';

select first_name `name`
from employees
where employees.first_name like '__e_a%';

-- 查询员工名中第二个字符为_的员工名 转义
select first_name `name`
from employees
where employees.first_name like '_$_%' escape '$';

-- 1.使用between and 闭区间 提升简洁性
-- 2. 顺序有关系，
select *
from employees
where employee_id between 100 and 120;

-- in 用于判断某字段的值是否属于in列表中的某一项
-- in 列表类型的值需要统一
-- 不支持% / _ 通配符
select last_name, job_id
from employees
where job_id in ('IT_PROg', 'AD_VP', 'AD_PRES');

-- 判断值为null 用is null
select *
from employees
where commission_pct is null;

-- 安全等于 可读性差
select *
from employees
where commission_pct <=> null;

-- is null 仅仅可以判断null值 
-- <=> 判断null 以及普通值 可读性差

select last_name, department_id, salary*12*(1+IFNULL(commission_pct, 0)) output
from employees;

select last_name, salary
from employees
where commission_pct is null and salary <= 18000;

select *
from employees
where job_id <> 'IT_PROG' or salary = 12000;

desc departments;

select distinct location_id
from departments;

-- DBMS --> 数据库管理系统， 创建和管理DB
-- SQL：结构化查询语言
-- isnull 函数 是null返回1 否则返回0







