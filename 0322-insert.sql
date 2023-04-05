-- DML
-- 数据操作语言
-- insert
-- update
-- delete


-- insert into 表名（列名，...）values();
-- 1.插入的值要一致

use girls;
insert into beauty(id, name, sex, borndate, phone, photo, boyfriend_id)
values(13, 'Beth', '女', '1990-4-13', '11111111111', null, 0);

-- 可以为空的列
-- 1. null
-- 2.插入时， 不写对应的列明

insert into beauty(id, name, sex, borndate, phone, boyfriend_id)
values(14, 'Beth2', '女', '1990-4-13', '11111111111', 0);

-- 列的顺序可以置换
-- 列数和值必须一致
insert into beauty(name, id, sex, borndate, phone, boyfriend_id)
values('Beth2', 15,  '女', '1990-4-13', '11111111111', 0);

-- 省略列名时， 默认所有列明，且顺序一致

-- insert into table
-- set key=value

insert into beauty
set id = 19, name = 'Alica', phone = '999';

-- values支持插入多行数据
insert into beauty
values(20, 'Beth', '女', '1990-4-13', '11111111111', null, 0), 
(21, 'Bob', '女', '1990-4-13', '11111111111', null, 0),
(22, 'Tom', '女', '1990-4-13', '11111111111', null, 0);

-- values 支持子查询
-- insert into beauty
-- select ;

