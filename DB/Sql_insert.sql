create procedure add_customer_message--添加用户信息存储过程
    @Customer_id varchar(20) ,
	@Customer_vip bit,--是否会员
	@Customer_vip_money float,--会员卡金额
	@Customer_tel varchar(20) --顾客联系电话
as
insert into Customer(Customer_id,Customer_vip,Customer_vip_money,Customer_tel)
values (@Customer_id,@Customer_vip,@Customer_vip_money,@Customer_tel)


--------------------------------------------------------------------------------

create procedure add_customer_message--添加用户信息存储过程
    @Customer_id varchar(20) ,
	@Customer_vip bit,--是否会员
	@Customer_vip_money float,--会员卡金额
	@Customer_tel varchar(20) --顾客联系电话
as
insert into Customer(Customer_id,Customer_vip,Customer_vip_money,Customer_tel)
values (@Customer_id,@Customer_vip,@Customer_vip_money,@Customer_tel)
--------------------------------------------------------------------------------------
create procedure add_book_message
	@Book_id varchar(20), --图书号
	@Book_in_price float,--进价
	@Book_out_price float,--图书售价
	@Book_name varchar(20),--书名
	@Supplier_name varchar(20),--供应商名字
	@Book_stock int--库存
as
insert into Book(Book_id,Book_in_price,Book_out_price,Book_name,Supplier_name,Book_stock)
values (@Book_id, @Book_in_price, @Book_out_price, @Book_name, @Supplier_name, @Book_stock)


------------------------------------------------------------------------------------------------
drop proc add_supplier_message
go 
create procedure add_supplier_message
	@Supplier_id varchar(20),--供应商号
	@Supplier_name varchar(20),--供应商名字
	@Supplier_city varchar(20),--供应商城市
	@Supplier_tel varchar(20)--供应商电话
as
insert into supplier(Supplier_id, Supplier_name, Supplier_city, Supplier_tel)
values (@Supplier_id, @Supplier_name, @Supplier_city, @Supplier_tel)
