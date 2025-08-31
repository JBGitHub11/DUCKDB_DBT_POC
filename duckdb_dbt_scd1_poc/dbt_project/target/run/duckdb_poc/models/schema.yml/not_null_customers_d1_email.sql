
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select email
from "duck_poc"."main"."customers_d1"
where email is null



  
  
      
    ) dbt_internal_test