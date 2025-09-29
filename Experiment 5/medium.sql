drop table transaction_data;

create table transaction_data 
(id int, val int)

insert into transaction_data
select 1, random()* 100000 from generate_series(1,1000000)

insert into transaction_data
select 2, random()* 100000 from generate_series(1,1000000)

select *
from transaction_data
where val = 10000;

create or replace view v_sales_summary 
as 
select count(*) as total_orders,
sum(val) as total_sales,
round(avg(val),2) as average_price
from
transaction_data;

explain analyze
select * from v_sales_summary;

create materialized view mv_sales_summary
as
select count(*) as total_orders,
sum(val) as total_sales,
round(avg(val),2) as average_price
from
transaction_data;

explain analyze
select * from mv_sales_summary;