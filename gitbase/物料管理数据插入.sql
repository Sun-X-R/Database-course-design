/*==================================*/
---数据插入
/*==================================*/
use 物料管理
insert into 部门表(部门名,部门编号)
values('营销部','Y1000'),
('产品部','C100')
go

insert into 仓库表(仓库编号)
values('A0001’),
('A0002'),
('A0003')
go

insert into 物料表(物料编号,物料名,规格,数量,仓库编号)
values('A202104160000','主板','IBM00000001',100,'A0001'),
('A202104160001','内存条','IBM00000001',100,'A0001'),
('A202104160002','显卡','IBM00000001',100,'A0001')
go

insert into 仓库管理员表(管理员姓名,管理员编号)
values('张三','Y01814000'),
('李四','Y01814001')

insert into 员工表(姓名,员工编号,电话,出生日期,入职年份,职位,部门编号,性别)
values('张三','Y01814000','18116801102',2000-5-10,2020-4-01,'管理','Y1000','男')