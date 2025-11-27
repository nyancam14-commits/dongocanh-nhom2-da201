-- Tạo bảng DangKyGoi

CREATE TABLE DangKyGoi (
    ma_dang_ky INT,
    ma_khach_hang INT,
    ten_goi VARCHAR(50), 
    phi_hang_thang DECIMAL(10, 2),
    ngay_bat_dau DATE
);

 
-- Chèn dữ liệu mẫu
INSERT INTO DangKyGoi (ma_dang_ky, ma_khach_hang, ten_goi, phi_hang_thang, ngay_bat_dau) 
VALUES
(1, 101, 'Cơ Bản', 99000.00, '2022-01-15'),
(2, 102, 'Cao Cấp', 259000.00, '2021-06-20'),
(3, 103, 'Tiêu Chuẩn', 179000.00, '2023-03-10'),
(4, 101, 'Tiêu Chuẩn', 179000.00, '2023-05-20'),
(5, 104, 'Cao Cấp', 259000.00, '2021-11-01'),
(6, 102, 'Tiêu Chuẩn', 179000.00, '2023-01-30'),
(7, 105, 'Cơ Bản', 99000.00, '2023-08-12'),
(8, 104, 'Cao Cấp', 259000.00, '2022-11-01'),
(9, 102, 'Cơ Bản', 99000.00, '2023-09-05'),
(10, 104, 'Tiêu Chuẩn', 179000.00, '2023-02-15'),
(11, 101, 'Cao Cấp', 259000.00, '2023-10-01');

-- Nhiệm vụ 1: Phân tích Tổng quan theo Gói Dịch vụ.
-- Viết một truy vấn SQL để thống kê hiệu suất của từng gói dịch vụ (ten_goi). Báo cáo cần hiển thị:
-- Tên gói dịch vụ.
-- Tổng số lượt đăng ký cho mỗi gói (AS so_luot_dang_ky).
-- Tổng doanh thu từ mỗi gói (AS tong_doanh_thu).
select ten_goi,
count(ma_dang_ky) as so_luong_dang_ky,
count(ma_dang_ky)*sum(phi_hang_thang) as tong_doanh_thu
from Dangkygoi 
group by ten_goi;

-- Nhiệm vụ 2: Xây dựng Hồ sơ Khách hàng "VIP".
-- Viết một truy vấn SQL khác để tạo hồ sơ chi tiêu cho từng khách hàng (ma_khach_hang). Báo cáo này phải nhóm theo ma_khach_hang và hiển thị:
-- Mã khách hàng.
-- Tổng số tiền họ đã chi trả (AS tong_chi_tieu).
-- Tổng số gói dịch vụ họ đã đăng ký (AS so_goi_da_mua).
-- Ngày đầu tiên họ đăng ký dịch vụ (dấu hiệu của sự trung thành) (AS ngay_tham_gia_dau_tien).
select ma_khach_hang,
sum(phi_hang_thang) as tong_chi_tieu,
count(ma_dang_ky) as so_goi_da_mua,
min(ngay_bat_dau) as ngay_tham_gia_dau_tien
from Dangkygoi
group by ma_khach_hang 

