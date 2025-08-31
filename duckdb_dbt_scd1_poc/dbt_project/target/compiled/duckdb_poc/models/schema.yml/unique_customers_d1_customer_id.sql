
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "duck_poc"."main"."customers_d1"
where customer_id is not null
group by customer_id
having count(*) > 1


