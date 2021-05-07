/*===============================================*/
--�������ݿ�
/*===============================================*/
--create database ���Ϲ���


use ���Ϲ���



if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('������') and o.name = 'FK_������_REFERENCE_���ϱ�')
alter table ������
   drop constraint FK_������_REFERENCE_���ϱ�
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('������') and o.name = 'FK_������_REFERENCE_�ֿ����Ա��')
alter table ������
   drop constraint FK_������_REFERENCE_�ֿ����Ա��
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Ա����') and o.name = 'FK_Ա����_REFERENCE_���ű�')
alter table Ա����
   drop constraint FK_Ա����_REFERENCE_���ű�
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('���ϱ�') and o.name = 'FK_���ϱ�_REFERENCE_�ֿ��')
alter table ���ϱ�
   drop constraint FK_���ϱ�_REFERENCE_�ֿ��
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ת�ֱ�') and o.name = 'FK_ת�ֱ�_REFERENCE_���ϱ�')
alter table ת�ֱ�
   drop constraint FK_ת�ֱ�_REFERENCE_���ϱ�
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ת�ֱ�') and o.name = 'FK_ת�ֱ�_REFERENCE_�ֿ����Ա��')
alter table ת�ֱ�
   drop constraint FK_ת�ֱ�_REFERENCE_�ֿ����Ա��
go

if exists (select 1
            from  sysobjects
           where  id = object_id('�ֿ����Ա��')
            and   type = 'U')
   drop table �ֿ����Ա��
go

if exists (select 1
            from  sysobjects
           where  id = object_id('�ֿ��')
            and   type = 'U')
   drop table �ֿ��
go

if exists (select 1
            from  sysobjects
           where  id = object_id('������')
            and   type = 'U')
   drop table ������
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Ա����')
            and   type = 'U')
   drop table Ա����
go

if exists (select 1
            from  sysobjects
           where  id = object_id('���ϱ�')
            and   type = 'U')
   drop table ���ϱ�
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ת�ֱ�')
            and   type = 'U')
   drop table ת�ֱ�
go

if exists (select 1
            from  sysobjects
           where  id = object_id('���ű�')
            and   type = 'U')
   drop table ���ű�
go

/*==============================================================*/
/* Table: �ֿ����Ա��                                                */
/*==============================================================*/
create table �ֿ����Ա�� (
   ����Ա���                char(18)             not null,
   ����Ա����                char(18)             null,
   constraint PK_�ֿ����Ա�� primary key (����Ա���)
)
go

/*==============================================================*/
/* Table: �ֿ��                                                   */
/*==============================================================*/
create table �ֿ�� (
   �ֿ���                 char(5)              not null,
   constraint PK_�ֿ�� primary key (�ֿ���)
)
go

/*==============================================================*/
/* Table: ������                                                  */
/*==============================================================*/
create table ������ (
   ���ϱ��                 char(18)             not null,
   ����Ա���                char(18)             not null,
   �ֿ���                 char(5)              not null,
   �������                 char(18)             not null,
   ��������                 int                  null,
   constraint PK_������ primary key (�������)
)
go

/*==============================================================*/
/* Table: Ա����                                                   */
/*==============================================================*/
create table Ա���� (
   ����                   char(5)              null,
   Ա�����                 char(18)             not null,
   �绰                   char(11)             null,
   ��������                 datetime             null,
   ��ְ���                 datetime             null,
   ְλ                   char(5)              null,
   ���ű��                 char(8)              null,
   �Ա�                   char(2)              null,
   constraint PK_Ա���� primary key (Ա�����)
)
go

/*==============================================================*/
/* Table: ���ϱ�                                                   */
/*==============================================================*/
create table ���ϱ� (
   ���ϱ��                 char(18)             not null,
   ������                  char(18)             null,
   ���                   char(18)             null,
   ����                   int                  null,
   �ֿ���                 char(5)              not null,
   constraint PK_���ϱ� primary key (���ϱ��, �ֿ���)
)
go

/*==============================================================*/
/* Table: ת�ֱ�                                                   */
/*==============================================================*/
create table ת�ֱ� (
   �������                 char(18)             not null,
   ���ϱ��                 char(18)             null,
   �ֿ���                 char(5)              null,
   ����Ա���                char(18)             null,
   ת������                 int                  null,
   ��ֱ��                 char(5)              null,
   ���ֱ��                 char(5)              null,
   constraint PK_ת�ֱ� primary key (�������)
)
go

/*==============================================================*/
/* Table: ���ű�                                                   */
/*==============================================================*/
create table ���ű� (
   ������                  char(10)             null,
   ���ű��                 char(8)              not null,
   constraint PK_���ű� primary key (���ű��)
)
go

alter table ������
   add constraint FK_������_REFERENCE_���ϱ� foreign key (���ϱ��, �ֿ���)
      references ���ϱ� (���ϱ��, �ֿ���)
go

alter table ������
   add constraint FK_������_REFERENCE_�ֿ����Ա�� foreign key (����Ա���)
      references �ֿ����Ա�� (����Ա���)
go

alter table Ա����
   add constraint FK_Ա����_REFERENCE_���ű� foreign key (���ű��)
      references ���ű� (���ű��)
go

alter table ���ϱ�
   add constraint FK_���ϱ�_REFERENCE_�ֿ�� foreign key (�ֿ���)
      references �ֿ�� (�ֿ���)
go

alter table ת�ֱ�
   add constraint FK_ת�ֱ�_REFERENCE_���ϱ� foreign key (���ϱ��, �ֿ���)
      references ���ϱ� (���ϱ��, �ֿ���)
go

alter table ת�ֱ�
   add constraint FK_ת�ֱ�_REFERENCE_�ֿ����Ա�� foreign key (����Ա���)
      references �ֿ����Ա�� (����Ա���)
go

/*==========������1-������Զ�����===========*/
create trigger insert_wuliao on ������
after insert
as
declare @���ϱ�� char(18),@number int
set @���ϱ��=(select ���ϱ�� from inserted)
set @number=(select �������� from inserted)
update ���ϱ�
set ����+=@number where ���ϱ��=@���ϱ��
go

/*==========������2-ת���Զ�����=============*/
create trigger update_wuliao on ת�ֱ�
after insert
as
declare @���ϱ�� char(18),@number int,@outbase char(5),@inbase char(5)
set @���ϱ��=(select ���ϱ�� from inserted)
set @number=(select ת������ from inserted)
set @outbase=(select ���ֱ�� from inserted)
set @inbase=(select ��ֱ�� from inserted)
update ���ϱ�
set ����-=@number where ���ϱ��=@���ϱ�� and �ֿ���=@outbase
if exists(select ���� from ���ϱ� where ���ϱ��=@���ϱ�� and �ֿ���=@inbase)
update ���ϱ�
set ����+=@number where ���ϱ��=@���ϱ�� and �ֿ���=@inbase
else
declare @������ char(18),@��� char(18)
set @������=(select ������ from ���ϱ� where ���ϱ��=@���ϱ��)
set @���=(select ��� from ���ϱ� where ���ϱ��=@���ϱ��)
insert into ���ϱ�(���ϱ��,������,���,����,�ֿ���)
values(@���ϱ��,@������,@���,@number,@inbase)
go