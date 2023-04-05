-- 日期函数
select now();

-- 仅返回日期
select curdate();
select curtime();
select year(now());
select month(now());
select monthname(now());

select str_to_date('1998-3-2','%Y-%c-%d');

select date_format(now(),'%y年%m月%d日');
-- 其他函数()

select version();

select database();

select user();




