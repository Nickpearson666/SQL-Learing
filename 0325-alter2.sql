-- 表的删除
-- drop table ...
-- drop table if exists ...

-- 表的创建
create table if not exists author(
 id int,
 au_name varchar(20),
 nation varchar(10)
);

-- 通用的写法
drop database if exists author;
create table if not exists author(
 id int,
 au_name varchar(20),
 nation varchar(10)
);

-- 表的复制
-- 复制表的结构：
create table copy like author;
-- 复制表的数据
create table copy2
select * from author;


use test;
drop table dept1;
create table if not exists dept1(
	id int(7),
    name varchar(25)
);

create table dept2
select department_id, department_name
from myemployees.departments;

alter table dept2 change column department_name department_name varchar(50);
desc dept2;

create table dep3
like dept2;

drop table dep3;
desc dep3;

alter table dep3 rename to dep31;
alter table dep3 add column test_c int;
desc dep3;

alter table emp5 drop column dep_id;


