-- 事务
show engines;
/*
innodb 支持事务，myisam, memory 不支持事务
事务的特点：
1.原子性：事务中的操作要么发生， 要么不发生
2.一致性：数据库从一个一致性状态转换到另一个一致性状态
3.隔离性：事务的执行不被其他事务干扰
4.持久性：事务被提交之后， 对数据库的数据的影响是永久性的

事务的创建
隐式事务， 没有明显的开始和结束标记
比如 insert/update/delete

显示事务，事务具有明显的开始和结束的标志
前提必须设置自动提交功能为禁用
*/
show variables like '%autocommit%';
set autocommit = 0;
start transaction;
update major
set id = 9
where major.majorName = 'KKKK';
commit;
rollback;

set autocommit = 0;
start transaction;
update account 
set balance = 500 
where username = 'KKK';
update account 
set balance = 1500 
where username = 'AAA';
commit;

-- delete 和 truncate 区别
-- delete 支持 rollback
-- truncate 不支持 

/*
数据库的隔离机制
脏读 事务T1读取了事务T2还没有commit的数据
不可重复读 同一事务中，事务T1前后读取的数据不一致
幻读 事务T1读取字段， T2插入一些数据，导致字段值改变，T1再次读取发现不一致

默认的事务隔离级别
repeatable read
*/

-- 事务的隔离级别
-- 1.read committed 脏读 幻读 不可重复读
-- 2.read committed 幻读 不可重复读
-- 3.repeatable 幻读
-- 4.serializable 隔离级别最高
