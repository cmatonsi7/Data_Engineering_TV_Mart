
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from "tv_shows"."main_staging"."stg_shows"
    group by status

)

select *
from all_values
where value_field not in (
    'Running','Ended','To Be Determined','In Development'
)


