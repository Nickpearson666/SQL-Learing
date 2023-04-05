-- 修改表的记录
-- 语法：
-- update table
-- set key = value
-- where 

use girls;
SET SQL_SAFE_UPDATES = 0;
update beauty
set phone = '135'
where name like '%Beth%';

update boys
set boyname = "张飞", userCp = 100
where id = 2;

-- 修改多表
-- update table1, table2
-- set key = value
-- where 连接条件
-- and 筛选条件

update beauty b
inner join boys bo
on b.boyfriend_id = bo.id
set b.phone = '114'
where bo.boyName = "张无忌";

update beauty b
left join boys bo
on b.boyfriend_id = bo.id
set b.boyfriend_id = 2
where b.boyfriend_id is null or b.boyfriend_id = 0;




