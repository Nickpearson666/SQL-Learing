create table Book(
	 bid int primary key,
     bname varchar(20) unique not null,
     price float default 10,
     btype int,
     
     constraint fk foreign key(btype) references bookType(id)
     
);

set autocommit = 0;
start transaction;
insert into book
values(1, '小李飞刀', 100, 1);
commit;

create view mybook
as
select *
from Book
where Book.price >= 100;

create or replace view mybook
as 
select *
from Book
where Book.price >= 100;

drop view mybook;


-- 变量
-- 系统变量
-- 	全局变量：
-- 	会话变量：
-- 自定义变量
-- 	用户变量：
-- 	局部变量：
-- 系统变量：
-- 不属于用户定义， 属于服务器层面
-- 1.查看系统变量
-- show global/session variables;
-- 2.查看部分满足条件的变量
-- show global/session variables like;
-- 3.查看指定某个系统变量的值
-- select @@global/session 
-- 4.为某个系统变量复制
-- set global | session var = val;

-- 方式二：
-- set global | session.var = val;

show global variables;
show session variables;

select @@global.autocommit;

set @@global.autocommit = 0;
-- 全局变量
-- 再重启范围内，更改全局变量

-- 会话变量
-- 作用域：
-- 仅仅针对于当前会话连接有效

show session variables;
show session variables like '%char%';
show session variables like '%isolation%';

select @@session.tx_isolation;


-- 自定义变量
-- 声明、赋值、使用
-- 1. 用户变量 针对连接/会话生效
set @nnick := 'cj';
set @num = 100;

select count(*) into @num
from employees;
select @num;

-- 局部变量
-- 仅仅定义在begin end中 首行
-- declare 变量名 类型 default 值
select @m = 1;
select @n = 2;
set @sum = @m + @n;
select @num;

-- declare int a int default 1;


