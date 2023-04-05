-- union联合查询
-- 将多条查询语句的结果合并成一个结果
-- 应用场景：
-- 多张表一个结果集， 查询的结果来自多张表，没有连接关系
-- 查询的信息一致
-- 重复结果会自动去重， 不去重用all

select * 
from employees
where email like '%a%'
union 
select * 
from employees
where department_id > 90;