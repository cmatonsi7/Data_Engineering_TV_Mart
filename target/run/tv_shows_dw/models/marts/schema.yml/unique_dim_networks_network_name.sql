
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    network_name as unique_field,
    count(*) as n_records

from "tv_shows"."main_marts"."dim_networks"
where network_name is not null
group by network_name
having count(*) > 1



  
  
      
    ) dbt_internal_test