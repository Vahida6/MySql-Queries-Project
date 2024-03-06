# create a sp that can determine the market badge based on total sold quantity >5M as gold else silver#

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
	IN in_market varchar(45),
	IN in_fiscal_year year,
	OUT out_badge varchar(45)
   	)
BEGIN
	declare qty INT default 0;
	# to declare input parameter as default
    if in_market="" then 
    SET in_market = "INDIA";
    end if;
    
    #To reteive data from market by year#
    select 
	sum(sold_quantity) into qty
 from fact_sales_monthly s
join dim_customer c
on c.customer_code=s.customer_code
where get_fiscal_year(s.date)=in_fiscal_year and c.market=in_market
group by c.market;

If 
 qty>5000000 then 
 set out_badge="GOLD";
  else 
  set out_badge="SILVER";
  end if ;
END