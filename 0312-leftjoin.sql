-- 外连接
-- 用于查询一个表中有, 另一个表中没有的记录
-- 外连接的查询结果是主表的所有记录
-- 如果从表中有和它匹配的， 则显示匹配的值， 如果从表中没有
-- 则显示null
-- left join 左边主表， right join 右边主表
use girls;
select beauty.name
from beauty
left outer join boys
on beauty.boyfriend_id = boys.id
where boys.id is null;


use girls;
select beauty.name
from boys
right outer join beauty
on beauty.boyfriend_id = boys.id
where boys.id is null;

use myemployees;

select dep.department_name, emp.department_id
from departments dep
left outer join employees emp
on emp.department_id = dep.department_id
where emp.department_id is null;

-- 交叉连接是笛卡尔乘机

use girls;
select boys.*
from beauty
left join boys
on beauty.boyfriend_id = boys.id
where beauty.id > 3;

use myemployees;
select city
from locations lo
left join departments dep
on dep.location_id  = lo.location_id
where dep.location_id is null;

select emp.*, dep.department_name
from employees emp
left join departments dep
on emp.department_id = dep.department_id
where dep.department_name in ('SAL', 'IT');

