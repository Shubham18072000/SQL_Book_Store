 create database book_store;
 
select * from books;
select * from customers;
select * from orders;

-- 1) retrive all books in the 'Fiction' genre
Select * from books
where Genre = 'Fiction';

-- 2) Find books published after the year 1950
Select * from books
where Published_Year > 1950;

-- 3) List all customers from Canada
Select * from customers
where Country = 'Canada';

-- 4) Show orders placed in November 2023
Select * from orders
where Order_Date between '2023-11-0' And '2023-11-30';

-- 5) Retrieve the total stock of books available
Select sum(Stock) from books;

-- 6) Find the details of the most expensive book
Select * from books
order by Price desc
limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book
Select * from orders
where Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20
Select * from orders
where Total_Amount>20;

-- 9) List all genres available in the Books table
Select Distinct Genre from books;

-- 10) Find the book with the lowest stock
Select * from books
Order by stock
limit 1;

-- 11) Calculate the total revenue generated from all orders
Select sum(Total_Amount) as total_revenue from orders;

-- Advance questions
-- 1) Retrieve the total number of books sold for each genre
Select b.genre, count(o.quantity) as Total_Quantity_Sold from orders o 
join books b on b.Book_ID = o.Book_ID
group by genre;

-- 2) Find the average price of books in the "Fantasy" genre
Select genre, avg(price) from books
group by genre;

-- 3) List customers who have placed at least 2 orders
Select Customer_ID, count(Order_ID) as Order_Count from orders
group by Customer_ID
having Order_Count >= 2;

-- 4) Find the most frequently ordered book
Select b.Title, Max(o.Quantity) as Most_Sold from orders o 
join books b on b.Book_ID = o.Book_ID
group by b.Title
order by Most_Sold desc
limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre
Select Genre, price from books
where Genre = 'Fantasy'
order by price desc
limit 3;

-- 6) Retrieve the total quantity of books sold by each author
Select b.Author, count(o.Quantity) as Books_Sold from orders o 
join books b on b.Book_ID = o.Book_ID
group by b.Author;

-- 7) List the cities where customers who spent over $30 are located
Select c.Name, c.City, o.Total_Amount from customers c 
join orders o on c.Customer_ID = o.Customer_ID
where o.Total_Amount>30
group by c.Name, c.City, o.Total_Amount;

-- 8) Find the customer who spent the most on orders
Select c.Name, c.Customer_ID, SUM(Total_Amount) as Total_Spend from orders o 
join customers c on o.Customer_ID = o.Customer_ID
group by c.Name, c.Customer_ID
order by Total_Spend desc
limit 1;

-- 9) Calculate the stock remaining after fulfilling all orders
Select b.Book_ID, b.Title, b.stock, COALESCE(SUM(o.quantity),0) As Order_Quantity,
b.stock - COALESCE(SUM(o.quantity),0) as Remaining_Quantity
from books b 
LEft JOIN orders o on b.Book_ID = o.Book_ID
group by b.Book_ID, b.Title, b.stock;