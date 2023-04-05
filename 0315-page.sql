-- 分页查询
-- limit offset, size 查询语句的最后
-- offset 显示条目的起始索引 0开始
-- size 要显示的条目个数
-- limit (page-1)*size, size
-- size = 10
-- 1---->0
-- 2---->10
-- 3---->20

select *
from employees
limit 0, 5;

select *
from employees
limit 10, 15;



