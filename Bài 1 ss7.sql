-- Tạo CSDL
create database san_pham_db;
use san_pham_db;
-- 1. Tạo bảng san_pham
Create table san_pham (
id int primary key,
ten_san_pham varchar (255),
danh_muc varchar (100),
gia_ban int,
so_luong_ton int
);
insert into san_pham (id, ten_san_pham, danh_muc, gia_ban, so_luong_ton) values
  (1, 'Laptop Dell XPS 13', 'Laptop', 28000000, 15),
  (2, 'iPhone 14 Pro Max', 'Điện thoại', 32000000, 30),
  (3, 'Bàn phím cơ Logitech', 'Phụ kiện', 2500000, 50),
  (4, 'Laptop MacBook Air M2', 'Laptop', 29500000, 20),
  (5, 'Samsung Galaxy S23 Ultra', 'Điện thoại', 26000000, 25),
  (6, 'Chuột không dây Fuhlen', 'Phụ kiện', 450000, 100),
  (7, 'Tai nghe Sony WH-1000XM5', 'Phụ kiện', 8500000, 40),
  (8, 'Laptop HP Envy 15', 'Laptop', 24000000, 18);
select * from san_pham
where gia_ban between 20000000 and 30000000;
select * from san_pham
where ten_san_pham like '%Laptop%';
select count(*) AS so_luong_phu_kien
from san_pham
where danh_muc = 'Phụ kiện';
select * from san_pham
order by gia_ban DESC
LIMIT 3;