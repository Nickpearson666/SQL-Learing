-- 常见函数
-- 1. 字符函数
-- length() 获取字节数
-- concat() 拼接字符串
-- upper() 转大写
-- lower() 转小写

select concat(upper(first_name), lower(last_name)) name
from employees;

-- substr() 截取字符串 idx --> from 1
-- idx1 + len 从指定索引处+len
select substr('123456789', 2, 3);

select concat(substr(first_name, 1, 1), '_', lower(substr(first_name, 2))) `Name`
from employees;

-- instr() 返回子串在主串中第一次出现的索引
select trim('     HHHH    ');

select trim('a' from 'aaaaaaaaHHHHaaaaaaaaaaaaa');
-- 指定长度的左填充
select lpad('abcd', 10, '*');

select rpad('abcd', 12, '*');

select replace('aaaa', 'a', 'b');

