-- Tạo CSDL
create database mon_an_db;
use mon_an_db;
CREATE TABLE mon_an (
    id INT PRIMARY KEY,
    ten_mon VARCHAR(255),
    danh_muc VARCHAR(100),
    gia_tien INT,
    trang_thai_phuc_vu VARCHAR(50)
);
INSERT INTO mon_an (id, ten_mon, danh_muc, gia_tien, trang_thai_phuc_vu) VALUES
(1, 'Phở Bò Tái', 'Món chính', 50000, 'Đang phục vụ'),
(2, 'Cơm Gà Xối Mỡ', 'Món chính', 45000, 'Đang phục vụ'),
(3, 'Gỏi Cuốn Tôm Thịt', 'Khai vị', 30000, 'Đang phục vụ'),
(4, 'Bún Bò Huế', 'Món chính', 55000, 'Tạm ngưng'),
(5, 'Nước Cam Ép', 'Đồ uống', 25000, 'Đang phục vụ'),
(6, 'Chè Hạt Sen', 'Tráng miệng', 20000, 'Đang phục vụ'),
(7, 'Cà Phê Sữa Đá', 'Đồ uống', 22000, 'Đang phục vụ'),
(8, 'Bò Lúc Lắc', 'Món chính', 70000, 'Đang phục vụ');
SELECT * FROM mon_an
WHERE danh_muc IN ('Món chính', 'Khai vị');
SELECT MIN(gia_tien) AS gia_re_nhat
FROM mon_an
WHERE trang_thai_phuc_vu = 'Đang phục vụ';
SELECT * FROM mon_an
WHERE ten_mon LIKE '%Bò%';
SELECT ten_mon, gia_tien
FROM mon_an
ORDER BY gia_tien ASC
LIMIT 3;