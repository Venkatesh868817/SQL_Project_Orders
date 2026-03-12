use newschema;
select * from orders;

select * from 
orders where customer_name like '_a_d%';

select * from 
orders where  order_Date between '2020-12-01' and '2020-12-31';

select * from 
orders where (ship_mode='Standard Class' or ship_mode='First Class') and (ship_date  > '2020-11-01');

select * from 
orders where ( customer_name like 'a___%' or customer_name like '___n%');

select * from 
orders where profit <0 ;

select * from 
orders where quantity <3 or profit=0;

select * from 
orders where region ='South' and discount>0;

select * from orders order by sales desc limit 5;

select * from orders;

select * from 
orders where (category ='Technology' or category='Furniture') and (order_date between '2020-01-01' and '2020-12-01');

select * from 
orders where (order_date between '2020-01-01' and '2020-12-01') and ( ship_date between '2020-01-01' and '2020-12-01' );

update  orders
set city =null where order_id in ('CA-2020-161389' ,'US-2021-156909');
SET SQL_SAFE_UPDATES = 0;

select city from orders where order_id='CA-2020-161389' or order_id ='US-2021-156909';

select * from orders 
where city = null;

select category,
     sum(profit) as total_profit,
     min(order_date) as first_order_date,
     max(order_date) as latest_order_date
from orders
group by category;

select 
    category,
    avg(profit) as average_profit,
    max(profit) as maxprofit
from orders
group by category
having avg(profit) > (max(profit) / 2);

create table exams (
    student_id int,
    student_name varchar(50),
    physics int,
    chemistry int,
    maths int
);

insert into exams values
(1,'ravi',80,80,75),
(2,'sita',70,65,60),
(3,'arjun',90,90,85),
(4,'kiran',60,55,70);

select student_id, student_name, physics, chemistry
from exams
where physics = chemistry;

select * from orders;


select category,
       sum(quantity) as total_products
       from orders
       group by category ;

select category ,
     sum(quantity) as total_quantity_sold
from orders 
where  region='west'
group by category;

select region,
           sum(sales) as total_sales
from orders
 group by region;
 
 select region,
           count(sales) as total_sales
from orders
 group by region;
 
 select o.category,
       sum(o.sales) as total_sales
from orders o
left join returns r
on o.order_id = r.order_id
where r.order_id is null
group by o.category;




select o.city
from orders o
left join returns r
on o.order_id = r.order_id
group by o.city
having count(r.order_id) = 0;


show tables;

describe orders;
select * from returns limit 5;

select order_id 
from orders
group by order_id
having count(*)=1;

select order_id ,
datediff(ship_date, order_date) as shipping_days
from orders;

select category,
sum(sales) as total_sales
from orders
group by category;


select category,
sum(case when year(order_date)=2019 then sales else 0 end) as total_sales_2019,
sum(case when year(order_date)=2020 then sales else 0 end) as total_sales_2020
from orders
group by category;

select city,
avg(datediff(ship_date,order_date)) as avg_days
from orders
where region='west'
group by city
order by avg_days desc
limit 5;

select customer_name,
substring_index(customer_name,' ',1) as first_name,
substring(customer_name,length(substring_index(customer_name,' ',1))+2) as last_name
from orders;


select
customer_name,
length(customer_name) -
length(replace(lower(customer_name),'n','')) as count_of_occurence_of_n
from orders;


select 'category' as hierarchy_type,
category as hierarchy_name,
sum(case when region='west' then sales else 0 end) as west_sales,
sum(case when region='east' then sales else 0 end) as east_sales
from orders
group by category

union all

select 'sub_category',
sub_category,
sum(case when region='west' then sales else 0 end),
sum(case when region='east' then sales else 0 end)
from orders
group by sub_category

union all

select 'ship_mode',
ship_mode,
sum(case when region='west' then sales else 0 end),
sum(case when region='east' then sales else 0 end)
from orders
group by ship_mode;