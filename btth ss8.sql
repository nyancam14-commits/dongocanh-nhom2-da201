-- COUNT: Có bao nhiêu đơn hàng trong bảng Orders?
select count(order_id)
from orders; 
-- SUM: Tổng số lượng sản phẩm đã bán là bao nhiêu?
select sum(quantity)
from orders; 
-- AVG: Giá trung bình của các sản phẩm là bao nhiêu?
select avg(price)
from orders;
-- MIN: Tìm giá thấp nhất của sản phẩm.
 select min(price)
 from orders;
-- MAX: Tìm giá cao nhất của sản phẩm.
 select max(price)
 from orders;
-- COUNT + GROUP BY: Đếm số đơn hàng theo từng quốc gia (country).
 select country, count(order_id)
 from orders
 group by country;
-- AVG + GROUP BY: Tính giá trung bình của sản phẩm theo từng quốc gia.
select country, avg(price)
from orders
group by country 