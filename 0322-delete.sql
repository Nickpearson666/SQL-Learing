-- 删除
-- delete 
-- truncate

delete from beauty
where phone like '%9';

delete beauty.* from beauty
inner join boys 
on beauty.boyfriend_id = boys.id
where beauty.boyfriend_id =2;

-- truncate 整表删除
1.delete 可以加where条件， truncate不支持
2.truncate删除 效率高一些
3.对于自增长列的idx, delete from 断点， truncate from 1
4.truncate删除没有返回值,delete 有返回值
5.truncate删除不能回滚，delete删除可以回滚


