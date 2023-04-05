-- 数据定义语言
-- 库的管理
-- 创建修改删除
-- 表的管理
-- 创建修改删除
-- create/alter/drop

create database if not exists phone;

-- alter database phones character set UTF
use phone;
create table QTPhone(
	Origin varchar(20),
    Destination varchar(20),
    Rate double
);
show tables;
desc QTPhone;
insert into QTPhone
values('017', '011', '2.70');

delete from QTPhone
where Rate = 2.7;

create table book(
	id int,
    bName varchar(20),
    price double,
    authorId int,
    publishDate datetime
);

-- 表的修改
-- 修改列名
alter table  book change column pubdata publishDate datetime;
desc book;
-- 修改列的约束
alter table book modify column publishDate timestamp;
desc book;
-- 添加新列
alter table book add column annual double;
-- 删除列
alter table book drop column annual;
-- 修改表名
alter table book rename to mybook;
desc mybook;




