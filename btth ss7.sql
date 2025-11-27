create table nhan_vien(
  id_nhan_vien int primary key,
  ho_ten varchar(100),
  phong_ban varchar(100),
  luong int,
  nam_sinh int
);
insert into nhan_vien
values (1, 'Nguyễn Văn An', 'Kỹ thuật', 25000000, 1990),
(2, 'Trần Thị Bình', 'Kinh doanh', 18000000, 1992),
(3, 'Lê Văn Cường', 'Kỹ thuật', 30000000, 1988),
(4, 'Phạm Thị Dung', 'Nhân sự', 16000000, 1995),
(5, 'Hoàng Văn Giang', 'Kỹ thuật', 22000000, 1991),
(6, 'Vũ Thị Hà', 'Kinh doanh', 19000000, 1996),
(7, 'Nguyễn Minh Hùng', 'Kỹ thuật', 35000000, 1989),
(8, 'Đặng Thu Lan', 'Marketing', 21000000, 1994),
(9, 'Bùi Văn Kiên', 'Nhân sự', 17000000, 1997),
(10, 'Ngô Bảo Ngọc', 'Kinh doanh', 20000000, 1993);

-- Phần 1 Lọc dữ liệu cơ bản
select * from nhan_vien
where ho_ten like 'Nguyễn%';
select * from nhan_vien
where luong between 15000000 and 20000000;
select * from nhan_vien
where phong_ban in ('Kinh doanh','Nhân sự');

-- Phần 2 Hàm tổng hợp
select count(id_nhan_vien) as tong_nhan_vien
from nhan_vien;
select max(luong) as maxluong,
min(luong) as minluong
from nhan_vien;
select avg(luong) as luong_trung_binh
from nhan_vien;

-- Phần 3 Nhóm và lọc nhóm
select id_nhan_vien, count(id_nhan_vien) as so_luong
from nhan_vien
group by id_nhan_vien;
select distinct phong_ban, avg(luong) as luong_trung_binh_moi_phong_ban
from nhan_vien
group by phong_ban;
select phong_ban, count(id_nhan_vien) as nhan_vien_phong_ban
from nhan_vien
group by phong_ban having count(id_nhan_vien)>3;
select luong
from nhan_vien
order by luong desc 
limit 3




  