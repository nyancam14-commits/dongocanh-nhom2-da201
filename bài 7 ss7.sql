create table giao_dich(
   id_giao_dich INT PRIMARY KEY,
   id_khach_hang INT,
   id_san_pham INT,
   ten_san_pham VARCHAR(255),
   danh_muc VARCHAR(100),
   so_luong INT,
   don_gia INT,
   ngay_giao_dich DATE,
   khu_vuc VARCHAR(100) 
);
insert into giao_dich
values (1, 101, 1, 'Laptop A', 'Dien tu', 1, 20000000, '2023-01-15', 'Ha Noi'),
(2, 102, 2, 'Dien thoai B', 'Dien tu', 2, 15000000, '2023-02-20', 'TP.HCM'),
(3, 101, 3, 'Ao so mi C', 'Thoi trang', 5, 500000, '2023-03-10', 'Ha Noi'),
(4, 103, 1, 'Laptop A', 'Dien tu', 1, 20000000, '2023-03-12', 'Da Nang'),
(5, 102, 4, 'Quan jean D', 'Thoi trang', 3, 700000, '2023-04-05', 'TP.HCM'),
(6, 101, 2, 'Dien thoai B', 'Dien tu', 1, 15000000, '2023-05-08', 'Ha Noi'),
(7, 104, 5, 'Noi com dien E', 'Gia dung', 2, 2000000, '2023-05-18', 'TP.HCM'),
(8, 103, 3, 'Ao so mi C', 'Thoi trang', 10, 500000, '2023-06-22', 'Da Nang'),
(9, 102, 1, 'Laptop A', 'Dien tu', 1, 21000000, '2023-07-10', 'TP.HCM'),
(10, 105, 6, 'May xay sinh to F', 'Gia dung', 1, 1500000, '2022-12-01', 'Ha Noi'),
(11, 101, 4, 'Quan jean D', 'Thoi trang', 2, 700000, '2023-08-15', 'Ha Noi');
-- Phân tích khách hàng VIP của năm 2023 
select id_khach_hang, sum(don_gia) as tong_chi_tieu_2023
from giao_dich 
where year(ngay_giao_dich)=2023
group by id_khach_hang having sum(don_gia)>30000000;
-- Phân tích hiệu suất sản phẩm 'laptop A'
select khu_vuc, sum(so_luong) as tong_so_luong,
                sum(so_luong * don_gia) as tong_doanh_thu
from giao_dich
where ten_san_pham = 'Laptop A' 
group by khu_vuc having sum(so_luong) >=1;
-- Xác định các danh mục sản phẩm tiềm năng ở TP.HCM
select khu_vuc, avg(don_gia*so_luong) as gia_tri_trung_binh
from giao_dich
where khu_vuc='TP.HCM'
group by khu_vuc having avg(don_gia*so_luong) > 5000000;
-- Tìm những khách hàng mua đa dạng sản phẩm trong năm 2023 
select id_khach_hang, count(distinct danh_muc)
from giao_dich 
where year(ngay_giao_dich) = 2023 
group by id_khach_hang having count(distinct danh_muc)>=2







 