-- Tạo bảng ChiTietDonHang
CREATE TABLE ChiTietDonHang (
    ma_chi_tiet INT,
    ma_don_hang INT,
    ten_san_pham VARCHAR(100),
    so_luong INT,
    don_gia DECIMAL(10, 2),
    thanh_tien DECIMAL(10, 2)
);

-- Chèn dữ liệu mẫu
INSERT INTO ChiTietDonHang (ma_chi_tiet, ma_don_hang, ten_san_pham, so_luong, don_gia, thanh_tien) VALUES
(1, 1001, 'Cà Phê Sữa', 2, 29000.00, 58000.00),
(2, 1001, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(3, 1002, 'Trà Đào Cam Sả', 1, 45000.00, 45000.00),
(4, 1003, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(5, 1004, 'Trà Sữa Trân Châu Đường Đen', 2, 55000.00, 110000.00),
(6, 1005, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(7, 1006, 'Cà Phê Sữa', 3, 29000.00, 87000.00),
(8, 1006, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00),
(9, 1007, 'Trà Đào Cam Sả', 2, 45000.00, 90000.00),
(10, 1008, 'Trà Sữa Trân Châu Đường Đen', 1, 55000.00, 55000.00),
(11, 1009, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(12, 1010, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00);

-- Nhiệm vụ 1: Xây dựng Báo cáo Hiệu suất Sản phẩm.
-- Tên sản phẩm.
-- Tổng số ly đã bán (AS tong_so_ly_ban).
-- Tổng doanh thu của sản phẩm đó (AS tong_doanh_thu).
-- Số đơn hàng có chứa sản phẩm này (cho biết mức độ phổ biến) (AS so_don_hang_chua_sp)
select ten_san_pham,
sum(so_luong) as tong_so_ly_ban,
sum(thanh_tien) as tong_doanh_thu,
count(distinct ma_don_hang) as so_don_hang_chua_sp 
from chitietdonhang 
group by ten_san_pham;

-- Nhiệm vụ 2: Phân tích và Đề xuất Chiến lược.
-- Dựa trên báo cáo bạn vừa tạo ở Nhiệm vụ 1, hãy trả lời các câu hỏi sau bên dưới câu lệnh SQL của bạn, sử dụng khối comment nhiều dòng (/* ... */):

-- Phân loại sản phẩm:
-- Xác định 2 sản phẩm "ngôi sao" (có hiệu suất tốt nhất).
-- Xác định 2 sản phẩm "cần xem xét" (có hiệu suất thấp nhất).
-- Lập luận: Giải thích lý do tại sao bạn lại phân loại chúng như vậy. Hãy xem xét cả hai yếu tố: tổng doanh thu và mức độ phổ biến (số đơn hàng).
-- Đề xuất chiến lược:
-- Đối với một sản phẩm "ngôi sao", hãy đề xuất một chương trình khuyến mãi để thúc đẩy doanh số hơn nữa.
-- Đối với một sản phẩm "cần xem xét", hãy đề xuất một hành động cụ thể (Ví dụ: thay đổi công thức, giảm giá dùng thử, hoặc loại bỏ khỏi thực đơn).
/* 
- 2 sản phẩm 'ngôi sao' là cà phê sữa và trà sữa trân châu đường đen.
- 2 sản phẩm 'cần xem xét' là bạc xỉu và trà chanh gừng mật ong.
- Với nhóm 'ngôi sao', cà phê sữa có doanh thu cao nhất và số đơn hàng chứa sản phẩm cũng cao nhất,
ở vị trí thứ 2 về doanh thu là trà sữa trân châu đường đen với số đơn hàng có sản phẩm ở mức trung bình(2).
Với nhóm 'cần xem xét', bạc xỉu có doanh thu thấp nhất và số lượng hàng chứa sản phẩm ở mức trung bình(2)
còn trà chanh gừng mật ong có doanh thu chỉ hơn bạc xỉu và số luọng hàng chứa sản phẩm cũng ở mức trung bình.

1. Đối với sản phẩm "Ngôi sao" (Cà Phê Sữa):
   - Chương trình khuyến mãi: "Mua Cà Phê Sữa, Thêm Bánh Giảm 50%".
   - Mục tiêu: Tận dụng mức độ phổ biến cao của Cà Phê Sữa để thúc đẩy doanh số bán kèm (up-sell) cho các mặt hàng khác 
   (ví dụ: bánh ngọt, snack) và tăng giá trị đơn hàng trung bình.

2. Đối với sản phẩm "Cần xem xét" (Bạc Xỉu):
   - Hành động cụ thể: Giảm giá dùng thử hoặc Thử nghiệm A/B với Công thức mới.
   - Lý do: Bạc Xỉu có doanh thu thấp nhất (70,000.00). Nên giới thiệu "Tuần lễ Khám phá Bạc Xỉu"
   với mức giảm 20% hoặc quảng cáo một "Phiên bản Bạc Xỉu Đặc Biệt" (Ví dụ: thêm kem muối biển) để thu hút khách hàng thử lại 
   và cải thiện nhận thức về sản phẩm này. Nếu doanh số vẫn không tăng sau 1 tháng, nên cân nhắc loại bỏ.
*/
