-- Tạo bảng Sales
CREATE TABLE Sales (
    transaction_id INT,
    transaction_date DATE,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

-- Chèn dữ liệu mẫu
INSERT INTO Sales (transaction_id, transaction_date, customer_id, total_amount) 
VALUES
(101, '2023-10-02', 21, 75000.00),
(102, '2023-10-02', 35, 120000.00),
(103, '2023-10-03', 42, 350000.00),
(104, '2023-10-05', 21, 55000.00),
(105, '2023-10-07', 50, 210000.00),
(106, '2023-10-10', 35, 85000.00),
(107, '2023-10-11', 61, 450000.00),
(108, '2023-10-15', 21, 150000.00),
(109, '2023-10-18', 73, 95000.00),
(110, '2023-10-20', 42, 25000.00),
(111, '2023-10-22', 50, 320000.00),
(112, '2023-10-25', 21, 110000.00),
(113, '2023-10-27', 88, 180000.00),
(114, '2023-10-29', 35, 65000.00),
(115, '2023-10-30', 91, 295000.00);

-- Tổng quan về Doanh thu
-- Tổng doanh thu trong tháng là bao nhiêu?
select sum(total_amount)
from sales;

-- Có tất cả bao nhiêu giao dịch đã được thực hiện?
select count(transaction_id)
from sales; 

-- Phân tích Giá trị Giao dịch
-- Giá trị hóa đơn trung bình của một giao dịch là bao nhiêu?
select avg(total_amount)
from sales;
-- Giá trị hóa đơn cao nhất và thấp nhất trong tháng là bao nhiêu?
select sum(total_amount) ,
min(total_amount)
from sales;

-- Phân tích Hoạt động Bán hàng
-- Ngày nào diễn ra giao dịch đầu tiên và cuối cùng của tháng? (Dựa trên cột transaction_date)
select max(transaction_date) as last_day, 
min(transaction_date) as firts_day
from sales 
