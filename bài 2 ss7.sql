-- Tạo CSDL
create database sach_db;
use sach_db;
CREATE TABLE sach (
    id INT PRIMARY KEY,
    tieu_de VARCHAR(255),
    tac_gia VARCHAR(255),
    the_loai VARCHAR(100),
    nam_xuat_ban INT,
    trang_thai VARCHAR(50) -- 'Có sẵn' hoặc 'Đã mượn'
);
INSERT INTO sach (id, tieu_de, tac_gia, the_loai, nam_xuat_ban, trang_thai) VALUES
(1, 'Dế Mèn phiêu lưu ký', 'Tô Hoài', 'Văn học', 1941, 'Có sẵn'),
(2, 'Cho tôi xin một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 'Văn học', 2008, 'Đã mượn'),
(3, 'Số đỏ', 'Vũ Trọng Phụng', 'Tiểu thuyết', 1936, 'Có sẵn'),
(4, 'Nhà giả kim', 'Paulo Coelho', 'Tiểu thuyết', 1988, 'Có sẵn'),
(5, 'Mắt biếc', 'Nguyễn Nhật Ánh', 'Văn học', 1990, 'Đã mượn'),
(6, 'Trên đường băng', 'Tony Buổi Sáng', 'Kỹ năng sống', 2015, 'Có sẵn'),
(7, 'Đắc nhân tâm', 'Dale Carnegie', 'Kỹ năng sống', 1936, 'Có sẵn');
SELECT * FROM sach
WHERE tac_gia = 'Nguyễn Nhật Ánh';
SELECT * FROM sach
WHERE the_loai IN ('Văn học', 'Tiểu thuyết');
SELECT COUNT(*) AS so_luong_da_muon
FROM sach
WHERE trang_thai = 'Đã mượn';
SELECT * FROM sach
ORDER BY nam_xuat_ban ASC
LIMIT 2;