create table Books(
  book_id int primary key,
  title varchar(100),
  author varchar(200),
  publication_year int,
  pages int
);

create table BorrowingRecords(
  record_id int primary key,
  book_id int,
  foreign key(book_id) references books(book_id),
  borrow_date date
);

INSERT INTO Books 
VALUES
(101, 'Tiểu thuyết Lửa', 'Nguyễn Nhật Ánh', 2018, 320),
(102, 'Tâm lý học về tiền', 'Morgan Housel', 2020, 280),
(103, 'Sử ký Tư Mã Thiên', 'Tư Mã Thiên', 1990, 850),
(104, 'Nguyên lý Marketing', 'Philip Kotler', 1999, 600),
(105, '1984', 'George Orwell', 1949, 304);

INSERT INTO BorrowingRecords 
VALUES
(1, 101, '2025-10-01'), 
(2, 102, '2025-10-05'), 
(3, 101, '2025-10-10'), 
(4, 104, '2025-10-15'), 
(5, 105, '2025-10-20'); 

-- 1 Sử dụng count
select count(book_id) 
as total_books
from books;

-- 2 sử dụng sum
select sum(pages) 
as total_pages_in_library
from books;

-- 3 sử dụng hàm avg
select book_id, avg(pages) 
as total_pages_per_book
from books
group by book_id;

-- 4 sử dụng min, max với số
select min(publication_year) 
as oldest_book_year
from books;
select max(publication_year)
as firs_borrow_date
from books;

-- 5 sử dụng min với ngày tháng
select  min(borrow_date)
as first_borrow_date
from borrowingrecords;

-- 6 kết hợp where
select count(publication_year)
as books_after_2000
from Books
where year (publication_year) > 2000



