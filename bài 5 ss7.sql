-- Tạo CSDL
create database don_hang_db;
use don_hang_db;
-- Tạo bảng don_hang 
Create table don_hang (
id_don_hang INT PRIMARY KEY,
id_khach_hang INT,
danh_muc VARCHAR(100),
tong_tien INT,
ngay_dat DATE,
trang_thai VARCHAR(50) -- 'Hoan thanh', 'Da huy'
);
insert into don_hang (id_don_hang, id_khach_hang, danh_muc, tong_tien, ngay_dat, trang_thai) values
(1, 101, 'Dien tu', 15000000, '2023-01-15', 'Hoan thanh'),
(2, 102, 'Thoi trang', 2500000, '2023-01-20', 'Hoan thanh'),
(3, 101, 'Dien tu', 8000000, '2023-02-10', 'Hoan thanh'),
(4, 103, 'Gia dung', 5000000, '2023-02-12', 'Da huy'),
(5, 102, 'Thoi trang', 3000000, '2023-03-05', 'Hoan thanh'),
(6, 101, 'Gia dung', 4500000, '2023-03-08', 'Hoan thanh'),
(7, 104, 'Dien tu', 22000000, '2023-04-18', 'Hoan thanh'),
(8, 103, 'Thoi trang', 1800000, '2023-04-22', 'Hoan thanh'),
(9, 102, 'Dien tu', 12000000, '2022-12-10', 'Hoan thanh');
 -- 1. Thống kê tổng số tiền chi tiêu cho mỗi khách hàng. Hiển thị id_khach_hang và tổng số tiền của họ, đặt tên cột tổng tiền là tong_chi_tieu. Sắp xếp kết quả theo tổng chi tiêu giảm dần.
SELECT id_khach_hang, SUM(tong_tien) AS 'tong_chi_tieu'
FROM don_hang
GROUP BY id_khach_hang
ORDER BY tong_chi_tieu DESC;
-- 2. Đếm số lượng đơn hàng theo từng danh mục sản phẩm. Hiển thị danh_muc và số lượng đơn hàng tương ứng, đặt tên cột số lượng là so_luong_don.
select danh_muc, count(id_don_hang) as 'so_luong_don'
from don_hang 
group by danh_muc;
-- 3. Tìm những khách hàng đã đặt nhiều hơn 1 đơn hàng. Chỉ hiển thị id_khach_hang của những khách hàng này.
select id_don_hang, count(id_don_hang)
from don_hang 
group by id_khach_hang
having count(id_don_hang) > 1;
-- 4. Liệt kê các danh mục có tổng doanh thu (chỉ tính các đơn 'Hoan thanh') lớn hơn 10,000,000. Hiển thị danh_muc và tong_doanh_thu.
select danh_muc, sum(tong_tien) as 'tong_doanh_thu'
from don_hang 
where trang_thai like 'Hoan thanh'
group by danh_muc
having tong_doanh_thu > 10000000;