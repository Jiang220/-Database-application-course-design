create procedure add_customer_message--����û���Ϣ�洢����
    @Customer_id varchar(20) ,
	@Customer_vip bit,--�Ƿ��Ա
	@Customer_vip_money float,--��Ա�����
	@Customer_tel varchar(20) --�˿���ϵ�绰
as
insert into Customer(Customer_id,Customer_vip,Customer_vip_money,Customer_tel)
values (@Customer_id,@Customer_vip,@Customer_vip_money,@Customer_tel)


DROP TABLE BOOK

exec add_book_message 'BK10000', 31.00, 44.00, '������', '��ѧ������', 5 
exec add_book_message 'BK10001', 37.00, 50.00, '�㷨����', '����������', 5 
exec add_book_message 'BK10002', 24.00, 37.00, '���ݿ⿪����Ӧ��', '�����ʵ������', 5 
exec add_book_message 'BK10003', 30.00, 43.00, 'java������ƽ̳�', '�ߵȽ���������', 5 
exec add_book_message 'BK10004', 49.00, 62.00, '���ݿ�ϵͳ����', '�廪��ѧ������', 5 
exec add_book_message 'BK10005', 24.00, 37.00, '�㷨�����ݽṹ', '�й������ѧ������', 5 
exec add_book_message 'BK10006', 38.00, 51.00, '��ɢ��ѧ', '��ѧ������', 5 
exec add_book_message 'BK10007', 38.00, 51.00, '������', '����������', 5 
exec add_book_message 'BK10008', 42.00, 55.00, '�㷨����', '�����ʵ������', 5 
exec add_book_message 'BK10009', 34.00, 47.00, '���ݿ⿪����Ӧ��', '�ߵȽ���������', 5 
exec add_book_message 'BK10010', 25.00, 38.00, 'java������ƽ̳�', '�廪��ѧ������', 5 
exec add_book_message 'BK10011', 25.00, 38.00, '���ݿ�ϵͳ����', '�й������ѧ������', 5 
exec add_book_message 'BK10012', 21.00, 34.00, '�㷨�����ݽṹ', '��ѧ������', 5 
exec add_book_message 'BK10013', 47.00, 60.00, '��ɢ��ѧ', '����������', 5 
exec add_book_message 'BK10014', 21.00, 34.00, '������', '�����ʵ������', 5 
exec add_book_message 'BK10015', 31.00, 44.00, '�㷨����', '�ߵȽ���������', 5 
 

--------------------------------------------------------------------------------

create procedure add_customer_message--����û���Ϣ�洢����
    @Customer_id varchar(20) ,
	@Customer_vip bit,--�Ƿ��Ա
	@Customer_vip_money float,--��Ա�����
	@Customer_tel varchar(20) --�˿���ϵ�绰
as
insert into Customer(Customer_id,Customer_vip,Customer_vip_money,Customer_tel)
values (@Customer_id,@Customer_vip,@Customer_vip_money,@Customer_tel)

create procedure add_book_message
	@Book_id varchar(20), --ͼ���
	@Book_in_price float,--����
	@Book_out_price float,--ͼ���ۼ�
	@Book_name varchar(20),--����
	@Supplier_name varchar(20),--��Ӧ������
	@Book_stock int--���
as
insert into Book(Book_id,Book_in_price,Book_out_price,Book_name,Supplier_name,Book_stock)
values (@Book_id, @Book_in_price, @Book_out_price, @Book_name, @Supplier_name, @Book_stock)


exec add_book_message 'BK10000', 31.00, 44.00, '������', '��ѧ������', 5 
exec add_book_message 'BK10001', 37.00, 50.00, '�㷨����', '����������', 5 
exec add_book_message 'BK10002', 24.00, 37.00, '���ݿ⿪����Ӧ��', '�����ʵ������', 5 
exec add_book_message 'BK10003', 30.00, 43.00, 'java������ƽ̳�', '�ߵȽ���������', 5 
exec add_book_message 'BK10004', 49.00, 62.00, '���ݿ�ϵͳ����', '�廪��ѧ������', 5 
exec add_book_message 'BK10005', 24.00, 37.00, '�㷨�����ݽṹ', '�й������ѧ������', 5 
exec add_book_message 'BK10006', 38.00, 51.00, '��ɢ��ѧ', '��ѧ������', 5 
exec add_book_message 'BK10007', 38.00, 51.00, '������', '����������', 5 
exec add_book_message 'BK10008', 42.00, 55.00, '�㷨����', '�����ʵ������', 5 
exec add_book_message 'BK10009', 34.00, 47.00, '���ݿ⿪����Ӧ��', '�ߵȽ���������', 5 
exec add_book_message 'BK10010', 25.00, 38.00, 'java������ƽ̳�', '�廪��ѧ������', 5 
exec add_book_message 'BK10011', 25.00, 38.00, '���ݿ�ϵͳ����', '�й������ѧ������', 5 
exec add_book_message 'BK10012', 21.00, 34.00, '�㷨�����ݽṹ', '��ѧ������', 5 
exec add_book_message 'BK10013', 47.00, 60.00, '��ɢ��ѧ', '����������', 5 
exec add_book_message 'BK10014', 21.00, 34.00, '������', '�����ʵ������', 5 
exec add_book_message 'BK10015', 31.00, 44.00, '�㷨����', '�ߵȽ���������', 5 




------------------------------------------------------------------------------------------------
drop proc add_supplier_message
go 
create procedure add_supplier_message
	@Supplier_id varchar(20),--��Ӧ�̺�
	@Supplier_name varchar(20),--��Ӧ������
	@Supplier_city varchar(20),--��Ӧ�̳���
	@Supplier_tel varchar(20)--��Ӧ�̵绰
as
insert into supplier(Supplier_id, Supplier_name, Supplier_city, Supplier_tel)
values (@Supplier_id, @Supplier_name, @Supplier_city, @Supplier_tel)
exec add_supplier_message 'GY10001', '�����ʵ������', '����','18010411467'
exec add_supplier_message 'GY10002', '�ߵȽ���������', '�Ϻ�','18013341500'
exec add_supplier_message 'GY10003', '�廪��ѧ������', '����','18011691724'
exec add_supplier_message 'GY10004', '�й������ѧ������', '����','18014781358'
exec add_supplier_message 'GY10005', '��ѧ������', '����','18019621464'
exec add_supplier_message 'GY10006', '����������', '����','18017051145'


select * from supplier
select * from book