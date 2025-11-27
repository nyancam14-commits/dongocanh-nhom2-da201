create table ghi_danh(
   id_ghi_danh INT PRIMARY KEY,
   id_hoc_vien INT,
   id_khoa_hoc INT,
   ten_khoa_hoc VARCHAR(255),
   ten_giang_vien VARCHAR(255),
   gia_tien INT,
   ngay_ghi_danh DATE,
   trang_thai_hoan_thanh VARCHAR(50)
);
insert into ghi_danh
values (1, 101, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-01-20', 'Da hoan thanh'),
(2, 102, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-02-15', 'Chua hoan thanh'),
(3, 103, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-02-25', 'Da hoan thanh'),
(4, 101, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-03-05', 'Da hoan thanh'),
(5, 104, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-03-10', 'Chua hoan thanh'),
(6, 102, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-04-12', 'Chua hoan thanh'),
(7, 105, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 600000, '2023-05-15', 'Da hoan thanh'),
(8, 103, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-05-20', 'Da hoan thanh'),
(9, 101, 4, 'Machine Learning ung dung', 'Nguyen Van A', 1500000, '2023-06-01', 'Chua hoan thanh'),
(10, 106, 2, 'Python co ban', 'Tran Thi B', 700000, '2022-11-30', 'Da hoan thanh'),
(11, 102, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-07-01', 'Chua hoan thanh');

-- Đánh giá hiệu suất giảng viên trong quý 1 năm 2023
select ten_giang_vien, sum(gia_tien) as tong_doanh_thu_q1
from ghi_danh
where ngay_ghi_danh >= '2023-01-01' and ngay_ghi_danh < '2023-04-01'
group by ten_giang_vien having sum(gia_tien) > 1000000;

-- Tìm các khóa học phổ biến nhưng có tỷ lệ hoàn thành thấp
select ten_khoa_hoc,
((sum(case when trang_thai_hoan_thanh = 'Da hoan thanh' then 1 else 0 end))/ (count(id_ghi_danh )))*100 as ty_le_hoan_thanh,
count(id_ghi_danh) as so_luong_ghi_danh 
from ghi_danh
group by ten_khoa_hoc 
having ((sum(case when trang_thai_hoan_thanh = 'Da hoan thanh' then 1 else 0 end))/ (count(id_ghi_danh )))*100 < '50%' 
and count(id_ghi_danh)>2;

-- Xác định học viên tích cực nhất
select id_hoc_vien, 
sum(gia_tien) as tong_chi_tieu,
count(distinct id_khoa_hoc) as so_khoa_hoc_da_dang_ky
from ghi_danh
group by id_hoc_vien
having sum(gia_tien)>1000000 and count(distinct id_khoa_hoc)>2;

-- Phân tích doanh thu theo tháng trong năm 2023
select month(ngay_ghi_danh) as thang_ghi_danh, sum(gia_tien) as tong_doanh_thu
from ghi_danh
where year(ngay_ghi_danh) = 2023
group by month(ngay_ghi_danh) having sum(gia_tien)>1000000

 

