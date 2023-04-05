-- DQL 数据查询语言 Query
-- DML 数据操控语言 Manipulation 删除 修改 更新 插入
-- DDL 数据定义语言 Define 库和表的管理
-- TCdepartmentsL 事务控制语言 事务和事务的处理
-- 执行sql脚本
--  source C:\Users\weichangjiang\Desktop\SQL\myemployees.sql

-- #基础查询
-- select 查询列表
-- from 表明
-- 特点：
-- 1.查询列表可以是：表中的字段， 常量值， 表达式， 函数
-- 2.查询的结果是一个虚拟的表格
use myemployees;
select last_name from employees;

select version();
-- 起别名
-- 1.用as
-- 2.用空格
-- 3.如果别名有关键字重复 需要用双引号
select last_name as lastName From employees;

select last_name  `lastName111` From employees;
-- 去重 

select distinct department_id from employees;

-- mysql中的+仅仅是运算符
-- select '123' + 90;
-- 如果转换失败，字符换=0

select concat(last_name, ' ', first_name) Name
from employees;

-- //查询表字段
desc employees;

select concat(first_name, ',', last_name, ifnull(commission_pct, 0)) as output
from employees;


