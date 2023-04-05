-- 流程控制结构
-- 顺序/分支/循环
-- select if(1, 2, 3);
-- 类似于三目表达
-- switch类型的语句， 实现等值判断
-- case 变量|表达式|字段
-- when 值 then
-- else 默认值
-- end
-- 多重if语句， 一般用于实现区间判断
-- case 
-- when 要判断的条件 then 
-- else 默认值
-- end
-- 可以作为表达式，嵌套在其他与语句中使用, 结束需要显示ene case
-- 作为独立的语句使用，只能放在begin end中
-- 如果没有匹配的条件，则返回null

-- 创建存储过程， 根据存入的成绩，来显示等级
delimiter $;
create procedure test_case(in score int)
begin
	case
    when score >= 90 then select 'A';
    when score >= 80 then select 'A';
    when score >= 60 then select 'C';
    else select 'D';
    end case;
end$;

call test_case(56);

-- if结构
-- 实现多重分支
-- 语法：
-- if 1 then 语句1
-- elseif 2 then 语句2
-- else n
-- end if;
-- 只能在begin/end中

delimiter $;
create function test_if(score int) returns char
begin
	if score >= 90 and score <= 100 then return 'A';
    elseif score >=80 then return  'B';
    elseif score >= 60 then return 'C';
    else return 'D';
    end if;
end$;

-- select test_if(86);
-- 循环
-- while/loop/repeat
-- iterate 类似于continue, 
-- leave 类似于 break;

-- 1. while
-- [标签] while 循环条件 do
-- end while [标签]

-- 2. loop
-- [标签] loop
-- end loop [标签]
-- 可以用来模拟简单的死循环

-- 3. repeat
-- [标签] repeat
-- 	循环体；
-- until 结束循环的条件
-- end repeat;

-- 案例： 批量参数
use girls;
delimiter $;
create procedure pro_while1(in insertCnt int)
begin
	declare i int default 1;
    while i <= insertCnt do
		insert into admin(username, `password`)
        values('John', 7777);
        set i = i + 1;
    end while;
end$;


call pro_while1(3);

use girls;
delimiter $;
create procedure pro_while2(in insertCnt int)
begin
	declare i int default 1;
    a: while i <= insertCnt do
		insert into admin(username, `password`)
        values('JohnKKK', 7777);
        if i>= 20 then leave a;
        end if;
        set i = i + 1;
    end while a;
end$;

call pro_while2(50);

drop procedure pro_while3;
delimiter $;
create procedure pro_while3(in insertCnt int)
begin
	declare i int default 1;
    a: while i <= insertCnt do
        set i = i + 1;
		if mod(i,2) != 0 then iterate a;
        end if;
		insert into admin(username, `password`)
        values(concat('JohnPPP', i), 7777);
    end while a;
end$;

call pro_while3(20);

drop table if exists stringcontent;
create table stringcontent(
	id int primary key auto_increment,
    content varchar(20)
);

delimiter $;
create procedure test_insert2(in inCnt int)
begin
	declare i int default 1;
    declare str varchar(26) default 'abcd';
    declare startIdx int default  1;
    declare len int default 1;
    while i <= inCnt do
        set startIdx = floor(rand()*4 + 1);
        set len = floor(rand() * (4-startIdx+1)+1);
        insert into stringcontent(content)
        values(substr(str, startIdx, len));
		set i = i+1; 
    end while;
end$;

call test_insert2(5);
select * from stringcontent;


