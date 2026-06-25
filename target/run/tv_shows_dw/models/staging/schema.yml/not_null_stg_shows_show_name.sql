
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select show_name
from "tv_shows"."main_staging"."stg_shows"
where show_name is null



  
  
      
    ) dbt_internal_test