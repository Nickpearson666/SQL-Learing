-- 存储过程和函数
-- 一组预先编辑好的SQL语句， 理解成批处理语句
-- 减少了变异次数，和数据库的连接次数， 提高了效率

-- 创建语法：
create procedure mypro(in name varchar(20))
begin
	
end
-- 参数三部分：参数模式，参数名， 参数类型
-- in:该参数可以作为输入 参数需要调用方传入
-- out：输出参数，参数作为返回值
-- inout： 该参数既可以作为输入， 也可以作为输出
-- 如果参数过程仅仅只有一句话， 则begin/end可以省略
-- 存储过程提的每条SQL结果必须有分号， 存储过程的结尾可以设置
-- delimiter 结束标记

-- 调用语法：
-- call name(实参);

-- 1.空参列表
-- 插入到admin表中五条记录
use girls;

delimiter $;
create procedure myp1()
begin
	insert into admin(username, `password`) 
    values('john', '0000'), ('lily', '0000'), ('jack', '0000'),
    ('tom', '0000');
end $;

call myp1();

use girls;
delimiter $;
create procedure myp2(in beautyName varchar(20))
begin
	select bo.*
    from boys bo
    right join beauty b
    on bo.id = b.boyfriend_id
    where b.`name` = beautyName;
end $;

call myp2('柳岩');

delete procedure if exists my3;
delimiter $;
create procedure my4(in username varchar(20), in password varchar(20))
begin
	declare result int default 0;
	select count(*) into result
    from admin
    where admin.username = username
    and admin.password = password;
    select if(result > 0, 'Succuess', 'Failed');
    -- select result;
end $;

call my4('john', 8888);

-- 创建带OUT模式的
delimiter $;
create procedure my5(in beautyName varchar(20), out boyName varchar(20))
begin
	select bo.boyName into boyName
    from boys bo
    inner join beauty b
    on bo.id = b.boyfriend_id
    where b.`name` = beautyName;
end $;


call my5('小昭', @bname);
select @bname$;

delimiter $;
create procedure getName(in beautyName varchar(20), 
out boyName varchar(20), out userCP int)
begin
	select bo.boyName, bo.userCP  into boyName, userCP
    from boys bo
    inner join beauty b 
    on bo.id = b.boyfriend_id
    where b.name = beautyName;
end;

call getName('小昭', @banme, @userCP);
select @banme, @userCP;

-- inout模式的参数
delimiter $;
create procedure myp8(inout a int, inout b int)
begin
	set a = a*2;
    set b = b*2;
end$;

set @n = 10;
set @m = 20;
call myp8(@n, @m);
select @n, @m;

delimiter $;
create procedure addUser2(in userName varchar(20), in userPass varchar(20))
begin
	insert into admin(admin.username, admin.password) 
    values(userName, userPass);
end$;

call addUser2('nick', '6666');

delimiter $;
create procedure findBeautyById(in id int, out name varchar(20), out tel varchar(20))
begin
	select beauty.name, beauty.phone into name, tel
    from beauty
    where beauty.id = id;
end$;

call findBeautyById(1, @a, @b);
select @a, @b;

delimiter $;
create procedure getDate2(in birth1 datetime , 
in birth2 datetime, out flag int)
begin
	select datediff(birth1, birth2) into flag;
end$;

call getDate2('1998-1-1', now(),  @res);
select @res;

-- 删除存储过程
drop procedure getDate2;
-- 查看存储过程
show create procedure getDate;

delimiter $;
create procedure covertDate(in mydate datetime, 
out formalDate varchar(50))
begin
	select date_format(mydate, '%YYear%Month%DDay') into formalDate;
end$;

call covertDate(now(), @str);


delimiter $;
create procedure getBoyName(in bname varchar(20), 
out str varchar(20))
begin 
	select concat(bname, 'and', boyname) into str
    from boys bo
    right join beauty b
    on b.boyfriend_id = bo.id
    where b.name = bname;
end $;

call getBoyName('柳岩', @str);
select @str;


drop procedure getPage;
delimiter $;
create procedure getPage(in startIdx int, in size int)
begin
	select *
    from  beauty
    limit startIdx, size;
end$;

call getPage(3, 5);
