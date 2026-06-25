
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select status
from "tv_shows"."main_staging"."stg_shows"
where status is null



  
  
      
    ) dbt_internal_test