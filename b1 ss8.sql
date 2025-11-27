create table Products(
  product_id int primary key,
  product_name varchar(100),
  price decimal,
  stock_quantity int
);

create table Customers(
  customer_id int primary key,
  customer_name varchar(100),
  city varchar(100)
);

create table orders(
order_id int primary key,
customer_id int,
foreign key(customer_id) references customers(customer_id),
order_date date,
total_date decimal
);

insert into products 
values (101,'Laptop AORUS 15X','35000.000','25'),
(102,'Bàn phím cơ Logitech G Pro','32500.000','50'),
(103,'Chuột không giây Logitech MX Master 3S','21900.000','75'),
(104,'Màn hình Dell UntraSharp U2723QE','18500.000','15'),
(105,'Tai nghe sony WH-1000XM5','69900.000','30');

insert into customers
values (1,'Nguyễn Văn An','Hà Nội'),
(2,'Trần Thị Bình','TP.HCM'),
(3,'Lê Công Minh','Đà Nẵng'),
(4,'Phạm Thu Hằng','Hải Phòng'),
(5,'Hoàng Đức Việt','Cần Thơ');

insert into orders
values (1001,1,'2025-11-20',35000.000),
(1002,2,'2025-11-21',54400.000),
(1003,3,'2025-11-21',18500.000),
(1004,4,'2025-11-22',69900.000),
(1005,5,'2025_11-22',21000.000);

-- 1 sử dụng hàm count 
select sum(product_id) as total_products
from products;

-- 2 sử dụng hàm sum
select sum(order_id) as total_revenue
from orders;

-- 3 sử dụng hàm AVG
select avg(price) as average_price
from products;

-- 4 Sử dụng min và max
select max(total_date) as max_order_amount
from orders;

select min(total_date) as min_order_amount
from orders;

-- 5 kết hợp với where
select count(city) as hanoi_customers_count
from customers 
where city like 'Hà Nội'
