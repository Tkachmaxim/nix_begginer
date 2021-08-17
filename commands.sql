select users_id, count (users_id) from carts inner join users on carts.user_user_id=users.users_id where carts.cart_id not in
(select carts_cart_id from order_) group by users_id order by count(users_id) desc limit 5;

select u.users_id, count (u.users_id) from users u inner join carts car on u.users_id=car.user_user_id
inner join order_ o on o.carts_cart_id=car.cart_id group by u.users_id order by  count (u.users_id) desc limit 5;

select u.users_id, o.total from users u inner join carts car on u.users_id=car.user_user_id
inner join order_ o on o.carts_cart_id=car.cart_id order by o.total desc;

select product_id, count (product_id) from products pr inner join cart_product carpr on
carpr.products_product_id=pr.product_id inner join carts car on car.cart_id=carpr.carts_cart_id where cart_id in (select carts_cart_id from order_)
group by product_id order by count(product_id) desc
limit 10;

select product_id, count (product_id) from products pr inner join cart_product carpr on
carpr.products_product_id=pr.product_id inner join carts car on car.cart_id=carpr.carts_cart_id group by product_id order by count(product_id) desc
limit 10;

select product_id from products pr inner join cart_product carpr on
carpr.products_product_id=pr.product_id inner join carts car on car.cart_id=carpr.carts_cart_id where cart_id not in
(select carts_cart_id from order_);


select * from products where product_id not in (select products_product_id from cart_product);

select categories.category_title, count(product_id) from products left join categories on

categories.category_id=products.category_id group by categories.category_title order by count(product_id) desc;

select first_name, last_name, middle_name, email from users order by city, first_name;

select first_name, email from users
where city='city 17'
union
select first_name, email from potential_customers
where city='city 17';

=

select users.first_name, users.email from users left join potential_customers on users.email=potential_customers.email
where users.city='city 17';

INSERT INTO  potential_customers (email, first_name, surname, second_name, city)
select email, first_name, last_name, middle_name, city  from users where users_id in
(SELECT user_user_id from carts where cart_id not in
 (SELECT carts_cart_id from order_));

CREATE table potential_customers (
id INTEGER generated always as identity,
email VARCHAR(255),
first_name VARCHAR(255),
surname VARCHAR(255),
second_name VARCHAR(255),
city VARCHAR(255),
	FOREIGN KEY (email, first_name, surname, second_name, city) REFERENCES users (email, first_name,
																				  last_name,
																				  middle_name,
																				 city))

SELECT MAX(total) from order_ where updated_at BETWEEN '2020-04-01' AND '2020-6-30';
SELECT AVG(total) from order_ where order_status_order_status_id=4;
SELECT * from carts where cart_id not in (SELECT carts_cart_id from order_);
SELECT * from order_ where order_status_order_status_id in (SELECT order_status FROM order_status where status_name not in ('Canceled', 'Finished')) and updated_at<='2020-12-31';
SELECT * from products where category_id in (SELECT category_id from categories where category_title in ('Category 7', 'Category 11', 'Category 18'));
SELECT * from order_ where (updated_at between '2020-1-1' and '2020-6-1') and (order_status_order_status_id='4');
SELECT * from order_ where created_at>'2020-10-1';
SELECT * from products WHERE price>80 and price<=150;
SELECT * from order_ WHERE order_status_order_status_id=(SELECT order_status from order_status WHERE status_name='Finished');
SELECT * FROM order_status
SELECT * FROM users;
SELECT * FROM products;
UPDATE products SET price=price*2;
ALTER TABLE users ALTER COLUMN phone_number TYPE VARCHAR;
ALTER TABLE users ADD COLUMN phone_number INT;


ALTER table users alter column city set not null; - установить ограничение для столбца в существующей таблице

ALTER TABLE users ADD UNIQUE (email, first_name, last_name, middle_name, city); - установка ограничений по нескольким полям одновременно