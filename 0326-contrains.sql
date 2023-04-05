-- 常见约束
-- 含义， 一种限制，用于限制表中的数据，保证表中的数据的准确性和可靠性
/*分类：
not null: 非空， 用于保证该字段的值不能为空
比如姓名， 学号等
default: 该字段有默认值， 比如性别
primary key: 主键， 该字段的值具有唯一性， 并且非空
unique: 唯一约束， 该字段的值 具有唯一性 可以为空， 比如座位号
check 检查约束
foreign key： 外键， 限制两个表的关系， 用于保证该字段的值必须来自主表的关联列的值
在从表添加外键约束，用于限制主表中某列的值
比如学生的专业编号，员工的部门编号， 工种编号
添加约束的时机
1.创建表时
2.修改表
添加方式：
1.列级约束
都支持，但是外键约束无效
2.表级约束
除了非空， 默认都支持
*/

create database students;
use students;

create table major (
	id int primary key,
    majorName varchar(20)
);

desc major;

create table stuinfo(
	id int primary key,
    stuName varchar(20) not null,
    gender char(10) check(gender='female' or  gender='male'),
    seat int unique,
    age int default 18,
    majorId int,
    -- 外键使用表约束
	constraint fk_majorId  foreign key (majorId) references major(id)
);
show index from stuinfo;

/*主键和Unique
主键一个表中只能有一个且不能为空， 可以用两个列实现组合主键
primary key(key1, key2);
unique可以为空 可以有多个
*/

-- 外键
-- 1. 从表中设置外键关系
-- 2. 从表的外键列的类型和主表的关联列要求一致或者兼容， 名称无要求
-- 3. 主表的关联列必须是一个key(一般是主键或者唯一)
-- 插入数据时，先插入主表，在插入从表， 先删除从表，再删除主表

-- 修改表时添加的约束
alter table stuinfo modify column stuname varchar(25) not null;
alter table stuinfo add primary key(id);
desc stuinfo;

-- 删除约束
alter table stuinfo modify column stuname varchar(25);

 alter table stuinfo modify column majorId int;
 
alter table stuinfo drop foreign key fk_majorId;

alter table emp2 add constraint pk_id primary key (id);
alter table emp2 modify column id int primary key;

alter table emp2 add column dep_id int;
alter table emp2 add constraint fk_id foreign key(dep_id) references dep2(id);

-- 列级约束写在列的后面
-- 表级约束写在所有列的下面，需要显示的用括号注明哪一个列

drop table if exists tab_identity;
create table tab_identity(
	id int primary key auto_increment,
    name varchar(20)
);

show variables like '%auto_increment%';
-- 可以通过设置系统变量来改变默认初始值以及步长

-- 标识列
-- 标识列需要和key搭配使用， pkm fk, unique
-- 表中只可以有1个标识列
-- 标识列的类型只能是数值型
-- 可以通过设置系统变量来改变默认初始值以及步长
-- 修改时新增标识列
alter table tab_identity modify column id int primary key auto_increment;
-- 修改时删除标识列
alter table tab_identity modify column id int primary key;





