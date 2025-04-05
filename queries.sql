
select * from books;
select * from customers;
select * from orders;

/*1)retrieve all the books in the fiction genre  s*/

SELECT * from books 
where genre = 'fiction';

/*2)find books published after the year 1950  s*/

select *from books
where published >1950 ;

/*3)List all the customers from canada s*/

select*from customers
where country = 'canada';

/*4)show orders placed in november 2023 s*/

select* from orders
where order_date between '2023-11-01' and '2023-11-31';

/* 5)retrieve total stock of books available */

select sum(stock) as total_stock
from books;

/*6)find the details of most expensive books*/

select *from books 
order by price desc limit 1;


/* 7) show all customers who ordered more than 1 quantity*/
select* from orders 
where quantity  > 1 ;

/* 8)retrieve all orders where the total amount exceeds $20*/

select* from  orders
where total_amount >20;

/*9)list all the genres available in the book table*/
select distinct genre from books;

/*10)find the book with the lowest stock*/
select* from books 
order by stock ;

/*11)calculate the total revenue generated from all order*/
select sum(total_amount) as revenue from orders; 

/****** 	ADVANCE QUERIES***/

/* 1)retrieve the total no of books sold  for each genre*/
select b.genre,sum(o.quantity) as total_sold_books
from orders as o 
join books as b on o.book_id = b.Book_id
group by b.genre;

/*2)find the average price of books in the fantasy genre*/

SELECT AVG(price) as avg_price
from books
where genre = 'fantasy';

/*list the customers who have place atleast two orders*/
select o.customer_id, c.name, count(o.order_id) as order_count
from orders as o
join customers as c on  o.customer_id = c.customer_id
group by o.customer_id, c.name
having count(order_id) >= 2;

/*find the most frequesntly order  book*/
select o.book_id , b.title, COUNT(o.order_id) as order_count
from orders as o
join books as b on o.book_id = b.book_id
group by o.book_id
order by  order_count limit 1;

/*show the top 3 most expensive books of fanatacy genre*/

SELECT * from books 
where genre = 'fantasy'
order by price desc limit 3;

/* retrieve the total count of books retrieve by each author*/
select b.author , sum(o.quantity) as total_books
from orders as o 
join books as b on o.book_id =b.Book_id
group by b.author;

/* list of cities where customers who spend over $30 are located */
select distinct c.city, total_amount
from orders as o 
join customers as c on o.customer_id=c.customer_id
where o.total_amount > 30;

/* find the customer who spend the most on orders    */
select c.customer_id, c.name ,sum(total_amount) as total_spend
from orders as o 
join  customers c on o.customer_id=c.customer_id
group by c.customer_id , c.name
order by total_spend desc limit 1;

/* calculate the stock remaining after fulfilling all orders (stock-quantity how much is left) */
select b.book_id, b.title ,b.stock , coalesce(sum(o.quantity),0)  as order_quantity ,
 b.stock -coalesce(sum(o.quantity),0) as remaining_quantity
from books as b
left join orders as o on b.Book_id=o.book_id
group by b.Book_id
order by b.Book_id;
