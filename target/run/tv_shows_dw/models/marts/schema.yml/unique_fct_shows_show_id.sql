
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    show_id as unique_field,
    count(*) as n_records

from "tv_shows"."main_marts"."fct_shows"
where show_id is not null
group by show_id
having count(*) > 1



  
  
      
    ) dbt_internal_test