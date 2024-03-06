SELECT * FROM gdb0041.fact_sales_monthly;

#----90002002
select *from fact_sales_monthly where customer_code='90002002';
select *from fact_sales_monthly where customer_code='90002002';
select count( distinct product_code) from fact_sales_monthly where customer_code='90002002';

select *from fact_sales_monthly 
where customer_code='90002002' and 
get_fiscal_year(date)=2020
order by date asc;


##GROSS SALES MONTHLY REPORT###
#----month,product name,variant ,sold quantity,gross price per item ,gross price total

select fsm.date,fsm.sold_quantity,fsm.product_code,dp.product,
dp.variant,g.gross_price,
round(g.gross_price*fsm.sold_quantity,2) as gross_price_total from fact_sales_monthly fsm
join dim_product dp
on dp.product_code=fsm.product_code
join fact_gross_price g
on g.product_code=fsm.product_code and 
g.fiscal_year=get_fiscal_year(fsm.date)
where customer_code='90002002' and 
 get_fiscal_year(date)=2020
order by date asc;
