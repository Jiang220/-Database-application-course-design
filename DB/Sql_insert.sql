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

drop procedure add_book_message
go
create procedure add_book_message
	@Book_id varchar(20), --图书号
	@Book_in_price float,--进价
	@Book_out_price float,--图书售价
	@Book_name varchar(20),--书名
	@Supplier_name varchar(20),--供应商名字
	@Book_storage_time datetime,
	@Book_stock int--库存
as
insert into Book(Book_id,Book_in_price,Book_out_price,Book_name,Supplier_name,Book_storage_time ,Book_stock)
values (@Book_id, @Book_in_price, @Book_out_price, @Book_name, @Supplier_name, @Book_storage_time,@Book_stock)


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
/*
exec add_supplier_message 'GY10001', '人民邮电出版社', '北京','18010411467'
exec add_supplier_message 'GY10002', '高等教育出版社', '上海','18013341500'
*/
----------------------------------------------------------------------------------------------
create procedure add_Orderform--订单表
	@Orderform_id varchar(20),--订单编号
	@Orderform_time datetime,--订单时间
	@Customer_id varchar(20),--顾客编号
	@Supplier_id varchar(20),--供应商编号
	@Supplier_total int--供应量
as 
	insert into Orderform values(@Orderform_id, @Orderform_time, @Customer_id, @Supplier_id, @Supplier_total)
 ----------------------------------------------------------------------------------------------
 create proc add_Order_detail--订单明细表
	@Orderform_id varchar(20),--订单编号
	@Book_num int ,--图书数量
	@Book_id varchar(20),--图书号
	@Pay_total float--小计
as
	insert into Order_detail values(@Orderform_id, @Book_num, @Book_id, @Pay_total)
 
 
 ---------------------------------------------------------------------------------------
 
 
 
------------------------------------------------------------------------------------------------
/*
添加进货记录
这里更新订单明细
更新库存的书
*/
-----------------------------------------------------------------

create proc Supply_ExistentBook--供应存在的书存储过程
    @Orderform_id varchar(20), --订单编号
	@Book_num int ,--图书数量
	@Book_id varchar(20)--图书号
	---Pay_total float--小计
as
	begin 
		declare @Pay_total float, @Book_price float, @time datetime,@Supplier_id varchar(20)     --小计 图书单价  
		select @Book_price = Book_out_price  from Book where @Book_id = Book_id
		select @Supplier_id = Orderform.Supplier_id from Book,Order_detail,Orderform where Book.Book_id = Order_detail.Book_id and Order_detail.Orderform_id = Orderform.Orderform_id --查询供应商号
		set @Pay_total = @Book_price * @Book_num --计算总金额
		--select   from Book where @Book_id = Book_id
		set @time = getdate()--获取当前时间
		insert into Order_detail values(@Orderform_id, @Book_num, @Book_id, @Pay_total)--更新订单明细表
		update Book set Book_stock += @Book_num where @Book_id = Book_id  --更新图书库
		insert into Orderform values(@Orderform_id, @time,null,@Supplier_id,@Book_num)--更新订单
	end
 ---测试代码
 /*
 begin tran
 exec  Supply_ExistBook 'GY10001',5,'BK10001'
 SELECT * FROM Order_detail
 SELECT * FROM BOOK
 select * from Orderform
 ROLLBACK
 */ 
 
 create proc Supply_NonExistentBook--供应不存在的书存储过程
	@Orderform_id varchar(20),--订单号
	@Book_id varchar(20),--图书号
	@Book_name varchar(20),--书名
	@Book_in_price float,--进价
	@Book_out_price float,--售价
	@Supplier_name varchar(20),--出版商
	@Supplier_id varchar(20),--供应商号
	--Book_storage_time datetime,--图书入库时间
	@Book_stock int--库存/进货数量
as
	begin
	declare @Book_storage_time datetime, @Pay_total float --图书入库时间,进价综合
	set @Book_storage_time = GETDATE()
	
	set @Pay_total = @Book_in_price * @Book_stock
	exec add_book_message @Book_id, @Book_in_price, @Book_out_price, @Book_name, @Supplier_name, @Book_storage_time,@Book_stock
	exec add_Orderform  @Orderform_id, @Book_storage_time, null, @Supplier_id, @Book_stock
	exec add_Order_detail @Orderform_id, @Book_stock, @Book_id, @Pay_total
	end
 
