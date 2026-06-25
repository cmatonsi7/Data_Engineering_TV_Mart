
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select network_country
from "tv_shows"."main_marts"."dim_networks"
where network_country is null



  
  
      
    ) dbt_internal_test