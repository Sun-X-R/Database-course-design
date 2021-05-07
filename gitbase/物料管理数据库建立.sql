/*===============================================*/
--建立数据库
/*===============================================*/
--create database 物料管理


use 物料管理



if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('出入库表') and o.name = 'FK_出入库表_REFERENCE_物料表')
alter table 出入库表
   drop constraint FK_出入库表_REFERENCE_物料表
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('出入库表') and o.name = 'FK_出入库表_REFERENCE_仓库管理员表')
alter table 出入库表
   drop constraint FK_出入库表_REFERENCE_仓库管理员表
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('员工表') and o.name = 'FK_员工表_REFERENCE_部门表')
alter table 员工表
   drop constraint FK_员工表_REFERENCE_部门表
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('物料表') and o.name = 'FK_物料表_REFERENCE_仓库表')
alter table 物料表
   drop constraint FK_物料表_REFERENCE_仓库表
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('转仓表') and o.name = 'FK_转仓表_REFERENCE_物料表')
alter table 转仓表
   drop constraint FK_转仓表_REFERENCE_物料表
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('转仓表') and o.name = 'FK_转仓表_REFERENCE_仓库管理员表')
alter table 转仓表
   drop constraint FK_转仓表_REFERENCE_仓库管理员表
go

if exists (select 1
            from  sysobjects
           where  id = object_id('仓库管理员表')
            and   type = 'U')
   drop table 仓库管理员表
go

if exists (select 1
            from  sysobjects
           where  id = object_id('仓库表')
            and   type = 'U')
   drop table 仓库表
go

if exists (select 1
            from  sysobjects
           where  id = object_id('出入库表')
            and   type = 'U')
   drop table 出入库表
go

if exists (select 1
            from  sysobjects
           where  id = object_id('员工表')
            and   type = 'U')
   drop table 员工表
go

if exists (select 1
            from  sysobjects
           where  id = object_id('物料表')
            and   type = 'U')
   drop table 物料表
go

if exists (select 1
            from  sysobjects
           where  id = object_id('转仓表')
            and   type = 'U')
   drop table 转仓表
go

if exists (select 1
            from  sysobjects
           where  id = object_id('部门表')
            and   type = 'U')
   drop table 部门表
go

/*==============================================================*/
/* Table: 仓库管理员表                                                */
/*==============================================================*/
create table 仓库管理员表 (
   管理员编号                char(18)             not null,
   管理员姓名                char(18)             null,
   constraint PK_仓库管理员表 primary key (管理员编号)
)
go

/*==============================================================*/
/* Table: 仓库表                                                   */
/*==============================================================*/
create table 仓库表 (
   仓库编号                 char(5)              not null,
   constraint PK_仓库表 primary key (仓库编号)
)
go

/*==============================================================*/
/* Table: 出入库表                                                  */
/*==============================================================*/
create table 出入库表 (
   物料编号                 char(18)             not null,
   管理员编号                char(18)             not null,
   仓库编号                 char(5)              not null,
   动作编号                 char(18)             not null,
   出入数量                 int                  null,
   constraint PK_出入库表 primary key (动作编号)
)
go

/*==============================================================*/
/* Table: 员工表                                                   */
/*==============================================================*/
create table 员工表 (
   姓名                   char(5)              null,
   员工编号                 char(18)             not null,
   电话                   char(11)             null,
   出生日期                 datetime             null,
   入职年份                 datetime             null,
   职位                   char(5)              null,
   部门编号                 char(8)              null,
   性别                   char(2)              null,
   constraint PK_员工表 primary key (员工编号)
)
go

/*==============================================================*/
/* Table: 物料表                                                   */
/*==============================================================*/
create table 物料表 (
   物料编号                 char(18)             not null,
   物料名                  char(18)             null,
   规格                   char(18)             null,
   数量                   int                  null,
   仓库编号                 char(5)              not null,
   constraint PK_物料表 primary key (物料编号, 仓库编号)
)
go

/*==============================================================*/
/* Table: 转仓表                                                   */
/*==============================================================*/
create table 转仓表 (
   动作编号                 char(18)             not null,
   物料编号                 char(18)             null,
   仓库编号                 char(5)              null,
   管理员编号                char(18)             null,
   转仓数量                 int                  null,
   入仓编号                 char(5)              null,
   出仓编号                 char(5)              null,
   constraint PK_转仓表 primary key (动作编号)
)
go

/*==============================================================*/
/* Table: 部门表                                                   */
/*==============================================================*/
create table 部门表 (
   部门名                  char(10)             null,
   部门编号                 char(8)              not null,
   constraint PK_部门表 primary key (部门编号)
)
go

alter table 出入库表
   add constraint FK_出入库表_REFERENCE_物料表 foreign key (物料编号, 仓库编号)
      references 物料表 (物料编号, 仓库编号)
go

alter table 出入库表
   add constraint FK_出入库表_REFERENCE_仓库管理员表 foreign key (管理员编号)
      references 仓库管理员表 (管理员编号)
go

alter table 员工表
   add constraint FK_员工表_REFERENCE_部门表 foreign key (部门编号)
      references 部门表 (部门编号)
go

alter table 物料表
   add constraint FK_物料表_REFERENCE_仓库表 foreign key (仓库编号)
      references 仓库表 (仓库编号)
go

alter table 转仓表
   add constraint FK_转仓表_REFERENCE_物料表 foreign key (物料编号, 仓库编号)
      references 物料表 (物料编号, 仓库编号)
go

alter table 转仓表
   add constraint FK_转仓表_REFERENCE_仓库管理员表 foreign key (管理员编号)
      references 仓库管理员表 (管理员编号)
go

/*==========触发器1-出入库自动更新===========*/
create trigger insert_wuliao on 出入库表
after insert
as
declare @物料编号 char(18),@number int
set @物料编号=(select 物料编号 from inserted)
set @number=(select 出入数量 from inserted)
update 物料表
set 数量+=@number where 物料编号=@物料编号
go

/*==========触发器2-转仓自动更新=============*/
create trigger update_wuliao on 转仓表
after insert
as
declare @物料编号 char(18),@number int,@outbase char(5),@inbase char(5)
set @物料编号=(select 物料编号 from inserted)
set @number=(select 转仓数量 from inserted)
set @outbase=(select 出仓编号 from inserted)
set @inbase=(select 入仓编号 from inserted)
update 物料表
set 数量-=@number where 物料编号=@物料编号 and 仓库编号=@outbase
if exists(select 数量 from 物料表 where 物料编号=@物料编号 and 仓库编号=@inbase)
update 物料表
set 数量+=@number where 物料编号=@物料编号 and 仓库编号=@inbase
else
declare @物料名 char(18),@规格 char(18)
set @物料名=(select 物料名 from 物料表 where 物料编号=@物料编号)
set @规格=(select 规格 from 物料表 where 物料编号=@物料编号)
insert into 物料表(物料编号,物料名,规格,数量,仓库编号)
values(@物料编号,@物料名,@规格,@number,@inbase)
go