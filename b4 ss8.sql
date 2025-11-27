create table Productss(
product_id INT primary key,
product_name VARCHAR(100),
category VARCHAR(100), 
price DECIMAL(10,2)
);

create table Orderss(
order_id INT primary key,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2)
);

INSERT INTO Productss (product_id, product_name, category, price)
VALUES
(1, 'Laptop XYZ', 'Electronics', 1200.00),
(2, 'Sách: Lịch sử Việt Nam', 'Books', 25.50),
(3, 'Áo phông Cotton', 'Clothing', 35.99),
(4, 'Điện thoại Z Flip', 'Electronics', 999.00),
(5, 'Truyện tranh One Piece Tập 1', 'Books', 10.00);

INSERT INTO Orderss (order_id, customer_id, order_date, total_amount) 
VALUES
(101, 1, '2025-10-20', 1235.99),  
(102, 2, '2025-10-22', 25.50),   
(103, 1, '2025-11-01', 999.00),  
(104, 3, '2025-11-05', 10.00);  

-- Đếm số lượng sản phẩm trong mỗi danh mục (category). Bảng kết quả cần có 2 cột: category và number_of_products.
select category, count(product_id)
as number_of_products
from productss
group by category;

-- Tính tổng doanh thu (total_amount) cho mỗi khách hàng (customer_id). Bảng kết quả cần có 2 cột: customer_id và total_spent.
select customer_id, sum(total_amount)
as total_spent
from orderss
group by customer_id;

-- Kết hợp nhiều hàm tổng hợp với group by
-- Với mỗi danh mục sản phẩm, hãy tính: số lượng sản phẩm, giá trung bình, giá cao nhất, và giá thấp nhất. Bảng kết quả cần có các cột: category, product_count, avg_price, max_price, min_price.
select category,
count(product_id) as product_count,
avg(price) as avg_price,
max(price) as max_price,
min(price) as min_price
from productss 
group by category;  

-- Sử dụng HAVING để lọc nhóm:
-- Tìm những khách hàng có tổng chi tiêu lớn hơn 1000. Chỉ hiển thị customer_id và total_spent của những khách hàng này.
select customer_id, sum(total_amount)
as total_spent
from orderss
group by customer_id
having sum(total_amount)>1000;

-- Sử dụng HAVING với COUNT:
-- Liệt kê các danh mục có nhiều hơn 5 sản phẩm. Chỉ hiển thị tên danh mục (category) và số lượng sản phẩm (product_count).
select category, count(product_id)
as product_count 
from productss
group by category
having count(product_id) > 5;

-- Kết hợp GROUP BY, ORDER BY và LIMIT:
-- Tìm ra 3 khách hàng có tổng chi tiêu cao nhất. Bảng kết quả cần hiển thị customer_id và total_spent, được sắp xếp giảm dần theo tổng chi tiêu.
select customer_id, sum(total_amount)
as total_spent 
from orderss
group by customer_id
order by sum(total_amount) desc
limit 3 

