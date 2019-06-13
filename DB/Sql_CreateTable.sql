
--Bookstore retail management system ������۹���ϵͳ
create database BRMSDB  --�������ݿ�
on
(
name='BRMSDB',--���������ļ���
filename='d:\db\BRMSDB.mdf',--�ļ�����ַ
size=3mb,--�ļ���ʼ��С
maxsize=100mb,--�ļ�����С
filegrowth=2mb--�ļ������ٶ�
)
log on
(
name='StuLog',
filename='d:\db\BRMSDB.ldf',
size=1mb,
maxsize=10mb,
filegrowth=10%
)
------------------------------------------------------------------------------------

use BRMSDB
go
drop table supplier
go
create table Supplier--��Ӧ�̱�
(
	Supplier_id varchar(20) primary key,--��Ӧ�̺�
	Supplier_name varchar(20),--��Ӧ������
	Supplier_city varchar(20),--��Ӧ�̳���
	Supplier_tel varchar(20),--��Ӧ�̵绰
	
)

create table Orderform--������
(
	Orderform_id varchar(20) primary key,--�������
	Orderform_time datetime,--����ʱ��
	Customer_id varchar(20),--�˿ͱ��
	Supplier_id varchar(20),--��Ӧ�̱��
	Supplier_total int--��Ӧ��
)

create table Order_detail--������ϸ��
(
	Orderform_id varchar(20) primary key,--�������
	Book_num int ,--ͼ������
	Book_id varchar(20),--ͼ���
	Pay_total float--С��
)
--drop table Book

create table Book--ͼ���
(
	Book_id varchar(20) primary key,--ͼ���
	Book_in_price float,--����
	Book_out_price float,--ͼ���ۼ�
	Book_name varchar(20),--����
	Supplier_name varchar(20),--��Ӧ������
	Book_stock int--���
)
create table Pay_message--֧����Ϣ��
(
	Orderform_id varchar(20) primary key,--������
	Pay_money float,--֧���ܶ�
	Pay_mode varchar(20)--֧����ʽ
)
create table Customer--�˿ͱ�
(
	Customer_id varchar(20) primary key,--�˿ͺ�
	Customer_vip bit,--�Ƿ��Ա
	Customer_vip_money float,--��Ա�����
	Customer_tel varchar(20) --�˿���ϵ�绰
) 
--drop table Sell_record
create table Sell_record--���۱�
(
	Orderform_id varchar(20),--������
	Book_id varchar(20),--ͼ���
	PRIMARY KEY(Orderform_id,Book_id)
)
------------------------------------------------------------------------------------------------


