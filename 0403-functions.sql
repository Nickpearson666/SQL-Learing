-- 函数
-- 类似于存储过程
-- 存储过程
-- 适合做批量的插入， 修改更新
-- 函数有且只有一个返回
-- 函数适合处理返回后，返回一个结果

-- create function name(parameters) returns 返回类型
-- begin
-- 函数体
-- end
-- 注意：
-- 参数列表包含两部分
-- 参数名 参数列表
-- 函数体
-- 肯定会有return语句
-- 当函数体内只有一句话时，可以省略begin end语句
-- 使用delimeter语句设置结束标记

use myemployees;

SET GLOBAL log_bin_trust_function_creators = 1;
delimiter $
create function myf1() returns int
begin
	declare c int default 0;
	select count(*) into c
    from employees;
    return c;
end$

delimiter $
create function myf2() returns int
begin
	set @c = 0;
	select count(*) into @c
    from employees;
    return @c;
end$

select myf2();

-- 根据员工名返回工资
delimiter $
create function getSalByName(empName varchar(20)) returns double
begin
	set @c = 0; -- 定义用户变量
	select salary into @c -- 赋值
    from employees
    where employees.last_name = empName;
    return @c;
end$

select getSalByName('Kochhar');


根据部门名，返回部门的平均工资
delimiter $
create function getAvgSal(depName varchar(20)) returns double
begin
	set @sal = 0;
    select avg(salary) into @sal
	from employees emp
	inner join departments dep
	on emp.department_id = dep.department_id
	where department_name = depName;
    return @sal;
end $
select getAvgSal('IT')$

-- 查看函数
show create function getAvgSal;

-- 删除函数
drop function myfun3;

delimiter $
create function getSum(a int, b int) returns int
begin
	set @res = 0;
    set @res = a + b;
    return @res;
end $

select getSum(10, 20);