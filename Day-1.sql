create table customer(
    product_id int(10) primary key,
    prod_name varchar(20),
    color varchar(20),
    price int,
    quantity int
);
insert into customer (product_id,prod_name,color,price,quantity)
values (1,'onitsuka tiger shoes','white',1200,1),
(2,'onitsuka tiger shoes','black',1400,1),
(3,'campus shoes','white',1000,2),
(4,'puma shoes','grey',5000,1),
(5,'adidas shoes','white',4500,1);

select * from customer;
select prod_name from customer where price>4000;
select * from customer where color='white';
select * from customer where price between 1200 and 5000;
select * from customer where color in ('white','black');
select * from customer order by price asc;
select quantity,count(*) from customer group by quantity;
select quantity,count(*) from customer group by quantity having count(*)>0;
select * from customer limit 3;
select * from customer order by price desc limit 2;                                                                                                                                                                                                                                                                                                                                                                                                                          