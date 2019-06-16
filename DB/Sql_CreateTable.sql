
--Bookstore retail management system 书店零售管理系统
create database BRMSDB  --建立数据库
on
(
name='BRMSDB',--创建数据文件名
filename='d:\db\BRMSDB.mdf',--文件名地址
size=3mb,--文件起始大小
maxsize=100mb,--文件最大大小
filegrowth=2mb--文件增长速度
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


create table Adminuser
(
public string 

)
create table Supplier--供应商表
(
	Supplier_id varchar(20) primary key,--供应商号
	Supplier_name varchar(20),--供应商名字
	Supplier_city varchar(20),--供应商城市
	Supplier_tel varchar(20),--供应商电话
	
)

create table Orderform--订单表
(
	Orderform_id varchar(20) primary key,--订单编号
	Orderform_time datetime,--订单时间
	Customer_id varchar(20),--顾客编号
	Supplier_id varchar(20),--供应商编号
	Supplier_total int--供应量
)

create table Order_detail--订单明细表
(
	Orderform_id varchar(20) primary key,--订单编号
	Book_num int ,--图书数量
	Book_id varchar(20),--图书号
	Pay_total float--小计
)
--drop table Book

drop table Book
create table Book--图书表
(
	Book_id varchar(20) primary key,--图书号
	Book_in_price float,--进价
	Book_out_price float,--售价
	Book_name varchar(20),--书名
	Supplier_name varchar(20),--供应商名字
	Book_storage_time datetime,--图书入库时间
	Book_stock int--库存
)
select * from Book
create table Pay_message--支付信息表
(
	Orderform_id varchar(20) primary key,--订单号
	Pay_money float,--支付总额
	Pay_mode varchar(20)--支付方式
)
create table Customer--顾客表
(
	Customer_id varchar(20) primary key,--顾客号
	Customer_vip bit,--是否会员
	Customer_vip_money float,--会员卡金额
	Customer_tel varchar(20) --顾客联系电话
) 
--drop table Sell_record

