-- 整形
-- tinyint/smallint/mediumint/int/ bigint/
-- 范围不同
-- desc dept2;
-- 特点：
-- 1.不设置无符号还是有符号，默认是有符号 无符号unsigned

-- 小数
-- 浮点型
-- float(m,d)
-- double(m,d)
-- 定点型
-- dec(M, D)
-- decimal(M,D)
-- M&D
-- d小数点后的位数
-- M = 小数+整数一起
create table tab_float(
	f1 float(5, 2),
    f2 float(5, 2),
    f3 decimal(5, 2)
);

insert into tab_float values(123.45, 123.777878, 123.1);
select * from tab_float;
-- 定点型精度较高
-- 原则：
-- 所选择的类型越简单越好, 能保存数值的越小越好 为了保存空间
字符型
较短的文本：
char 无论文本长度多长，固定M字符 china char(10) -> 10 效率高
varchar 动态开辟字符长度 china varchar(10) -> 5 效率低

较长的文本：
text
blob
create table tab_char(
	c1 enum('a'. 'b', 'c')
    s1 set('a'. 'b', 'c')
)

日期型
datetime 1000-01-01 00:00:00 当地时区
timestamp 1970010108001 和实际时区有关

show variables like 'time_zone';





