
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sales_id
from "duck_poc"."main"."sales_with_customer"
where sales_id is null



  
  
      
    ) dbt_internal_test