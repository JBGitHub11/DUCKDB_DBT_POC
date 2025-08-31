
    
    

select
    sales_id as unique_field,
    count(*) as n_records

from "duck_poc"."main"."fct_sales"
where sales_id is not null
group by sales_id
having count(*) > 1


